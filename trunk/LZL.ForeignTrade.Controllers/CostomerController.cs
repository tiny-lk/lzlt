using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using System.Configuration;
using System.Data;
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
            int pagesize =int.Parse( ConfigurationManager.AppSettings["pagenumber"]);
            List<Customer> customers = _Entities.Customer.OrderBy(v=>v.NameCode).Skip(pagesize * page ?? 1).Take(pagesize).ToList();
            return View(customers);
        }

        public ActionResult Add()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(FormCollection formvalues)
        {
            SharedController.childTable(formvalues, "");
            return RedirectToAction("Index");
        }

    }
}
