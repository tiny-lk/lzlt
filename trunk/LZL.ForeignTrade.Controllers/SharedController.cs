using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using ZhouBo.Core;
using System.Data.Objects.DataClasses;
using System.Data.Objects;

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

        public static void mainTable(FormCollection formvalues, ObjectContext entities)
        {
            var regions = formvalues["region"].Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            Guid id = System.Guid.NewGuid();
            var fkregions = (from temp in formvalues.AllKeys
                             where temp.Contains("♂")
                             let v = temp.Substring(temp.LastIndexOf("♂")+1)
                             where v != null && v.Equals("fk", StringComparison.CurrentCultureIgnoreCase)
                             select temp).ToArray();
            for (int i = 0; i < regions.Length; i++)//
            {
                var regioncount = BasicOperate.GetInt(formvalues[regions[i] + "regioncount"], true); //获取区域中存在几个。
                if (regioncount > 0)
                {
                    continue;
                }
                var regionnames = (from temp in formvalues.AllKeys
                                   where temp.Contains("♂") &&
                                       temp.Substring(0, temp.IndexOf("♂") + 1).Equals(regions[i], StringComparison.CurrentCultureIgnoreCase)
                                   select temp).ToArray();

                object tableobj = null;
                if (!string.IsNullOrEmpty(formvalues[regions[i] + "objectname"]))
                {
                    tableobj = ClassHelper.CreateInstance(Type.GetType(formvalues[regions[i] + "objectname"]));//对象方式；
                }

                for (int j = 0; j < regionnames.Length; j++)
                {
                    if (!((regions[i] + "regioncount").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (regions[i] + "objectname").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (regions[i] + "fk").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         regions[i].Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase)))
                    {
                        if (tableobj != null)
                        {
                            string propertyName = regionnames[j].Replace(regions[i], "").Trim();
                            BuilderObject(propertyName, ClassHelper.ChangeType(formvalues[regionnames[j]], tableobj.GetType().GetProperty(propertyName).PropertyType), tableobj);
                        }
                        else
                        {
                            //如果等于数据库的情况
                        }
                    }
                }
                if (tableobj != null)
                {
                    var propertyinfo = (from p in tableobj.GetType().GetProperties(System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Public)
                                        where p.GetGetMethod(false) != null
                                        let attribute = (EdmScalarPropertyAttribute)Attribute.GetCustomAttribute(p, typeof(EdmScalarPropertyAttribute))
                                        where attribute != null && attribute.EntityKeyProperty
                                        select p).FirstOrDefault();
                    if (propertyinfo != null)
                    {
                        if (propertyinfo.PropertyType.FullName.Equals("System.Guid", StringComparison.CurrentCultureIgnoreCase))
                        {
                            ClassHelper.SetPropertyValue(tableobj, propertyinfo.Name, id);
                        }
                    }
                    entities.AddObject(tableobj.GetType().Name, tableobj);

                    for (int f = 0; f < fkregions.Length; f++)
                    {
                        if (formvalues[fkregions[f]].Equals(tableobj.GetType().Name, StringComparison.CurrentCultureIgnoreCase))
                        {
                            childTable(formvalues, tableobj, entities, fkregions[f].Substring(0, fkregions[f].IndexOf("♂") + 1));
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 处理子表数据录入
        /// </summary>
        /// <param name="from">子表信息</param>
        /// <param name="parentobject">父亲对象（父表ID）</param>
        /// <param name="regions">子表所在区域</param>
        /// <param name="entities">数据库对象</param>
        public static void childTable(FormCollection from, object parentobject, ObjectContext entities, string region)
        {
            var regioncount = BasicOperate.GetInt(from[region + "regioncount"], true); //获取区域中存在多个，表示是子表。
            if (regioncount <= 0)
            {
                return;
            }
            var regionnames = from.AllKeys.Where(v => v.Substring(0, v.IndexOf("♂") + 1).Equals(region, StringComparison.CurrentCultureIgnoreCase)).ToArray();
            for (int s = 0; s < regioncount; s++)// 表示存在几个子表
            {
                object tableobj = null;
                if (!string.IsNullOrEmpty(from[region + "objectname"]))
                {
                    tableobj = ClassHelper.CreateInstance(Type.GetType(from[region + "objectname"]));
                }
                for (int j = 0; j < regionnames.Length; j++)
                {
                    if (!((region + "regioncount").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (region + "objectname").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (region + "fk").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         region.Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase)))
                    {
                        if (tableobj != null)
                        {
                            string propertyName = regionnames[j].Replace(region, "").Trim();
                            BuilderObject(propertyName, ClassHelper.ChangeType(from[regionnames[j]].Split(new[] { ',' })[s],
                                tableobj.GetType().GetProperty(propertyName).PropertyType), tableobj);
                        }
                        else
                        {
                            //如果等于数据库的情况
                        }
                    }
                }
                if (tableobj != null)
                {
                    var propertyinfo = (from p in tableobj.GetType().GetProperties(System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Public)
                                        where p.GetGetMethod(false) != null
                                        let attribute = (EdmScalarPropertyAttribute)Attribute.GetCustomAttribute(p, typeof(EdmScalarPropertyAttribute))
                                        where attribute != null && attribute.EntityKeyProperty
                                        select p).FirstOrDefault();
                    if (propertyinfo != null)
                    {
                        if (propertyinfo.PropertyType.FullName.Equals("System.Guid", StringComparison.CurrentCultureIgnoreCase))
                        {
                            ClassHelper.SetPropertyValue(tableobj, propertyinfo.Name, System.Guid.NewGuid());
                        }
                    }
                    ClassHelper.SetPropertyValue(tableobj, parentobject.GetType().Name, parentobject);
                    entities.AddObject(tableobj.GetType().Name, tableobj);
                }
            }
        }

        private static void BuilderObject(string name, object value, object o)
        {
            ClassHelper.SetPropertyValue(o, name, value);
        }
    }
}
