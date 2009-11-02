using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using System.Configuration;

namespace LZL.ForeignTrade.Controllers
{
    [HandleError]
    public class PriceController : Controller
    {
        public ActionResult Add()
        {
            return View();
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

        public ActionResult Index()
        {
            int pagecount = 1;
            var querylist = DataHelper.GetPrices(string.Empty, string.Empty, 1, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }

        public ActionResult Details(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Price.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        public ActionResult Delete(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var price = entities.Price.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                price.ProductSummary.Load();
                var count = price.ProductSummary.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(price.ProductSummary.ElementAt(0));
                }
                price.ExportContractsPrice.Load();
                count = price.ExportContractsPrice.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(price.ExportContractsPrice.ElementAt(0));
                }
                price.ProductPack.Load();
                count = price.ProductPack.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(price.ProductPack.ElementAt(0));
                }

                entities.DeleteObject(price);
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

    }
}
