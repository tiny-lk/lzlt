using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using System.Web;
using System.Web.Security;
using System.Configuration;

namespace LZL.ForeignTrade.Controllers
{
    public class InvoiceController : Controller
    {
        public ActionResult Add()
        {
            return View();
        }
        public ActionResult Index()
        {
            int pagecount = 1;
            var querylist = DataHelper.GetInvoices(string.Empty, string.Empty, 1, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }

        public ActionResult ProductSummaryIndex2(string invovceId)
        {
            Entities entities = new Entities();
            Guid guid = new Guid(invovceId);
            var invoice = entities.Invoice.Where(v => v.ID.Equals(guid)).ToList();
            var productSummary = invoice.Select(v => v.ProductSummary);
            ViewData["pagecount"] = productSummary.Count();
            return View(productSummary);
        }

        public ActionResult Details(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Invoice.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        public ActionResult Delete(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var invoice = entities.Invoice.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                invoice.ProductPack.Load();
                var count = invoice.ProductPack.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(invoice.ProductPack.ElementAt(0));
                }

                invoice.ProductSummary.Load();
                count = invoice.ProductSummary.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(invoice.ProductSummary.ElementAt(0));
                }
                entities.DeleteObject(invoice);
            }
            entities.SaveChanges();
            return RedirectToAction("Index", new { page = 1 });
        }

        public ActionResult Edit(string id)
        {
            string[] rolelist = Roles.GetRolesForUser();
            if (rolelist.Length > 0)
            {
                for (int temp = 0; temp < rolelist.Length; temp++)
                {
                    string sql = @"SELECT count(*)
FROM (SELECT StepId, RoleId,
                  (SELECT RoleName
                 FROM aspnet_Roles
                 WHERE (RoleId = RoleInStep.RoleId)) AS RoleName
        FROM RoleInStep
        WHERE (StepId =
                  (SELECT ID
                 FROM Step
                 WHERE (Name = '发票单证管理填写 ')))) AS derivedtbl_1
WHERE ('" + rolelist[temp] + "' IN (RoleName))";
                    object obj = SqlHelper.ExecuteScalar(ConfigurationManager.ConnectionStrings["FTConnection"].ToString(), System.Data.CommandType.Text, sql);

                    if (Convert.ToInt32(obj) > 0)
                    {
                        ViewData["IsWrite"] = "true";
                        return Details(id);
                    }
                }
            }
            ViewData["IsWrite"] = "false";
            return Details(id);
        }

        public ActionResult Copy(string id)
        {
            string gid = Guid.NewGuid().ToString().ToLower();
            string sql = @"INSERT INTO Invoice
                        SELECT     '" + gid + @"', Name, Date, ExportContractsName, RevocationNo, CurrencyType, PriceClause, PriceClauseNote, ClauseType, ClauseTypeNote, Trade, 
                        CustomerID, CompanyID, CreditCardNo, AccountBank, AccountDate, ShipmentDate, ValidDate, TansportCountry, StartHaven, EdnHaven, TransferHaven, 
                        TransportMode, FreightPayment, IsBatches, IsTransfer, Mark, Type, CreditAmount, TotalSalesAmount, TotalPackAmount, TotalPackUnitEN, TotalPackGrossWeight, 
                        TotalPackNetWeight, TotalPackBulk, TotalProductAmount, TotalUnit, TotalDifferentUnit, Note, InvoiceItem, BoxItem, OceanNo, OceanDate, Shipper, Consignee, 
                        CircularizeMan, ReceivingAddress, FlightNo, OceanCount, OceanFreightPayment, FreightAmount, OneProcessName, TwoProcessName, OceanDeputy, 
                        OceanTansportCountry, OceanStartHaven, OceanEdnHaven, OceanTransferHaven, OceanNote, getdate(), EditDate, Version
                        FROM         Invoice AS Invoice_1
                        WHERE     (ID = '" + id + "')";
            SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["FTConnection"].ToString(), System.Data.CommandType.Text, sql);
            sql = @"insert into ProductSummary SELECT newid(), '" + gid + @"', PriceID, ExportContractsID, StockContractsID, ProductID, CustomsCode, PurchasePrice, Amount, UnitEN, ExportPrice, RMBExportAmount, ExportAmount, 
                        DescriptionEN, Note, CreateDate, EditDate, PurchaseTotalPrice, ProductAmount, SingleProductAmount, PieceAmount, PackUnitEN, PackUnitCH, PackLength, 
                        PackWidth, PackHeight, SinglePackBulk, PackBulk, InsideProductAmount, SingleInsidePiece, InsideUnitEN, InsideUnitCN, SingleGrossWeight, SingleNetWeight, 
                        GrossWeight, NetWeight
                        FROM         ProductSummary
                        WHERE     (InvoiceID = '" + id + "')";
            SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["FTConnection"].ToString(), System.Data.CommandType.Text, sql);
            return RedirectToAction("Index", new { page = 1 });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("Index");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("Index");
        }

        /// <summary>
        /// 商业发票打印
        /// </summary>
        /// <param name="id">打印的ID</param>
        /// <returns></returns>
        public ActionResult BusinessInvoice(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                string path = Server.MapPath("~/DocTemplate/Template/invoice.doc");
                string targetpath = Server.MapPath("~/DocTemplate/Print/");
                string filename = string.Empty;
                byte[] tempbuffer = LZL.ForeignTrade.Controllers.WordInvoiceHelper.Instance.BuilderInvoice(new Guid(id), path, targetpath, out filename);
                Response.AppendHeader("Content-Disposition", "inline;filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
                return File(tempbuffer, "application/vnd.ms-word", HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
            }
            return null;
        }
        /// <summary>
        /// 装箱单生成和打印
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult PackingList(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                string path = Server.MapPath("~/DocTemplate/Template/packinglist.doc");
                string targetpath = Server.MapPath("~/DocTemplate/Print/");
                string filename = string.Empty;
                byte[] tempbuffer = LZL.ForeignTrade.Controllers.WordInvoiceHelper.Instance.BuilderPackingList(new Guid(id), path, targetpath, out filename);
                Response.AppendHeader("Content-Disposition", "inline;filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
                return File(tempbuffer, "application/vnd.ms-word", HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
            }
            return null;
        }
        //报关单信息
        public ActionResult Declaration(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                string path = Server.MapPath("~/DocTemplate/Template/Declaration.xls");
                string targetpath = Server.MapPath("~/DocTemplate/Print/");
                string filename = string.Empty;
                byte[] tempbuffer = LZL.ForeignTrade.Controllers.WordInvoiceHelper.Instance.BuilderDeclaration(new Guid(id), path, targetpath, out filename);
                Response.AppendHeader("Content-Disposition", "inline;filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
                return File(tempbuffer, "application/vnd.ms-excel", HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
            }
            return null;
        }

        //出口货物明细单明细
        public ActionResult Ckhwmxd(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                string path = Server.MapPath("~/DocTemplate/Template/Ckhwmxd.doc");
                string targetpath = Server.MapPath("~/DocTemplate/Print/");
                string filename = string.Empty;
                byte[] tempbuffer = LZL.ForeignTrade.Controllers.WordInvoiceHelper.Instance.BuilderCkhwList(new Guid(id), path, targetpath, out filename);
                Response.AppendHeader("Content-Disposition", "inline;filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
                return File(tempbuffer, "application/vnd.ms-word", HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
            }
            return null;
        }
    }
}