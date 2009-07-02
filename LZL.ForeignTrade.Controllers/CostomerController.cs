﻿using System;
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
namespace LZL.ForeignTrade.Controllers
{
    public class CostomerController : Controller
    {
        /// <summary>
        /// 客户管理首页
        /// </summary>
        /// <returns></returns>
        /// <param name="page">页码</param>
        /// <param name="w">查询条件</param>
        public ActionResult Index(int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)Getcount(page, "NameCode", "")) / pagesize);
            var customers = _Entities.Customer.OrderBy(v => v.NameCode).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(customers);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(string quyerCondition, string queryvalue)
        {
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)Getcount(1, quyerCondition, queryvalue)) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Customer as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where it." + quyerCondition + " like '" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + 0 + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Customer>(sql).ToList();
            return View(querylist);
        }

        private int Getcount(int? page, string quyerCondition, string queryvalue)
        {
            Entities entities = new Entities();
            string sql = "select value Count(it." + quyerCondition + ") from " + entities.DefaultContainerName + ".Customer as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where it." + quyerCondition + " like '" + queryvalue + "%'";
            }
            var count = entities.CreateQuery<int>(sql).FirstOrDefault();
            return count;
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

    }
}