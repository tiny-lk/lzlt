using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using System.Configuration;
using ZhouBo.Core;

namespace LZL.ForeignTrade.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        /// <summary>
        /// 首页
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            Entities entities = new Entities();
            double day = BasicOperate.GetDouble(ConfigurationManager.AppSettings["departreminder"], true);
            DateTime starttime = DateTime.Now.AddDays(-(day+1));
            DateTime endtime = DateTime.Now.AddDays(1);
            ViewData["pcxx"] = entities.ExportContracts.Where(v => v.ShipmentDate >= starttime && v.ShipmentDate <= endtime).ToList();
            return View();
        }

        /// <summary>
        /// 关于
        /// </summary>
        /// <returns></returns>
        public ActionResult About()
        {
            return View();
        }
    }
}
