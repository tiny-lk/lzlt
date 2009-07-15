using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LZL.ForeignTrade.DataEntity;
using System.Configuration;

namespace LZL.ForeignTrade.Controllers
{
    public class DataHelper
    {
        public static int Getcount(int? page, string quyerCondition, string queryvalue,string objectname)
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
    }
}
