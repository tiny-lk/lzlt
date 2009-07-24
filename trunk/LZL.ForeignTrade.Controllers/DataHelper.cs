using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LZL.ForeignTrade.DataEntity;
using System.Configuration;
using System.Web.Mvc;

namespace LZL.ForeignTrade.Controllers
{
    public class DataHelper
    {
        public static int Getcount(int? page, string quyerCondition, string queryvalue, string objectname)
        {
            Entities entities = new Entities();
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "ID";
            }
            string sql = "select value Count(it." + quyerCondition + ") from " + entities.DefaultContainerName + "." + objectname + " as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where it." + quyerCondition + " like '" + queryvalue + "%'";
            }
            var count = entities.CreateQuery<int>(sql).FirstOrDefault();
            return count;
        }

        public static List<Customer> GetCustomers(string quyerCondition, string queryvalue, int? page, string type, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "NameCode";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "Customer")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Customer as it ";
            if (!string.IsNullOrEmpty(type))
            {
                sql += " where it.TypeCode= '" + type + "'";
            }
            else
            {
                sql += " where it.TypeCode is not null";
            }

            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " and  it." + quyerCondition + " like '" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Customer>(sql).ToList();
            return querylist;
        }

        public static List<Product> GetProducts(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "NameCode";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "Product")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Product as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Product>(sql).ToList();
            return querylist;
        }

        public static List<Price> GetPrices(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "Name";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "Price")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Price as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Price>(sql).ToList();
            return querylist;
        }

        /// <summary>
        /// 获取客户信息
        /// </summary>
        /// <param name="id">公司ID</param>
        /// <returns>返回客户对象</returns>
        public static Customer GetCustomer(Guid? id)
        {
            if (id != null)
            {
                Entities entities = new Entities();
                return entities.Customer.Where(v => v.ID.Equals(id.Value)).FirstOrDefault();
            }
            else
            {
                return new Customer();
            }
        }
        /// <summary>
        /// 获取公司信息
        /// </summary>
        /// <param name="id">公司ID</param>
        /// <returns>返回公司对象</returns>
        public static Company GetCompany(Guid? id)
        {
            if (id != null)
            {
                Entities entities = new Entities();
                return entities.Company.Where(v => v.ID.Equals(id.Value)).FirstOrDefault();
            }
            else
            {
                return new Company();
            }
        }
        public static string GetDictionaryName(string type, string value)
        {
            Entities entities = new Entities();
            return entities.Dictionary.Where(v => v.Type.Equals(type, StringComparison.CurrentCultureIgnoreCase)
                && v.Code.Equals(value, StringComparison.CurrentCultureIgnoreCase)
                ).FirstOrDefault().Name;
        }

        public static SelectList GetDictionary(string name)
        {
            return GetDictionary(name, string.Empty);
        }

        public static SelectList GetDictionary(string name, string selectvalue)
        {
            List<SelectListItem> selectitem = new List<SelectListItem>();
            if (!string.IsNullOrEmpty(name))
            {
                Entities entities = new Entities();
                var tempvalues = entities.Dictionary.Where(v => v.Type.Equals(name, StringComparison.CurrentCultureIgnoreCase)).ToList();
                for (int i = 0; i < tempvalues.Count; i++)
                {
                    SelectListItem item = new SelectListItem() { Text = tempvalues[i].Name, Value = tempvalues[i].Code };
                    if (!string.IsNullOrEmpty(selectvalue) && item.Value.Equals(selectvalue, StringComparison.CurrentCultureIgnoreCase))
                    {
                        item.Selected = true;
                    }
                    selectitem.Add(item);
                }
            }
                return new SelectList(selectitem, "Value", "Text");
     
        }


    }
}
