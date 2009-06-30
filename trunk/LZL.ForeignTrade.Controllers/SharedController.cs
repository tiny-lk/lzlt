using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using ZhouBo.Core;

namespace LZL.ForeignTrade.Controllers
{
    public class SharedController : Controller
    {

        /// <summary>
        /// 获取联系人控件信息
        /// </summary>
        /// <param name="number">显示数量</param>
        /// <param name="name">控件名称</param>
        /// <returns>返回联系人控件信息</returns>
        public ActionResult GetShareControl(string name, int? number)
        {
            ViewData["number"] = number ?? 1;
            return View(name);
        }

        /// <summary>
        /// 处理子表数据录入
        /// </summary>
        /// <param name="from">子表信息</param>
        /// <param name="fkid">主表ID</param>
        public static void childTable(FormCollection from,string fkid)
        {
            //表示存在子表信息
            if (string.IsNullOrEmpty(from["region"]))
            {

                Entities entities = new Entities();
            }
        }
        
    }
}
