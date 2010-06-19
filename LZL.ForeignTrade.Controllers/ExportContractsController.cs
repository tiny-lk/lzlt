using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using System.Web;

namespace LZL.ForeignTrade.Controllers
{
    public class ExportContractsController : Controller
    {
        public ActionResult Index()
        {
            int pagecount = 1;
            var querylist = DataHelper.GetExportContracts(string.Empty, string.Empty, 1, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }
        public ActionResult Add()
        {
            return View();
        }
        public ActionResult Edit(string id)
        {
            return Details(id);
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

        public ActionResult Details(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.ExportContracts.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        public ActionResult Delete(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var exportContracts = entities.ExportContracts.Where(v => v.ID.Equals(guid)).FirstOrDefault();

                exportContracts.ProductPack.Load();
                var count = exportContracts.ProductPack.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(exportContracts.ProductPack.ElementAt(0));
                }

                exportContracts.ProductSummary.Load();
                count = exportContracts.ProductSummary.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(exportContracts.ProductSummary.ElementAt(0));
                }

                exportContracts.InvoiceExportContracts.Load();
                count = exportContracts.InvoiceExportContracts.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(exportContracts.InvoiceExportContracts.ElementAt(0));
                }

                exportContracts.ExportContractsPrice.Load();
                count = exportContracts.ExportContractsPrice.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(exportContracts.ExportContractsPrice.ElementAt(0));
                }

                entities.DeleteObject(exportContracts);
            }
            entities.SaveChanges();
            return RedirectToAction("Index", new { page = 1 });
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


        public ActionResult Sales(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                string path = Server.MapPath("~/DocTemplate/Template/exportcontracts.doc");
                string targetpath = Server.MapPath("~/DocTemplate/Print/");
                string filename = string.Empty;
                byte[] tempbuffer = ExportContractsHelper.Instance.BuilderSales(new Guid(id), path, targetpath, out filename);
                Response.AppendHeader("Content-Disposition", "inline;filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
                return File(tempbuffer, "application/ms-word", HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
            }
            return null;
        }
    }
}
