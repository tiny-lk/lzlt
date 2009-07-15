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

        [AcceptVerbs("Post", "Get")]
        public ActionResult Index(string quyerCondition, string queryvalue, int? page)
        {
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "Price")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Price as it ";
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
            var querylist = entities.CreateQuery<Price>(sql).ToList();
            return View(querylist);
        }

    }
}
