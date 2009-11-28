using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LZL.ForeignTrade.DataEntity;
using System.IO;
using Microsoft.Office.Interop.Word;
using System.Web;

namespace LZL.ForeignTrade.Controllers
{
    public class WordInvoiceHelper
    {
        /// <summary>
        /// Singleton模式，类的唯一实例。
        /// </summary>
        public static readonly WordInvoiceHelper Instance = new WordInvoiceHelper();

        private WordInvoiceHelper()
        {

        }

        public byte[] BuilderInvoice(Guid id, string path, string targetpath,out string filename)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = invoice.Name + ".doc";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                wordhelper.GotoBookMark("date");
                wordhelper.InsertText(invoice.Date.ToShortDateString());
                wordhelper.GotoBookMark("from");
                wordhelper.InsertText(invoice.StartHaven);
                wordhelper.GotoBookMark("fromto");
                wordhelper.InsertText(invoice.EdnHaven);
                wordhelper.GotoBookMark("byvessel");
                wordhelper.InsertText(invoice.TransportMode);//运输方式
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

                if (invoice.CompanyID.HasValue)
                {
                    Guid companyid = invoice.CompanyID.GetValueOrDefault();
                    Company company = _Entities.Company.Where(v => v.ID.Equals(companyid)).FirstOrDefault();
                    if (company != null)
                    {
                        wordhelper.GotoBookMark("issuer");
                        wordhelper.InsertText(company.NameEH + (char)10 + company.AddressEH);//公司英文，公司地址
                        wordhelper.GotoBookMark("cncompany");
                        wordhelper.InsertText(company.NameCH);
                        wordhelper.GotoBookMark("cnaddress");
                        wordhelper.InsertText(company.AddressCH);
                    }
                }

                wordhelper.GotoBookMark("contenttitle");
                wordhelper.InsertText(invoice.PriceClause + "   " + invoice.StartHaven + ",CHINA");
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
                    table.Cell(count, 1).Range.Text = string.IsNullOrEmpty(product.NameCode) ? product.NameEH : product.NameCode;
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
                table.Cell(count, 1).Merge(table.Cell(count, 4));
                table.Cell(count, 1).Select();
                table.Cell(count, 1).Range.Text = "—".PadLeft(50, '—');
                table.Cell(count + 1, 1).Range.Text = "TOTAL：";
                table.Cell(count + 1, 2).Range.Text = sl + dwmc;
                table.Cell(count + 1, 4).Range.Text = ZhouBo.Core.BasicOperate.GetString(invoice.CurrencyType, true) + hjje.ToString();
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

        public byte[] BuilderPackingList(Guid id, string path, string targetpath, out string filename)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = "PackingList_" + invoice.Name + ".doc";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                wordhelper.GotoBookMark("date");
                wordhelper.InsertText(invoice.Date.ToShortDateString());
                wordhelper.GotoBookMark("no");
                wordhelper.InsertText(invoice.Name);
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
                if (invoice.CompanyID.HasValue)
                {
                    Guid companyid = invoice.CompanyID.GetValueOrDefault();
                    Company company = _Entities.Company.Where(v => v.ID.Equals(companyid)).FirstOrDefault();
                    if (company != null)
                    {
                        wordhelper.GotoBookMark("issuer");
                        wordhelper.InsertText(company.NameEH + (char)10 + company.AddressEH);//公司英文，公司地址
                        wordhelper.GotoBookMark("cncompany");
                        wordhelper.InsertText(company.NameCH);
                        wordhelper.GotoBookMark("cnaddress");
                        wordhelper.InsertText(company.AddressCH);
                    }
                }
                invoice.ProductPack.Load();

                wordhelper.GotoBookMark("contenttitle");
                wordhelper.InsertText(invoice.PriceClause + "   " + invoice.StartHaven + ",CHINA");

                Table table = wordhelper.AddTable(wordhelper.GotoBookMark("content"), invoice.ProductPack.Count + 2, 7);
                table.PreferredWidthType = WdPreferredWidthType.wdPreferredWidthPercent;
                table.PreferredWidth = 95;
                table.Select();
                table.Rows.Alignment = WdRowAlignment.wdAlignRowRight;
                table.Range.Paragraphs.Alignment = WdParagraphAlignment.wdAlignParagraphRight;
                int count = 1;
                double jscount = 0;
                string jsunit = string.Empty;
                double slcount = 0;
                string slunit = string.Empty;
                double mzcount = 0;
                double jzcount = 0;
                double jgcount = 0;
                for (int i = 0; i < invoice.ProductPack.Count; i++)
                {
                    Guid productid = invoice.ProductPack.ElementAt(i).ProductID.GetValueOrDefault();
                    Product product = _Entities.Product.Where(v => v.ID.Equals(productid)).FirstOrDefault();
                    if (product == null)
                    {
                        product = new Product();
                    }
                    invoice.ProductSummary.Load();

                    for (int s = 0; s <   invoice.ProductSummary.Count; s++)
                    {
                        invoice.ProductSummary.ElementAt(s).ProductReference.Load();
                    }

                    ProductSummary productSummary = invoice.ProductSummary.Where( v => v.ProductReference.Value.Equals(product)).FirstOrDefault();
                     
                    if (productSummary == null)
                    {
                        productSummary = new ProductSummary();
                    }
                    table.Cell(count, 1).Range.Text = string.IsNullOrEmpty(product.NameCode) ? product.NameEH : product.NameCode;
                    table.Cell(count, 1).Select();
                    table.Cell(count, 1).Range.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphLeft;
                    jscount += invoice.ProductPack.ElementAt(i).PieceAmount.GetValueOrDefault();//件数

                    jsunit = DataHelper.GetDictionaryName(invoice.ProductPack.ElementAt(i).PackUnitEN);
                    table.Cell(count, 2).Range.Text = invoice.ProductPack.ElementAt(i).PieceAmount.GetValueOrDefault() + jsunit;
                    slcount += productSummary.Amount.GetValueOrDefault();
                    slunit = DataHelper.GetDictionaryName(productSummary.UnitEN);
                    table.Cell(count, 3).Range.Text = productSummary.Amount.GetValueOrDefault() + slunit;
                    mzcount += invoice.ProductPack.ElementAt(i).GrossWeight.GetValueOrDefault();//毛重
                    table.Cell(count, 4).Range.Text = invoice.ProductPack.ElementAt(i).GrossWeight.GetValueOrDefault() + "KG";
                    jzcount += invoice.ProductPack.ElementAt(i).NetWeight.GetValueOrDefault();//净重
                    table.Cell(count, 5).Range.Text = invoice.ProductPack.ElementAt(i).NetWeight.GetValueOrDefault() + "KG";
                    table.Cell(count, 6).Range.Text = productSummary.ExportPrice.GetValueOrDefault().ToString();
                    jgcount += productSummary.ExportAmount.GetValueOrDefault();//价格总和
                    table.Cell(count, 7).Range.Text = productSummary.ExportAmount.GetValueOrDefault().ToString();
                    count++;
                }
                table.Cell(count, 1).Merge(table.Cell(count, 7));
                table.Cell(count, 1).Range.Text = "—".PadLeft(50, '—');
                table.Cell(count + 1, 1).Range.Text = "TOTAL：";
                table.Cell(count + 1, 2).Range.Text = jscount + jsunit;
                table.Cell(count + 1, 3).Range.Text = slcount + slunit;
                table.Cell(count + 1, 4).Range.Text = mzcount + "KG";
                table.Cell(count + 1, 5).Range.Text = jzcount + "KG";
                table.Cell(count + 1, 7).Range.Text = ZhouBo.Core.BasicOperate.GetString(invoice.CurrencyType, true) + jgcount;

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
            ///////
        }

        public byte[] BuilderDeclaration(Guid id, string path, string targetpath, out string filename)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = "Declaration_" + invoice.Name + ".xls";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (ExcelHelper excelhepler = new ExcelHelper(targetpath))
            {
                excelhepler.WriteValue(5, 2, invoice.StartHaven);
                excelhepler.WriteValue(5, 8, invoice.ShipmentDate.GetValueOrDefault().ToShortDateString() + "                    " + invoice.Date.ToShortDateString());

                if (invoice.CompanyID.HasValue)
                {
                    Guid companyid = invoice.CompanyID.GetValueOrDefault();
                    Company company = _Entities.Company.Where(v => v.ID.Equals(companyid)).FirstOrDefault();
                    if (company != null)
                    {
                        excelhepler.WriteValue(6, 1, company.NameCH);
                    }
                }

                excelhepler.WriteValue(6, 5, invoice.TransportMode);
                excelhepler.WriteValue(8, 5, "            " + invoice.Trade);
                excelhepler.WriteValue(8, 11, invoice.ClauseType);
                excelhepler.WriteValue(10, 4, invoice.TansportCountry);
                excelhepler.WriteValue(10, 7, invoice.EdnHaven);
                excelhepler.WriteValue(12, 4, invoice.PriceClause);
                invoice.ProductSummary.Load();
                invoice.ProductPack.Load();
                string dw = string.Empty;
                if (invoice.ProductPack.Count > 0)
                {
                    dw = invoice.ProductPack.ElementAt(1).PackUnitEN;
                }
                else
                {
                    if (invoice.ProductSummary.Count > 0)
                    {
                        dw = invoice.ProductSummary.ElementAt(1).UnitEN;
                    }
                }

                for (int i = 0; i < invoice.ProductSummary.Count; i++)
                {
                    invoice.ProductSummary.ElementAt(i).ProductReference.Load();
                }

                if (!string.IsNullOrEmpty(dw))
                {
                    Guid dwid = new Guid(dw);
                    dw = _Entities.Dictionary.Where(v => v.ID.Equals(dwid)).FirstOrDefault().Name;
                }
                excelhepler.WriteValue(14, 4, invoice.ExportContractsName);

                excelhepler.WriteValue(14, 4, invoice.ProductPack.Sum(v => v.PieceAmount).GetValueOrDefault() + dw);
                excelhepler.WriteValue(14, 6, dw);
                excelhepler.WriteValue(14, 8, invoice.ProductPack.Sum(v => v.GrossWeight).GetValueOrDefault() + "KGS");
                excelhepler.WriteValue(14, 11, invoice.ProductPack.Sum(v => v.NetWeight).GetValueOrDefault() + "KGS");
                excelhepler.WriteValue(23, 6, invoice.TansportCountry);
                excelhepler.WriteValue(23, 10, invoice.PriceClause + "  " + invoice.StartHaven);
                var groupproduct = invoice.ProductSummary.GroupBy(v => v.CustomsCode);
                int startrow = 24;
                double jehj = 0;

                foreach (var item in groupproduct)
                {
                    excelhepler.WriteValue(startrow, 1, item.Key);

                    for (int i = 0; i < item.Count(); i++)
                    {
                        startrow++;
                        excelhepler.MergeCell(startrow, 1, 2);
                        excelhepler.SetCellAlignment(startrow, 1, 1);//设置格式
                        item.ElementAt(i).ProductReference.Load();
                        excelhepler.WriteValue(startrow, 1, item.ElementAt(i).Product.NameCode);
                        Guid productid = item.ElementAt(i).Product.ID;
                        excelhepler.WriteValue(startrow, 5, invoice.ProductPack.Where(v => v.ProductID.Equals(productid)).Sum(v => v.PieceAmount).GetValueOrDefault() + dw);
                        jehj += item.ElementAt(i).ExportAmount.GetValueOrDefault();
                        excelhepler.WriteValue(startrow, 10, invoice.CurrencyType + "  " + item.ElementAt(i).ExportAmount);
                    }
                    startrow++;
                    excelhepler.MergeCell(startrow, 3, 11);
                    excelhepler.WriteValue(startrow, 3, "  ----------------------------------------------------------------------------");
                    startrow++;
                    excelhepler.WriteValue(startrow, 3, "TOTAL：");
                    excelhepler.WriteValue(startrow, 10, invoice.CurrencyType + "  " + jehj);
                }

                if (groupproduct.Count() > 1)
                {
                    startrow++;
                    excelhepler.MergeCell(startrow, 3, 11);
                    excelhepler.WriteValue(startrow, 3, "  ----------------------------------------------------------------------------");
                    startrow++;
                    excelhepler.WriteValue(startrow, 3, "TOTAL：");
                    excelhepler.WriteValue(startrow, 10, invoice.CurrencyType + "  " + jehj);
                }

                excelhepler.Save();
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
