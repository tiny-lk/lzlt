using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;

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
                invoice.InvoiceExportContracts.Load();
                var count = invoice.InvoiceExportContracts.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(invoice.InvoiceExportContracts.ElementAt(0));
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
        public FileContentResult BusinessInvoice(string id)
        {

            string path = Server.MapPath("~/DocTemplate/Template/invoice.doc");
            string targetpath = Server.MapPath("~/DocTemplate/Print/");
            WordInvoiceHelper.Instance.BuilderInvoice(new Guid(id), path, targetpath);
            return null;
        }

    }
}
