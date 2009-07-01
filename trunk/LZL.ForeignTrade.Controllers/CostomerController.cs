using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using System.Configuration;
using System.Data;
using System.Data.Objects.DataClasses;
using ZhouBo.Core;
namespace LZL.ForeignTrade.Controllers
{
    public class CostomerController : Controller
    {
        /// <summary>
        /// 客户管理首页
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            var customers = _Entities.Customer.OrderBy(v=>v.NameCode).Skip(pagesize * page ?? 0).Take(pagesize).ToList();
            return View(customers);
        }

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

    }
}
