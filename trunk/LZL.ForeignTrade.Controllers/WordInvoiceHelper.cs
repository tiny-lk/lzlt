using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LZL.ForeignTrade.DataEntity;
using System.IO;
using Microsoft.Office.Interop.Word;

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
            invoicestemplate.Add("contenttitle", "");
        }

        public byte[] BuilderInvoice(Guid id, string path, string targetpath)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            targetpath += invoice.ID.ToString() + ".doc";
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                wordhelper.GotoBookMark("date");
                wordhelper.InsertText(DateTime.Now.ToShortDateString());
                wordhelper.GotoBookMark("from");
                wordhelper.InsertText(invoice.StartHaven);
                wordhelper.GotoBookMark("fromto");
                wordhelper.InsertText(invoice.EdnHaven);
                wordhelper.GotoBookMark("termsofpayment");
                wordhelper.InsertText(invoice.ClauseType);//付款方式

                if (invoice.CustomerID.HasValue)
                {
                    Guid customerid = invoice.CustomerID.GetValueOrDefault();
                    Customer customer = _Entities.Customer.Where(v => v.ID.Equals(customerid)).FirstOrDefault();
                    if (customer != null)
                    {
                        wordhelper.GotoBookMark("to");
                        wordhelper.InsertText(customer.NameEn + (char)10 + customer.AddressEn);//客户地址
                    }
                }

                wordhelper.GotoBookMark("contenttitle");
                wordhelper.InsertText("FOB   " + invoice.StartHaven + ",   CHINA");
                invoice.ProductSummary.Load();
                Table table = wordhelper.AddTable(wordhelper.GotoBookMark("content"), invoice.ProductSummary.Count + 2, 4);
                table.PreferredWidthType = WdPreferredWidthType.wdPreferredWidthPercent;
                table.PreferredWidth = 95;
                table.Select();
                table.Rows.Alignment = WdRowAlignment.wdAlignRowRight;
                table.Range.Paragraphs.Alignment = WdParagraphAlignment.wdAlignParagraphRight;

                double sl = 0.0;//总数量
                double hjje = 0.0;//合计金额
                string dwmc = string.Empty;//单位名称
                int count = 1;
                for (int i = 0; i < invoice.ProductSummary.Count; i++)
                {
                    invoice.ProductSummary.ElementAt(i).ProductReference.Load();
                    Product product = invoice.ProductSummary.ElementAt(i).Product;
                    table.Cell(count, 1).Range.Text = product.NameCode;
                    table.Cell(count, 1).Select();
                    table.Cell(count, 1).Range.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphCenter;
                    dwmc = DataHelper.GetDictionaryName(invoice.ProductSummary.ElementAt(i).UnitEN);
                    sl += invoice.ProductSummary.ElementAt(i).Amount.GetValueOrDefault();
                    hjje += invoice.ProductSummary.ElementAt(i).ExportAmount.GetValueOrDefault();
                    table.Cell(count, 2).Range.Text = invoice.ProductSummary.ElementAt(i).Amount.GetValueOrDefault() + dwmc;
                    table.Cell(count, 3).Range.Text = invoice.ProductSummary.ElementAt(i).ExportPrice.GetValueOrDefault().ToString();
                    table.Cell(count, 4).Range.Text = invoice.ProductSummary.ElementAt(i).ExportAmount.GetValueOrDefault().ToString();
                    count++;
                }
                table.Cell(count, 1).Merge(table.Cell(count, 2));
                table.Cell(count, 1).Merge(table.Cell(count, 2));
                table.Cell(count, 1).Merge(table.Cell(count, 2));
                table.Cell(count, 1).Select();
                table.Cell(count, 1).Range.Text = "—".PadLeft(50, '—');
                table.Cell(count + 1, 1).Range.Text = "TOTAL：";
                table.Cell(count + 1, 2).Range.Text = sl + dwmc;
                table.Cell(count + 1, 4).Range.Text = "USD" + hjje;
                wordhelper.GotoBookMark("no");
                wordhelper.InsertText(invoice.Name);
                wordhelper.GotoBookMark("lcno");
                wordhelper.InsertText(invoice.CreditCardNo);
                wordhelper.Save();
            }

            FileStream filestream = File.Open(targetpath, FileMode.Open);
            try
            {
                byte[] filebuffer = new byte[filestream.Length];
                filestream.Read(filebuffer, 0, filebuffer.Length);
                filestream.Seek(0, SeekOrigin.Begin);
                return filebuffer;
            }
            catch
            {
                throw;
            }
            finally
            {
                if (filestream != null)
                {
                    filestream.Close();
                    filestream.Dispose();
                }
            }
        }

    }
}
