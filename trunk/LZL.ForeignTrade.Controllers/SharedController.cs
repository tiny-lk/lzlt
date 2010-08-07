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
using System.Configuration;
using System.Web;

namespace LZL.ForeignTrade.Controllers
{

    public class SharedController : Controller
    {

        /// <summary>
        /// 获取联系人控件信息
        /// </summary>
        /// <param name="number">显示数量</param>
        /// <param name="name">控件名称</param>
        /// <param name="p">参数</param>
        /// <returns>返回联系人控件信息</returns>
        public ActionResult GetShareControl(string name, string fk, int? number, string p)
        {
            ViewData["number"] = number ?? 1;
            ViewData["FK"] = string.IsNullOrEmpty(fk) ? null : fk;
            if (!string.IsNullOrEmpty(p) && p != "undefined")
            {
                string[] parameters = p.Split(new char[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < parameters.Length; i++)
                {
                    string key = parameters[i].Substring(0, parameters[i].IndexOf("="));
                    string v = parameters[i].Substring(parameters[i].LastIndexOf("=") + 1);
                    if (!string.IsNullOrEmpty(key))
                    {
                        ViewData[key] = v;
                    }
                }
            }
            return View(name, null);
        }

        public ActionResult GetShareListControl(string name, string simple)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            return View(name);
        }

        public ActionResult GetProductInfo(string t)
        {
            Entities entities = new Entities();
            Guid guid = new Guid(t);

            Product enProduct = entities.Product.Where(v => v.ID.Equals(guid)).FirstOrDefault();

            Dictionary<string,object> lstReturn = new Dictionary<string,object>();
            lstReturn.Add("PackUnitEN", enProduct.PackUnitEN);//英文包装单位
            lstReturn.Add("NameEH", Server.HtmlEncode(enProduct.NameEH));//商品英文名称
            lstReturn.Add("PackAmount", enProduct.PackAmount);//单件包装数量
            lstReturn.Add("CustomsCode", enProduct.CustomsCode);//海关编码
            lstReturn.Add("PackLength", enProduct.PackLength);//包装的长
            lstReturn.Add("PackWidth", enProduct.PackWidth);//包装的宽
            lstReturn.Add("PackHeight", enProduct.PackHeight);//包装的高
            lstReturn.Add("PackBulk", enProduct.PackBulk);//单件包装体积
            lstReturn.Add("PackGrossWeight", enProduct.PackGrossWeight);//单件包装毛重
            lstReturn.Add("PackNetWeight", enProduct.PackNetWeight);//单件包装净重
            lstReturn.Add("BoxAmount", enProduct.BoxAmount);//内盒商品数量
            lstReturn.Add("BoxUnitEN", enProduct.BoxUnitEN);//内盒英文单位
            
            return Json(lstReturn);
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

        public JsonResult GetAutocompleteValue2(string t, string f)
        {
            Entities entities = new Entities();
            string sql = "select it." + f + ",it.ID from " + entities.DefaultContainerName + "." + t + " as it where it." + f + " like '" + Request["q"] + "%'";
            sql += " order by it." + f;
            sql += " Skip 0 limit 20 ";
            ObjectQuery<DbDataRecord> querylist = entities.CreateQuery<DbDataRecord>(sql);
            Dictionary<string, string> r = new Dictionary<string, string>();
            foreach (DbDataRecord item in querylist)
            {
                r.Add(BasicOperate.GetString(item[1], true),
                    BasicOperate.GetString(item[0], true));
            }
            return Json(r);
        }

        public JsonResult GetDictionary(string typename)
        {
            Entities entities = new Entities();
            string sql = "select value it from " + entities.DefaultContainerName + ".Dictionary  as it where it.Type='" + typename + "' and ";
            sql += "  it.Name like '" + Request["q"] + "%' order by it.Name ";
            sql += " Skip 0 limit 20 ";
            return Json(entities.CreateQuery<Dictionary>(sql));
        }

        public static void mainTable(FormCollection formvalues, ObjectContext entities)
        {
            var regions = formvalues["region"].Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            Guid id = System.Guid.NewGuid();
            var fkregions = (from temp in formvalues.AllKeys
                             where temp.Contains("♂")
                             let v = temp.Substring(temp.LastIndexOf("♂") + 1)
                             where v != null && v.Equals("fk", StringComparison.CurrentCultureIgnoreCase)
                             select temp).ToArray();
            for (int i = 0; i < regions.Length; i++)//
            {
                if (formvalues[regions[i] + "regioncount"] != null)
                {
                    continue;
                }
                var regioncount = BasicOperate.GetInt(formvalues[regions[i] + "regioncount"], true); //获取区域中存在几个。
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
                        (regions[i] + "iscreatedate").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         (regions[i] + "iseditdate").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         (regions[i] + "propertyobject").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         (regions[i] + "propertyobjectvalue").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         regions[i].Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase)))
                    {
                        if (tableobj != null)
                        {
                            string propertyName = regionnames[j].Replace(regions[i], "").Trim();
                            string value;
                            if (formvalues[regionnames[j]] == null)
                            {
                                value = string.Empty;
                            }
                            else
                            {
                                value = formvalues[regionnames[j]];
                                if (value.Contains(",") && value.Contains("true"))
                                {
                                    value = "true";
                                }
                            }
                            BuilderObject(propertyName, value, tableobj);
                        }
                        else
                        {
                            //如果等于数据库的情况
                        }
                    }
                }

                if (!(string.IsNullOrEmpty(formvalues[(regions[i] + "propertyobject")]) &&
                    string.IsNullOrEmpty(formvalues[(regions[i] + "propertyobjectvalue")])))
                {
                    string[] propertyobjects = formvalues[(regions[i] + "propertyobject")].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    string[] propertyobjectvalues = formvalues[regions[i] + "propertyobjectvalue"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    var sql = "select value it from " + entities.DefaultContainerName + "." + propertyobjects[i] + " as it ";
                    sql += " where it.ID=Guid'" + propertyobjectvalues[i] + "'";
                    object propertyobject = entities.CreateQuery<EntityObject>(sql).FirstOrDefault();
                    if (propertyobject != null)
                    {
                        ClassHelper.SetPropertyValue(tableobj, propertyobjects[i], propertyobject);//设置属性对象
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
                        if (!string.IsNullOrEmpty(formvalues[regions[i] + "iscreatedate"]))
                        {
                            ClassHelper.SetPropertyValue(tableobj, formvalues[regions[i] + "iscreatedate"], DateTime.Now);
                        }

                        //添加状态
                        entities.AddObject(tableobj.GetType().Name, tableobj);
                    }
                    else
                    {
                        //编辑状态
                        if (!string.IsNullOrEmpty(formvalues[regions[i] + "iseditdate"]))
                        {
                            ClassHelper.SetPropertyValue(tableobj, formvalues[regions[i] + "iseditdate"], DateTime.Now);
                        }
                    }

                    for (int f = 0; f < fkregions.Length; f++)
                    {
                        string childregionname = fkregions[f].Substring(0, fkregions[f].IndexOf("♂") + 1);//子表对象
                        //判断是否存在pfk
                        var pfkname = fkregions[f].Replace("♂fk", "♂pfk");
                        if ((!string.IsNullOrEmpty(formvalues[pfkname]) && formvalues[pfkname].Equals(tableobj.GetType().Name, StringComparison.CurrentCultureIgnoreCase))
                            || (formvalues[fkregions[f]].Equals(tableobj.GetType().Name, StringComparison.CurrentCultureIgnoreCase))
                            )
                        {
                            var childregioncount = BasicOperate.GetInt(formvalues[childregionname + "regioncount"], true); //获取区域中存在多个，表示是子表。
                            if (childregioncount == 0 && !string.IsNullOrEmpty(formvalues[regions[i] + "id"]))//表示所有的子被删除
                            {
                                IRelatedEnd relatedEndObject = ClassHelper.GetPropertyValue2(tableobj, childregionname.Substring(0, childregionname.IndexOf("♂"))) as IRelatedEnd;
                                relatedEndObject.Load();
                                IEnumerable<EntityObject> query = relatedEndObject.CreateSourceQuery().OfType<EntityObject>();
                                for (int k = 0; k < query.Count(); k++)
                                {
                                    entities.DeleteObject(query.ElementAt(k));
                                }
                            }
                            else
                            {
                                childTable(formvalues, tableobj, entities, childregionname, id);
                            }
                        }
                    }
                    //
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

            List<Guid> guids = new List<Guid>();
            var regionnames = formvalues.AllKeys.Where(v => v.Substring(0, v.IndexOf("♂") + 1).Equals(region, StringComparison.CurrentCultureIgnoreCase)).ToArray();
            for (int s = 0; s < regioncount; s++)// 表示存在几个子表
            {
                EntityObject tableobj = null;
                if (!string.IsNullOrEmpty(formvalues[region + "objectname"]))
                {

                    if (!string.IsNullOrEmpty(formvalues[region + "id"]) && !string.IsNullOrEmpty(formvalues[region + "id"].Split(new[] { ',' })[s]))
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
                        (region + "pfk").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         (region + "iscreatedate").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         (region + "iseditdate").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         (region + "propertyobject").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                          (region + "propertyobjectvalue").Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase) ||
                         region.Equals(regionnames[j], StringComparison.CurrentCultureIgnoreCase)))
                    {
                        if (tableobj != null)
                        {
                            string propertyName = regionnames[j].Replace(region, "").Trim();
                            string value;
                            if (formvalues[regionnames[j]].Split(new[] { ',' })[s] == null)
                            {
                                value = string.Empty;
                            }
                            else
                            {
                                value = formvalues[regionnames[j]].Split(new[] { ',' })[s];
                                if (value.Contains(",") && value.Contains("true"))
                                {
                                    value = "true";
                                }
                            }
                            BuilderObject(propertyName, value, tableobj);
                        }
                        else
                        {
                            //如果等于数据库的情况
                        }
                    }
                }

                if (!(string.IsNullOrEmpty(formvalues[(region + "propertyobject")]) &&
                      string.IsNullOrEmpty(formvalues[(region + "propertyobjectvalue")])))
                {
                    string[] propertyobjects = formvalues[(region + "propertyobject")].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    string[] propertyobjectvalues = formvalues[region + "propertyobjectvalue"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                    if (propertyobjectvalues.Count() > 0)
                    {
                        var sql = "select value it from " + entities.DefaultContainerName + "." + propertyobjects[s] + " as it ";
                        sql += " where it.ID=Guid'" + propertyobjectvalues[s] + "'";
                        object propertyobject = entities.CreateQuery<EntityObject>(sql).FirstOrDefault();
                        if (propertyobject != null)
                        {
                            ClassHelper.SetPropertyValue(tableobj, propertyobjects[s], propertyobject);//设置属性对象
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
                        if (string.IsNullOrEmpty(formvalues[region + "id"]) || string.IsNullOrEmpty(formvalues[region + "id"].Split(new[] { ',' })[s]))
                        {
                            ClassHelper.SetPropertyValue(tableobj, propertyinfo.Name, System.Guid.NewGuid());
                        }
                        else
                        {
                            Guid guid = new Guid(formvalues[region + "id"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)[s]);//子表ID
                            guids.Add(guid);
                        }
                    }
                }

                ClassHelper.SetPropertyValue(tableobj, parentobject.GetType().Name, parentobject);//设置子对象信息

                if (!string.IsNullOrEmpty(formvalues[region + "pfk"]))
                {
                    string sqlchild = "select value it from " + entities.DefaultContainerName + "." + formvalues[region + "fk"] + " as it ";
                    sqlchild += " where it.ID=Guid'" + formvalues[formvalues[region + "fk"] + "♂id"].Split(new[] { ',' })[s] + "'";
                    ClassHelper.SetPropertyValue(tableobj, formvalues[region + "fk"], entities.CreateQuery<EntityObject>(sqlchild).FirstOrDefault());//设置父对象信息
                }

                if (string.IsNullOrEmpty(formvalues[region + "id"]) || string.IsNullOrEmpty(formvalues[region + "id"].Split(new[] { ',' })[s]))
                {
                    if (!string.IsNullOrEmpty(formvalues[region + "iscreatedate"]))
                    {
                        ClassHelper.SetPropertyValue(tableobj, formvalues[region + "iscreatedate"], DateTime.Now);
                    }
                    entities.AddObject(tableobj.GetType().Name, tableobj);
                }
                else
                {
                    //编辑状态
                    if (!string.IsNullOrEmpty(formvalues[region + "iseditdate"]))
                    {
                        ClassHelper.SetPropertyValue(tableobj, formvalues[region + "iseditdate"], DateTime.Now);
                    }
                }

                if (s == regioncount - 1)
                {
                    IRelatedEnd relatedEndObject = relatedEndObject = ClassHelper.GetPropertyValue2(parentobject, tableobj.GetType().Name) as IRelatedEnd;
                    if (!(parentobject.EntityState == System.Data.EntityState.Added || parentobject.EntityState == System.Data.EntityState.Detached))
                    {
                        relatedEndObject.Load();
                        IEnumerable<EntityObject> query = relatedEndObject.CreateSourceQuery().OfType<EntityObject>();
                        foreach (EntityObject r in query)
                        {
                            if (!guids.Contains(new Guid(r.EntityKey.EntityKeyValues.Select(v => v.Value).FirstOrDefault().ToString())))
                            {
                                entities.DeleteObject(r);
                            }
                        }
                    }
                }

            }
        }

        private static void BuilderObject(string name, string value, object o)
        {
            if (string.IsNullOrEmpty(value))
            {
                value = null;
            }
            value = HttpUtility.HtmlDecode(value);
            ClassHelper.SetPropertyValue(o, name.Trim(), value);
        }

        public ActionResult CustomerIndex(string type, string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }

            int pagecount = 1;
            var querylist = DataHelper.GetCustomers(quyerCondition, queryvalue, page, type, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("CustomerIndex", querylist);
        }

        public ActionResult ProductIndex(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetProducts(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("ProductIndex", querylist);
        }

        public ActionResult CompanyIndex(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetCompanys(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;

            return View("CompanyIndex", querylist);
        }

        public ActionResult PriceIndex(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetPrices(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("PriceIndex", querylist);
        }

        public ActionResult DictionaryIndex(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetDictionary(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("DictionaryIndex", querylist);
        }

        public ActionResult ExportContractsIndex(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetExportContracts(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("ExportContractsIndex", querylist);
        }

        public ActionResult StockContractsIndex(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetStockContracts(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("StockContractsIndex", querylist);
        }

        public ActionResult InvoiceIndex(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetInvoices(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("InvoiceIndex", querylist);
        }

        public ActionResult ImageUserControl(string fid, string name)
        {
            ViewData["fid"] = fid;
            ViewData["typename"] = name;
            return View("ImageUserControl");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public void ImageUserControl(FormCollection form, HttpPostedFileBase Attachment)
        {
            Image image = new Image();
            image.ID = Guid.NewGuid();
            image.Name = form["FileName"];
            image.FK_ID = new Guid(form["fid"]);
            image.Note = form["Note"];
            image.TypeCode = form["TypeCode"];
            if (Attachment != null)
            {
                byte[] array = new byte[Attachment.ContentLength];
                Attachment.InputStream.Read(array, 0, Attachment.ContentLength);
                image.Attachment = array;
                image.ExtensName = Attachment.FileName.Substring(Attachment.FileName.LastIndexOf(".") + 1);
                image.FileName = Attachment.FileName.Substring(Attachment.FileName.LastIndexOf("\\") + 1);
            }
            Entities entities = new Entities();
            image.CreateDate = DateTime.Now;
            image.EditDate = DateTime.Now;
            entities.AddToImage(image);
            entities.SaveChanges();

            ViewData["fid"] = form["fid"];
        }

        public ActionResult ImageView(string imagetype, string fid)
        {
            Entities entities = new Entities();
            Guid fguid = new Guid(fid);
            var images = entities.Image.Where(v => v.FK_ID.Value.Equals(fguid)).OrderBy(v => v.TypeCode).ToList();

            ViewData["tree"] = builderDictionaryTree(Server.UrlDecode(imagetype), images);

            return View("ImageView", images.FirstOrDefault());
        }

        public static string builderDictionaryTree(string type, List<Image> images)
        {
            Entities entities = new Entities();
            var treedictionary = entities.Dictionary.Where(v => v.Type.Equals(type, StringComparison.CurrentCultureIgnoreCase)).ToList();
            var tree = string.Empty;
            for (int i = 0; i < treedictionary.Count; i++)
            {
                tree = "<li id='" + treedictionary.ElementAt(i).ID.ToString() + "'><span class='folder'>" + treedictionary.ElementAt(i).Name + "</span>";
                if (treedictionary.ElementAt(i).Pid != null)
                {
                    builderDictionary(treedictionary, treedictionary.ElementAt(i).Pid.GetValueOrDefault(), tree, images);
                }
                else
                {
                    var imagecode = images.Where(v => v.TypeCode.Equals(treedictionary[i].Code, StringComparison.CurrentCultureIgnoreCase)).ToList();
                    if (imagecode.Count > 0)
                    {
                        tree += "<ul>";
                        for (int j = 0; j < imagecode.Count; j++)
                        {
                            string name = string.IsNullOrEmpty(imagecode[j].Name) ? imagecode[j].FileName : imagecode[j].Name;
                            tree += "<li id='" + imagecode[j].ID.ToString() + "'>";
                            tree += "<a href='#' onclick=showimage('" + imagecode[j].ID.ToString() + "')><span class='file'>" + name + "</span></a></li>";
                        }
                        tree += "</ul>";
                    }
                }
                tree += "</li>";
            }
            return tree;

        }

        private static void builderDictionary(List<Dictionary> dictionarys, Guid pid, string tree, List<Image> images)
        {
            var childdictionary = dictionarys.Where(v => v.ID.Equals(pid)).ToList();
            if (childdictionary.Count > 0)
            {
                tree += "<ul>";

                for (int i = 0; i < childdictionary.Count; i++)
                {
                    tree += "<li id='" + childdictionary[i].ID.ToString() + "'><span class='folder'>" + childdictionary[i].Name + "</span>";
                    if (childdictionary[i].Pid != null)
                    {
                        builderDictionary(dictionarys, childdictionary.ElementAt(i).Pid.GetValueOrDefault(), tree, images);
                    }
                    else
                    {
                        var imagecode = images.Where(v => v.TypeCode.Equals(childdictionary[i].Code, StringComparison.CurrentCultureIgnoreCase)).ToList();
                        if (imagecode.Count > 0)
                        {
                            tree += "<ul>";
                            for (int j = 0; j < imagecode.Count; j++)
                            {
                                string name = string.IsNullOrEmpty(imagecode[j].Name) ? imagecode[j].FileName : imagecode[j].Name;
                                tree += "<li id='" + imagecode[j].ID.ToString() + "'>";
                                tree += "<a href='#' onclick=showimage('" + imagecode[j].ID.ToString() + "')><span class='file'>" + name + "</span></a></li>";
                            }
                            tree += "</ul>";
                        }
                    }
                    tree += "</li>";
                }
                tree += "</ul>";
            }

        }

        public FileResult ShowImage(string id)
        {
            Entities entities = new Entities();
            Guid fguid = new Guid(id);
            var images = entities.Image.Where(v => v.ID.Equals(fguid)).OrderBy(v => v.TypeCode).FirstOrDefault();
            return File(images.Attachment, "image/" + images.ExtensName);
        }

        public ActionResult DeleteImage(string imageid, string fid, string imagetype)
        {
            if (!string.IsNullOrEmpty(imageid))
            {
                Entities entities = new Entities();
                Guid fguid = new Guid(imageid);
                Image image = entities.Image.Where(v => v.ID == fguid).FirstOrDefault();
                entities.DeleteObject(image);
                entities.SaveChanges();
            }

            return RedirectToAction("ImageView", new { imagetype = imagetype, fid = fid });
        }

        /// <summary>
        /// Menus the main.
        /// </summary>
        /// <param name="quyerCondition">The quyer condition.</param>
        /// <param name="queryvalue">The queryvalue.</param>
        /// <param name="simple">The simple.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        public ActionResult MenuMain(string quyerCondition, string queryvalue, string simple, int? page)
        {
            if (!string.IsNullOrEmpty(simple))
            {
                ViewData["simple"] = "true";
            }
            if (!string.IsNullOrEmpty(queryvalue))
            {
                queryvalue = Server.UrlDecode(queryvalue);
            }
            int pagecount = 1;
            var querylist = DataHelper.GetInvoices(quyerCondition, queryvalue, page, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View("InvoiceIndex", querylist);
        }
    }
}