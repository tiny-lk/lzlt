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
                sql += " where it." + quyerCondition + " like '%" + queryvalue.Trim() + "%'";
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
                sql += " and  it." + quyerCondition + " like '%" + queryvalue + "%'";
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
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Product>(sql).ToList();
            return querylist;
        }
        public static List<AccessoriesBuy> GetAccessoriesBuy(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "AccessoriesNo";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "AccessoriesBuy")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".AccessoriesBuy as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<AccessoriesBuy>(sql).ToList();
            return querylist;
        }

        public static List<MaterialBuy> GetMaterialBuy(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "YclNo";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "MaterialBuy")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".MaterialBuy as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<MaterialBuy>(sql).ToList();
            return querylist;
        }

        public static List<WarehouseSale> GetWarehouseSale(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "SaleNo";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "WarehouseSale")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".WarehouseSale as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<WarehouseSale>(sql).ToList();
            return querylist;
        }
        public static List<vm_Warehouse> GetWarehouseManager(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "Name";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "vm_Warehouse")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".vm_Warehouse as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<vm_Warehouse>(sql).ToList();
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
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Price>(sql).ToList();
            return querylist;
        }

        public static List<ExportContracts> GetExportContracts(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "Name";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "ExportContracts")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".ExportContracts as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<ExportContracts>(sql).ToList();
            return querylist;
        }

        public static List<Dictionary> GetDictionary(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "Type";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "Dictionary")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Dictionary as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " = '" + queryvalue + "'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Dictionary>(sql).ToList();
            return querylist;
        }

        public static List<StockContracts> GetStockContracts(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "Name";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "StockContracts")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".StockContracts as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<StockContracts>(sql).ToList();
            return querylist;
        }

        public static List<Invoice> GetInvoices(string quyerCondition, string queryvalue, int? page, out int pagecount)
        {
            if (string.IsNullOrEmpty(quyerCondition))
            {
                quyerCondition = "Name";
            }
            Entities entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            pagecount = (int)Math.Ceiling((double)((double)DataHelper.Getcount(1, quyerCondition, queryvalue, "Invoice")) / pagesize);
            string sql = "select value it from " + entities.DefaultContainerName + ".Invoice as it ";
            if (!string.IsNullOrEmpty(queryvalue))
            {
                sql += " where  it." + quyerCondition + " like '%" + queryvalue + "%'";
            }
            sql += " order by it." + quyerCondition;
            sql += " Skip " + (pagesize * ((page ?? 1) - 1)) + " limit " + pagesize.ToString();
            var querylist = entities.CreateQuery<Invoice>(sql).ToList();
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
        /// <summary>
        /// 获取产品信息
        /// </summary>
        /// <param name="id">ID</param>
        /// <returns></returns>
        public static Product GetProduct(Guid? id)
        {
            if (id != null)
            {
                Entities entities = new Entities();
                return entities.Product.Where(v => v.ID.Equals(id.Value)).FirstOrDefault();
            }
            else
            {
                return new Product();
            }
        }

        

        public static string GetDictionaryName(string type, string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return string.Empty;
            }
            Entities entities = new Entities();
            return entities.Dictionary.Where(v => v.Type.Equals(type, StringComparison.CurrentCultureIgnoreCase)
                && v.Code.Equals(value, StringComparison.CurrentCultureIgnoreCase)
                ).FirstOrDefault().Name;
        }

        public static SelectList GetDictionary(string name)
        {
            return GetDictionary(name, string.Empty);
        }
        public static SelectList GetAllDictionary()
        {
            return GetAllDictionary(string.Empty);
        }

        public static SelectList GetAllDictionary(string select)
        {
            List<SelectListItem> selectitem = new List<SelectListItem>();
            Entities entities = new Entities();
            var tempvalues = entities.Dictionary.Select(v => v.Type).Distinct().ToList();
            for (int i = 0; i < tempvalues.Count; i++)
            {
                string name = tempvalues[i].Trim();
                SelectListItem item = new SelectListItem();
                item.Text = name;
                item.Value = item.Text;
                if (!string.IsNullOrEmpty(select) && tempvalues[i].Equals(select, StringComparison.CurrentCultureIgnoreCase))
                {
                    item.Selected = true;
                }
                selectitem.Add(item);
            }
            SelectList selectList = new SelectList(selectitem, "Text", "Value", select);
            
            return selectList;
        }

        public static SelectList GetDictionary(string name, string selectvalue)
        {
            List<SelectListItem> selectitem = new List<SelectListItem>();
            if (!string.IsNullOrEmpty(name))
            {
                Entities entities = new Entities();
                var tempvalues = entities.Dictionary.Where(v => v.Type.Equals(name, StringComparison.CurrentCultureIgnoreCase)).OrderBy(v => v.Code).ToList();
                for (int i = 0; i < tempvalues.Count; i++)
                {
                    SelectListItem item = new SelectListItem() { Text = tempvalues[i].Name, Value = tempvalues[i].ID.ToString() };
                    if (!string.IsNullOrEmpty(selectvalue) && item.Value.Equals(selectvalue, StringComparison.CurrentCultureIgnoreCase))
                    {
                        item.Selected = true;
                    }
                    selectitem.Add(item);
                }
            }
            return new SelectList(selectitem, "Value", "Text", selectvalue);
     
        }


    }
}
