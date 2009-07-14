using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;

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
        public ActionResult Add(Price price,Customer customer)
        {
            //Price price = new Price();
            ////UpdateModel<Price>(
            //UpdateModel(price, form.ToValueProvider());
            return RedirectToAction("Index");
        }
        public ActionResult Index()
        {
            return View();
        }
    }
}
