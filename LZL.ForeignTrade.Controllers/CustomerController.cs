using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using System.Configuration;
using System.Data;
using System.Data.Objects.DataClasses;
using ZhouBo.Core;
using System.Data.Objects;
using System.Data.Common;
namespace LZL.ForeignTrade.Controllers
{
    public class CustomerController : Controller
    {
        /// <summary>
        /// 客户管理首页
        /// </summary>
        /// <returns></returns>
        /// <param name="page">页码</param>
        /// <param name="w">查询条件</param>
        public ActionResult Index()
        {
            int pagecount = 1;
            var querylist = DataHelper.GetCustomers(string.Empty, string.Empty, 1, string.Empty, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);

        }

        public ActionResult Add()
        {
            return View();
        }

        public ActionResult Details(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Customer.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Customer.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var customer = entities.Customer.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                customer.Linkman.Load();
                customer.Memorandum.Load();
                customer.ProductCustomer.Load();
                var count = customer.ProductCustomer.Count;
                for (int s = 0; s < count; s++)
                {
                    entities.DeleteObject(customer.ProductCustomer.ElementAt(0));
                }
                entities.DeleteObject(customer);
            }
            entities.SaveChanges();
            return RedirectToAction("Index", new { page = 1 });
        }
    }
}
