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
            DateTime starttime = DateTime.Now.AddDays(-(day));
            DateTime endtime = DateTime.Now.AddDays(1);
            ViewData["pcxx"] = entities.ExportContracts.Where(v => v.ShipmentDate != null).Where(v => v.ShipmentDate >= starttime && v.ShipmentDate <= endtime).ToList();


            double day2 = BasicOperate.GetDouble(ConfigurationManager.AppSettings["collectionreminder"], true);
            DateTime starttime2 = DateTime.Now.AddDays(-(day2));
            DateTime endtime2 = DateTime.Now.AddDays(1);
            ViewData["skts"] = entities.Invoice.Where(v => v.OceanDate != null).Where(v => v.OceanDate >= starttime && v.OceanDate <= endtime).ToList();//提单日期
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
