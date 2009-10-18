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
    public class WarehouseController:Controller
    {
        /// <summary>
        /// 管理首页
        /// </summary>
        /// <returns></returns>
        public ActionResult WarehouseManager(string quyerCondition, string queryvalue, int? page)
        {
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetWarehouseManager(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }

        /// <summary>
        /// 原材料存储
        /// </summary>
        /// <returns></returns>
        public ActionResult MaterialBuy(string quyerCondition, string queryvalue, int? page)
        {
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetMaterialBuy(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }

        /// <summary>
        /// Adds the materia.
        /// </summary>
        /// <returns></returns>
        public ActionResult AddMateria()
        {            
            return View();
        }

        /// <summary>
        /// Adds the materia.
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddMateria(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
            {
                return View();
            }

            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("MaterialBuy");
        }

        public ActionResult DetailsMateria(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.MaterialBuy.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the materia.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult EditMateria(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.MaterialBuy.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the dictionary.---add by lj
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditMateria(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("MaterialBuy");
        }

        /// <summary>
        /// Deletes the specified id.---add by lj
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteMateria(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.MaterialBuy.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("MaterialBuy", new { page = 1 });
        }

        /// <summary>
        /// 辅料存储
        /// </summary>
        /// <returns></returns>
        public ActionResult AccessoriesBuy(string quyerCondition, string queryvalue, int? page)
        {
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetAccessoriesBuy(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }

        /// <summary>
        /// Adds the materia.
        /// </summary>
        /// <returns></returns>
        public ActionResult AddAccessories()
        {
            return View();
        }

        /// <summary>
        /// Adds the materia.
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddAccessories(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
            {
                return View();
            }
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("AccessoriesBuy");
        }

        public ActionResult DetailsAccessories(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.AccessoriesBuy.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the accessories.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult EditAccessories(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.AccessoriesBuy.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the dictionary.---add by lj
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditAccessories(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("AccessoriesBuy");
        }

        /// <summary>
        /// Deletes the specified id.---add by lj
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteAccessories(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.AccessoriesBuy.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("AccessoriesBuy", new { page = 1 });
        }

        /// <summary>
        /// 库存销货
        /// </summary>
        /// <returns></returns>
        public ActionResult WarehouseSale(string quyerCondition, string queryvalue, int? page)
        {
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetWarehouseSale(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }

        public ActionResult DetailsWarehouseSale(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.WarehouseSale.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the warehouse sale.
        /// </summary>
        /// <returns></returns>
        public ActionResult EditWarehouseSale(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.WarehouseSale.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditWarehouseSale(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("WarehouseSale");
        }

        /// <summary>
        /// Deletes the specified id.---add by lj
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteWarehouseSale(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.WarehouseSale.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("WarehouseSale", new { page = 1 });
        }

        public ActionResult AddWarehouseSale(string id, int? type)
        {
            ViewData["id"] = id;
            if (type == 0)
            {
                ViewData["FK"]="AccessoriesBuy";
            }
            else
            {
                ViewData["FK"] = "MaterialBuy";
            }
            ViewData["number"] = 1;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddWarehouseSale(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("WarehouseSale");
        }

    }
}
