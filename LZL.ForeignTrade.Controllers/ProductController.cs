using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace LZL.ForeignTrade.Controllers
{
    [HandleError]
    public class ProductController : Controller
    {
        public ActionResult Index(int? page)
        {
            return View();
        }
    }
}
