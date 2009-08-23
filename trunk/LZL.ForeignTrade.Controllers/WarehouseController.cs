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
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "No", "", "WarehouseStore")) / pagesize);
            var warehouseStore = _Entities.WarehouseStore.OrderBy(v => v.No).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(warehouseStore);
        }

        /// <summary>
        /// 原材料存储
        /// </summary>
        /// <returns></returns>
        public ActionResult MateriaBuy(string quyerCondition, string queryvalue, int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "YclNo", "", "MaterialBuy")) / pagesize);
            var companys = _Entities.MaterialBuy.OrderBy(v => v.YclNo).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(companys);
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
            return RedirectToAction("MateriaBuy");
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
            return RedirectToAction("MateriaBuy");
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
            return RedirectToAction("MateriaBuy", new { page = 1 });
        }

        /// <summary>
        /// 辅料存储
        /// </summary>
        /// <returns></returns>
        public ActionResult AccessoriesBuy(string quyerCondition, string queryvalue, int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "AccessoriesNo", "", "AccessoriesBuy")) / pagesize);
            var companys = _Entities.AccessoriesBuy.OrderBy(v => v.AccessoriesNo).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(companys);
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
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "SaleNo", "", "WarehouseSale")) / pagesize);
            var companys = _Entities.WarehouseSale.OrderBy(v => v.SaleNo).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(companys);
        }

        /// <summary>
        /// Adds the warehouse sale.
        /// </summary>
        /// <returns></returns>
        public ActionResult AddWarehouseSale()
        {
            return View();
        }

        /// <summary>
        /// Edits the warehouse sale.
        /// </summary>
        /// <returns></returns>
        public ActionResult EditWarehouseSale()
        {
            return View();
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
    }
}
