using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;

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

                exportContracts.ExportContractsPrice.Load();
                var count = exportContracts.ExportContractsPrice.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(exportContracts.ExportContractsPrice.ElementAt(0));
                }

                exportContracts.ProductSummary.Load();
                count = exportContracts.ProductSummary.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(exportContracts.ProductSummary.ElementAt(0));
                }

                exportContracts.StockContractsExportContracts.Load();
                count = exportContracts.StockContractsExportContracts.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(exportContracts.StockContractsExportContracts.ElementAt(0));
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

        public ActionResult PackingList(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                string path = Server.MapPath("~/DocTemplate/Template/ExportContracts.doc");
                string targetpath = Server.MapPath("~/DocTemplate/Print/");
                byte[] tempbuffer = LZL.ForeignTrade.Controllers.ExportContractsHelper.Instance.BuilderPackingList(new Guid(id), path, targetpath);
                Response.AppendHeader("Content-Disposition", "inline;filename=test.doc");
                return File(tempbuffer, "application/ms-word", "test.doc");
            }
            return null;
        }
    }
}
