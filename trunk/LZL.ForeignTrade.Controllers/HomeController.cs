using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
            ViewData["Message"] = "欢迎进入诚诺外贸管理系统！";

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
