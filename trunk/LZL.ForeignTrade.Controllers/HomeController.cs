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
        public ActionResult Index()
        {
            ViewData["Message"] = "欢迎进入LZL Foreign Trade！";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
