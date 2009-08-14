using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace LZL.ForeignTrade.Controllers
{
    [HandleError]
    public class WarehouseController:Controller
    {
        /// <summary>
        /// 管理首页
        /// </summary>
        /// <returns></returns>
        public ActionResult WarehouseManager()
        {
           return View();
        }

        /// <summary>
        /// Accessorieses the buy.
        /// </summary>
        /// <returns></returns>
        public ActionResult AccessoriesBuy()
        {
            return View();
        }

        /// <summary>
        /// Accessorieses the sale.
        /// </summary>
        /// <returns></returns>
        public ActionResult AccessoriesSale()
        {
            return View();
        }

        /// <summary>
        /// Materias the buy.
        /// </summary>
        /// <returns></returns>
        public ActionResult MateriaBuy()
        {
            return View();
        }

        /// <summary>
        /// Materias the sale.
        /// </summary>
        /// <returns></returns>
        public ActionResult MateriaSale()
        {
            return View();
        }
    }
}
