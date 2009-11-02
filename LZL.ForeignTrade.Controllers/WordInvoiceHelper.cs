using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LZL.ForeignTrade.DataEntity;
using System.IO;

namespace LZL.ForeignTrade.Controllers
{
    public class WordInvoiceHelper
    {
        Dictionary<string, string> invoicestemplate= new Dictionary<string, string>();
        /// <summary>
        /// Singleton模式，类的唯一实例。
        /// </summary>
        public static readonly WordInvoiceHelper Instance = new WordInvoiceHelper();

        private WordInvoiceHelper()
        {
            invoicestemplate.Add("date", "");
            invoicestemplate.Add("from", "");
            invoicestemplate.Add("fromto", "");
            invoicestemplate.Add("lcno", "");
            invoicestemplate.Add("no", "");
            invoicestemplate.Add("scno", "");
            invoicestemplate.Add("termsofpayment", "");
            invoicestemplate.Add("to", "");
            invoicestemplate.Add("content","");
        }

        public void BuilderInvoice(Guid id, string path, string targetpath)
        {
            
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            targetpath += invoice.ID.ToString() + ".doc";
            File.Copy(path, targetpath, true);

            invoicestemplate["date"] = DateTime.Now.ToShortDateString();
            invoicestemplate["from"] = invoice.StartHaven;//开始港口
            invoicestemplate["fromto"] = invoice.EdnHaven;//结束港口
            invoicestemplate["termsofpayment"] = invoice.ClauseType;//付款方式

            if (invoice.CustomerID.HasValue)
            {
                Customer customer = _Entities.Customer.Where(v => v.ID.Equals(invoice.CustomerID)).SingleOrDefault();
                if (customer != null)
                {
                    invoicestemplate["to"] = customer.NameEn + "/n/r" + customer.AddressEn;//客户地址
                }
            }
            invoice.ProductPack.Load();
            StringBuilder txtBuilder = new StringBuilder();
            txtBuilder.Append("FOB  " + invoice.StartHaven+"  CHINA/n/r");
            for (int i = 0; i < invoice.ProductSummary.Count; i++)
            {

            }
            invoicestemplate["lcno"] = "";
            invoicestemplate["no"] = invoice.Name;
            

            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                wordhelper.WriteDoc(invoicestemplate);
            }

        }

    }
}
