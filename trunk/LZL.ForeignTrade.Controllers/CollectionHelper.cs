using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;

namespace LZL.ForeignTrade.Controllers
{
    public class CollectionHelper
    {
        private const char SplitChar = ',';

        /// <summary>
        /// 获取对象属性集合列表
        /// </summary>
        /// <param name="fc"></param>
        /// <param name="prefix"></param>
        /// <returns></returns>
        public static IList<NameValueCollection> GetObjAttrList(NameValueCollection fc, string prefix)
        {
            IList<NameValueCollection> result = null;
            Dictionary<string, string[]> dics = SplitNameValueCollection(fc, prefix);
            if ((null != dics) && (dics.Count > 0))
            {
                result = new List<NameValueCollection>();
                int l = dics.First().Value.Length;
                for (int i = 0; i < l; i++)
                {
                    NameValueCollection dic = new NameValueCollection();
                    foreach (var item in dics)
                    {
                        dic.Add(item.Key, item.Value[i]);
                    }
                    result.Add(dic);
                }
            }
            return result;
        }

        /// <summary>
        /// 分割NameValueCollection集合值
        /// </summary>
        /// <param name="fc"></param>
        /// <param name="prefix"></param>
        /// <returns></returns>
        private static Dictionary<string, string[]> SplitNameValueCollection(NameValueCollection fc, string prefix)
        {
            Dictionary<string, string[]> result = new Dictionary<string, string[]>();
            List<string> keys = fc.AllKeys.Where(s => s.StartsWith(prefix)).ToList();
            foreach (var key in keys)
            {
                string attr = key.Replace(prefix, string.Empty);
                result.Add(attr, fc[key].Split(SplitChar));
            }
            return result;
        }

    }
}
