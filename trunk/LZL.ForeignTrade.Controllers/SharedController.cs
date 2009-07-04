using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using LZL.ForeignTrade.DataEntity;
using ZhouBo.Core;
using System.Data.Objects.DataClasses;
using System.Data.Objects;
using System.Data.Common;
using System.Linq.Expressions;

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
            return View(name,null);
        }

        public JsonResult GetAutocompleteValue(string t, string f)
        {
            Entities entities = new Entities();
            string sql = "set(select value it." + f + " from " + entities.DefaultContainerName + "." + t + " as it where it." + f + " like '" + Request["q"] + "%'";
            sql += " order by it." + f;
            sql += " Skip 0 limit 20 )";
            ObjectQuery<string> querylist = entities.CreateQuery<string>(sql);
            return Json(querylist);
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

                EntityObject tableobj = null;
                if (!string.IsNullOrEmpty(formvalues[regions[i] + "objectname"]))
                {
                    if (!string.IsNullOrEmpty(formvalues[regions[i] + "id"]))
                    {
                        string sql = "select value it from " + entities.DefaultContainerName + "." + regions[i].Substring(0, regions[i].LastIndexOf("♂")) + " as it ";
                        sql += " where it.ID=Guid'" + formvalues[regions[i] + "id"] + "'";
                        tableobj = entities.CreateQuery<EntityObject>(sql).FirstOrDefault();
                    }
                    else
                    {
                        tableobj = ClassHelper.CreateInstance(Type.GetType(formvalues[regions[i] + "objectname"])) as EntityObject;//对象方式；
                    }
                }

                for (int j = 0; j < regionnames.Length; j++)
                {
                    if (!((regions[i] + "regioncount").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (regions[i] + "objectname").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (regions[i] + "fk").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (regions[i] + "id").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         regions[i].Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase)))
                    {
                        if (tableobj != null)
                        {
                            if (!string.IsNullOrEmpty(formvalues[regionnames[j]]))
                            {
                                string propertyName = regionnames[j].Replace(regions[i], "").Trim();
                                BuilderObject(propertyName, ClassHelper.ChangeType(formvalues[regionnames[j]], tableobj.GetType().GetProperty(propertyName).PropertyType), tableobj);
                            }
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
                            if (string.IsNullOrEmpty(formvalues[regions[i] + "id"]))
                            {
                                ClassHelper.SetPropertyValue(tableobj, propertyinfo.Name, id);
                            }
                            else
                            {
                                id = new Guid(formvalues[regions[i] + "id"]);
                            }
                        }
                    }
                    if (string.IsNullOrEmpty(formvalues[regions[i] + "id"]))
                    {
                        entities.AddObject(tableobj.GetType().Name, tableobj);
                    }
                    for (int f = 0; f < fkregions.Length; f++)
                    {
                        if (formvalues[fkregions[f]].Equals(tableobj.GetType().Name, StringComparison.CurrentCultureIgnoreCase))
                        {
                            string childregionname = fkregions[f].Substring(0, fkregions[f].IndexOf("♂") + 1);
                            var childregioncount = BasicOperate.GetInt(formvalues[childregionname + "regioncount"], true); //获取区域中存在多个，表示是子表。
                            if (childregioncount == 0 && !string.IsNullOrEmpty(formvalues[regions[i] + "id"]))//表示所有的子被删除
                            {
                                (ClassHelper.GetPropertyValue(tableobj, "Linkman") as EntityCollection<EntityObject>).Load();
                                string esql = @"select value TargetEntity from (select value x from " + entities.DefaultContainerName + ".[FK_LINKMAN_CUSTOMER] AS x where ";
                                esql += " Key(x." + tableobj.GetType().Name + ") = row(@EntityKeyValue)) AS EntityKey ";
                                esql += " inner join " + entities.DefaultContainerName + "." + childregionname.Substring(0, childregionname.IndexOf("♂")) + " AS TargetEntity on Key(EntityKey." + childregionname.Substring(0, childregionname.IndexOf("♂")) + ") = Key(Ref(TargetEntity))";
                                ObjectQuery<EntityObject> query = entities.CreateQuery<EntityObject>(esql, new ObjectParameter("EntityKeyValue", id));
                            }
                            else
                            {
                                childTable(formvalues, tableobj, entities, childregionname, id);
                            }
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
        /// <param name="pid">父ID</param>
        private static void childTable(FormCollection formvalues, EntityObject parentobject, ObjectContext entities, string region, object pid)
        {
            var regioncount = BasicOperate.GetInt(formvalues[region + "regioncount"], true); //获取区域中存在多个，表示是子表。
            if (regioncount <= 0)
            {
                return;
            }

            StringBuilder guidBuilder = new StringBuilder();
            var regionnames = formvalues.AllKeys.Where(v => v.Substring(0, v.IndexOf("♂") + 1).Equals(region, StringComparison.CurrentCultureIgnoreCase)).ToArray();
            for (int s = 0; s < regioncount; s++)// 表示存在几个子表
            {
                EntityObject tableobj = null;
                if (!string.IsNullOrEmpty(formvalues[region + "objectname"]))
                {
                    if (!string.IsNullOrEmpty(formvalues[region + "id"].Split(new[] { ',' })[s]))
                    {
                        string sql = "select value it from " + entities.DefaultContainerName + "." + region.Substring(0, region.LastIndexOf("♂")) + " as it ";
                        sql += " where it.ID=Guid'" + formvalues[region + "id"].Split(new[] { ',' })[s] + "'";
                        tableobj = entities.CreateQuery<EntityObject>(sql).FirstOrDefault();
                    }
                    else
                    {
                        tableobj = ClassHelper.CreateInstance(Type.GetType(formvalues[region + "objectname"])) as EntityObject;
                    }
                }
                for (int j = 0; j < regionnames.Length; j++)
                {
                    if (!((region + "regioncount").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (region + "objectname").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (region + "fk").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                        (region + "id").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         region.Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase)))
                    {
                        if (tableobj != null)
                        {
                            string propertyName = regionnames[j].Replace(region, "").Trim();
                            if (!string.IsNullOrEmpty(formvalues[regionnames[j]]))
                            {
                                BuilderObject(propertyName, ClassHelper.ChangeType(formvalues[regionnames[j]].Split(new[] { ',' })[s],
                                    tableobj.GetType().GetProperty(propertyName).PropertyType), tableobj);
                            }
                        }
                        else
                        {
                            //如果等于数据库的情况
                        }
                    }
                }
                var propertyinfo = (from p in tableobj.GetType().GetProperties(System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Public)
                                    where p.GetGetMethod(false) != null
                                    let attribute = (EdmScalarPropertyAttribute)Attribute.GetCustomAttribute(p, typeof(EdmScalarPropertyAttribute))
                                    where attribute != null && attribute.EntityKeyProperty
                                    select p).FirstOrDefault();
                if (propertyinfo != null)
                {
                    if (propertyinfo.PropertyType.FullName.Equals("System.Guid", StringComparison.CurrentCultureIgnoreCase))
                    {
                        if (string.IsNullOrEmpty(formvalues[region + "id"].Split(new[] { ',' })[s]))
                        {
                            ClassHelper.SetPropertyValue(tableobj, propertyinfo.Name, System.Guid.NewGuid());
                        }
                        else
                        {
                            Guid guid = new Guid(formvalues[region + "id"].Split(new[] { ',' })[s]);//子表ID
                            guidBuilder.Append("Guid'" + guid.ToString() + "',");
                        }
                    }
                }

                ClassHelper.SetPropertyValue(tableobj, parentobject.GetType().Name, parentobject);
                if (string.IsNullOrEmpty(formvalues[region + "id"].Split(new[] { ',' })[s]))
                {
                    entities.AddObject(tableobj.GetType().Name, tableobj);
                }

                if (s == regioncount - 1)
                {
                    guidBuilder.Remove(guidBuilder.Length - 1, 1);
                    string esql = @"select value TargetEntity from (select value x from " + entities.DefaultContainerName + ".[FK_LINKMAN_CUSTOMER] AS x where ";
                    esql += " Key(x." + parentobject.GetType().Name + ") = row(@EntityKeyValue)) AS EntityKey ";
                    esql += " inner join " + entities.DefaultContainerName + "." + tableobj.GetType().Name + " AS TargetEntity on Key(EntityKey." + tableobj.GetType().Name + ") = Key(Ref(TargetEntity))";
                    if (guidBuilder.Length > 0)
                    {
                        esql += " where TargetEntity." + propertyinfo.Name + " not in {" + guidBuilder + "}";
                    }
                    ObjectQuery<EntityObject> query = entities.CreateQuery<EntityObject>
                        (esql, new ObjectParameter("EntityKeyValue", pid));
                    foreach (EntityObject r in query)
                    {
                        entities.DeleteObject(r);
                    }
                }

            }
        }

        private static void BuilderObject(string name, object value, object o)
        {
            ClassHelper.SetPropertyValue(o, name, value);
        }
    }
}
