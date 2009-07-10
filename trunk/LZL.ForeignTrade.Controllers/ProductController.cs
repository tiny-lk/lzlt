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
        [AcceptVerbs("Post","Get")]
        public ActionResult Index(string quyerCondition, string queryvalue,int? page)
        {
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "Product")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Product as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where it." + quyerCondition + " like '" + queryvalue + "%'";
            }
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "ID";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + pagesize * ((page ?? 1) - 1) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Product>(sql).ToList();
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
