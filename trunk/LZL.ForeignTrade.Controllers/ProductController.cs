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
    public class ProductController : Controller
    {
        public ActionResult Index()
        {
            int pagecount = 1;
            var querylist = DataHelper.GetProducts(string.Empty, string.Empty, 1, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }
        /// <summary>
        /// 返回添加页面
        /// </summary>
        /// <returns></returns>
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
            return View(_Entities.Product.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        public ActionResult Delete(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var product = entities.Product.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                product.ProductCustomer.Load();
                for (int s = 0; s < product.ProductCustomer.Count; s++)
                {
                    entities.DeleteObject(product.ProductCustomer.ElementAt(s));
                }
                entities.DeleteObject(product);
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
    }
}
