using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LZL.ForeignTrade.DataEntity;

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
    }
}
