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

        #region 商业发票打印
        /// <summary>
        /// 商业发票打印
        /// </summary>
        /// <param name="id"></param>
        /// <param name="path"></param>
        /// <param name="targetpath"></param>
        /// <param name="filename"></param>
        /// <returns></returns>
        public byte[] BuilderInvoice(Guid id, string path, string targetpath,out string filename)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = invoice.Name + ".doc";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                if (wordhelper.oDoc == null)
                {
                    throw new Exception("word打开失败，请核实服务器是否已安装office");
                }

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
                        wordhelper.InsertText(company.NameEH + (char)10 + company.AddressEH + "\r\nTEL:" + company.Phone + "   Fax:" + company.Fax);//公司英文，公司地址
                        wordhelper.GotoBookMark("cncompany");
                        wordhelper.InsertText(company.NameEH + (char)10 + company.AddressEH + "\r\nTEL:" + company.Phone + "   Fax:" + company.Fax);
                        //wordhelper.InsertText(company.NameCH);
                        //wordhelper.GotoBookMark("cnaddress");
                        //wordhelper.InsertText(company.AddressCH);
                    }
                }

                wordhelper.GotoBookMark("contenttitle");
                //插入价格条款、运抵国、运抵港口信息
                wordhelper.InsertText(invoice.PriceClause + "   " + invoice.EdnHaven + ","+invoice.TansportCountry);
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
                for (int i = 0; i < invoice.ProductSummary.OrderBy(v=>v.CreateDate).ToList().Count; i++)
                {
                    invoice.ProductSummary.ElementAt(i).ProductReference.Load();
                    Product product = invoice.ProductSummary.ElementAt(i).Product;
                    table.Cell(count, 1).Range.Text = string.IsNullOrEmpty(product.NameCode) ? product.NameEH : (product.NameCode+" "+product.NameEH);
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
                table.Cell(count, 1).Range.Text = "—".PadLeft(40, '—');
                table.Cell(count + 1, 1).Range.Text = "TOTAL：";
                table.Cell(count + 1, 2).Range.Text = sl + dwmc;
                table.Cell(count + 1, 4).Range.Text = ZhouBo.Core.BasicOperate.GetString(invoice.CurrencyType, true) + hjje.ToString();
                wordhelper.GotoBookMark("no");
                wordhelper.InsertText(invoice.Name);
                wordhelper.GotoBookMark("lcno");
                wordhelper.InsertText(invoice.CreditCardNo);

                //添加唛头
                wordhelper.GotoBookMark("maitou");
                wordhelper.InsertText(invoice.Mark);

                //添加商品明细
                wordhelper.GotoBookMark("totalinfo");

                wordhelper.InsertText(string.Format("SAY TOTAL USD {0} ONLY", MoneyConvert.ConverDigToEng(hjje)));//转换后的名称
                

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
        #endregion

        #region 装箱单信息
        /// <summary>
        /// 装箱单信息
        /// </summary>
        /// <param name="id"></param>
        /// <param name="path"></param>
        /// <param name="targetpath"></param>
        /// <param name="filename"></param>
        /// <returns></returns>
        public byte[] BuilderPackingList(Guid id, string path, string targetpath, out string filename)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = "PackingList_" + invoice.Name + ".doc";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                if (wordhelper.oDoc == null)
                {
                    throw new Exception("word打开失败，请核实服务器是否已安装office");
                }

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
                        wordhelper.InsertText(company.NameEH + (char)10 + company.AddressEH + "\r\nTEL:" + company.Phone + "   Fax:" + company.Fax);//公司英文，公司地址
                        wordhelper.GotoBookMark("cncompany");
                        wordhelper.InsertText(company.NameEH + (char)10 + company.AddressEH + "\r\nTEL:" + company.Phone + "   Fax:" + company.Fax);
                        //wordhelper.GotoBookMark("cnaddress");
                        //wordhelper.InsertText(company.AddressCH);
                    }
                }
                invoice.ProductPack.Load();

                wordhelper.GotoBookMark("contenttitle");
                //插入价格条款、起运国、起运港口信息
                wordhelper.InsertText(invoice.PriceClause + "   " + invoice.StartHaven + ",CHINA");

                wordhelper.GotoBookMark("maitou");//唛头
                wordhelper.InsertText(invoice.Mark);

                Table table = wordhelper.AddTable(wordhelper.GotoBookMark("content"), invoice.ProductPack.Count + 2, 6);
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
                double tjcount = 0;
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
                    table.Cell(count, 1).Range.Text = string.IsNullOrEmpty(product.NameCode) ? product.NameEH : (product.NameCode + " " + product.NameEH);
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
                    //显示报关价格
                    //table.Cell(count, 6).Range.Text = productSummary.ExportPrice.GetValueOrDefault().ToString();
                    //显示单款总体积
                    double dTemp = invoice.ProductPack.ElementAt(i).PackBulk.GetValueOrDefault();
                    table.Cell(count, 6).Range.Text = dTemp.ToString();
                    tjcount += dTemp;

                    //jgcount += productSummary.ExportAmount.GetValueOrDefault();//价格总和
                    //table.Cell(count, 7).Range.Text = productSummary.ExportAmount.GetValueOrDefault().ToString();
                    count++;
                }
                table.Cell(count, 1).Merge(table.Cell(count, 6));
                table.Cell(count, 1).Range.Text = "—".PadLeft(40, '—');
                table.Cell(count + 1, 1).Range.Text = "TOTAL：";
                table.Cell(count + 1, 2).Range.Text = jscount + jsunit;
                table.Cell(count + 1, 3).Range.Text = slcount + slunit;
                table.Cell(count + 1, 4).Range.Text = mzcount + "KG";
                table.Cell(count + 1, 5).Range.Text = jzcount + "KG";
                //table.Cell(count + 1, 6).Range.Text = ZhouBo.Core.BasicOperate.GetString(invoice.CurrencyType, true) + jgcount;
                table.Cell(count + 1, 6).Range.Text = tjcount.ToString();

                wordhelper.GotoBookMark("totalinfo");//唛头
                string strTotalInfo = string.Format("Total Quantity:{0} IN {1}\r\nTotal Gross Weight:{2}\r\nTotal Net Weight:{3}\r\nTotalMeasurment:{4}CBM",
                    slcount + slunit, jscount + jsunit, mzcount + "KG", jzcount + "KG", tjcount);
                wordhelper.InsertText(strTotalInfo);

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
        #endregion

        #region 报关单信息
        /// <summary>
        /// 报关单信息
        /// </summary>
        /// <param name="id"></param>
        /// <param name="path"></param>
        /// <param name="targetpath"></param>
        /// <param name="filename"></param>
        /// <returns></returns>
        public byte[] BuilderDeclaration(Guid id, string path, string targetpath, out string filename)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = "Declaration_" + invoice.Name + ".xls";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (ExcelHelper excelhepler = new ExcelHelper(targetpath))
            {
                excelhepler.WriteValue(5, 2, invoice.StartHaven);//起运港口
                excelhepler.WriteValue(5, 8, invoice.ShipmentDate.GetValueOrDefault().ToShortDateString() + "                    " + invoice.Date.ToShortDateString());//出运日期和申报日期

                if (invoice.CompanyID.HasValue)
                {
                    Guid companyid = invoice.CompanyID.GetValueOrDefault();
                    Company company = _Entities.Company.Where(v => v.ID.Equals(companyid)).FirstOrDefault();
                    if (company != null)
                    {
                        excelhepler.WriteValue(6, 1, company.NameCH);//公司中文信息
                    }
                }

                excelhepler.WriteValue(6, 5, invoice.TransportMode);//运输方式
                excelhepler.WriteValue(8, 5, "            " + invoice.Trade);//贸易方式
                excelhepler.WriteValue(8, 11, invoice.ClauseType);//付款（结汇）方式
                excelhepler.WriteValue(10, 4, invoice.TansportCountry);//运抵国
                excelhepler.WriteValue(10, 7, invoice.EdnHaven);//运抵港
                excelhepler.WriteValue(12, 4, invoice.PriceClause);//价格条款

                invoice.ProductSummary.Load();
                invoice.ProductPack.Load();
                string dw = string.Empty;
                if (invoice.ProductPack.Count > 0)
                {
                    dw = invoice.ProductPack.ElementAt(0).PackUnitEN;
                }
                else
                {
                    if (invoice.ProductSummary.Count > 0)
                    {
                        dw = invoice.ProductSummary.ElementAt(0).UnitEN;
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

                excelhepler.WriteValue(14, 4, invoice.ProductPack.Sum(v => v.PieceAmount).GetValueOrDefault() + dw);//包装件数
                excelhepler.WriteValue(14, 6, dw);//包装单位
                excelhepler.WriteValue(14, 8, invoice.ProductPack.Sum(v => v.GrossWeight).GetValueOrDefault() + "KGS");//包装毛重
                excelhepler.WriteValue(14, 11, invoice.ProductPack.Sum(v => v.NetWeight).GetValueOrDefault() + "KGS");//包装净重
                excelhepler.WriteValue(18, 2, invoice.Mark);//添加唛头
                excelhepler.WriteValue(23, 6, invoice.TansportCountry);//运抵国
                excelhepler.WriteValue(23, 10, invoice.PriceClause + "  " + invoice.StartHaven);//成交方式和起运港口

                var groupproduct = invoice.ProductSummary.GroupBy(v => v.CustomsCode);
                int startrow = 24;
                double jehj = 0;

                //生成商品数据
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
                    excelhepler.WriteValue(startrow, 10, invoice.CurrencyType + "  " + jehj);//金额合计
                }

                if (groupproduct.Count() > 1)
                {
                    startrow++;
                    excelhepler.MergeCell(startrow, 3, 11);
                    excelhepler.WriteValue(startrow, 3, "  ----------------------------------------------------------------------------");
                    startrow++;
                    excelhepler.WriteValue(startrow, 3, "TOTAL：");
                    excelhepler.WriteValue(startrow, 10, invoice.CurrencyType + "  " + jehj);//金额合计
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
        #endregion

        #region 出口货物明细单
        /// <summary>
        /// 出口货物明细单
        /// </summary>
        /// <param name="id"></param>
        /// <param name="path"></param>
        /// <param name="targetpath"></param>
        /// <param name="filename"></param>
        /// <returns></returns>
        public byte[] BuilderCkhwList(Guid id, string path, string targetpath, out string filename)
        {
            Entities _Entities = new Entities();
            Invoice invoice = _Entities.Invoice.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = "Ckhwmxd_" + invoice.Name + ".doc";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                if (wordhelper.oDoc == null)
                {
                    throw new Exception("word打开失败，请核实服务器是否已安装office");
                }

                wordhelper.GotoBookMark("kzyh");//开征银行
                wordhelper.InsertText(invoice.AccountBank);
                wordhelper.GotoBookMark("fphm");//发票号码
                wordhelper.InsertText(invoice.Name);
                wordhelper.GotoBookMark("hth");//合同号
                wordhelper.InsertText(invoice.ExportContractsName);
                wordhelper.GotoBookMark("skfs");//收款方式
                wordhelper.InsertText(invoice.ClauseType);

                wordhelper.GotoBookMark("myfs");//贸易方式
                wordhelper.InsertText(invoice.Trade);
                wordhelper.GotoBookMark("ydg");//运抵国
                wordhelper.InsertText(invoice.TansportCountry);
                wordhelper.GotoBookMark("ckka");//出口口岸
                wordhelper.InsertText(invoice.StartHaven + ",CHINA");
                wordhelper.GotoBookMark("mdg");//目的港
                wordhelper.InsertText(invoice.EdnHaven + "," + invoice.TansportCountry);
                if (invoice.ShipmentDate != null)
                {
                    wordhelper.GotoBookMark("zyqx");//装运日期
                    wordhelper.InsertText(invoice.ShipmentDate.Value.ToShortDateString());
                }
                if (invoice.ValidDate != null)
                {
                    wordhelper.GotoBookMark("yxqx");//有效日期
                    wordhelper.InsertText(invoice.ValidDate.Value.ToShortDateString());
                }

                wordhelper.GotoBookMark("xyzh");//信用证号
                wordhelper.InsertText(invoice.CreditCardNo);

                if (invoice.AccountDate != null)
                {
                    wordhelper.GotoBookMark("kzrq");//开征日期
                    wordhelper.InsertText(invoice.AccountDate.Value.ToShortDateString());
                }

                wordhelper.GotoBookMark("childContentMt");//唛头
                wordhelper.InsertText(invoice.Mark);
                //是否转运
                wordhelper.GotoBookMark("sfzy");
                string strChar = invoice.IsTransfer.Value ? "YES" : "NO";
                wordhelper.InsertText(strChar);
           
                //是否分批
                wordhelper.GotoBookMark("sffp");
                strChar = invoice.IsBatches.Value ? "YES" : "NO";
                wordhelper.InsertText(strChar);

                if (invoice.CustomerID.HasValue)
                {
                    Guid customerid = invoice.CustomerID.GetValueOrDefault();
                    Customer customer = _Entities.Customer.Where(v => v.ID.Equals(customerid)).FirstOrDefault();
                    if (customer != null)
                    {
                        wordhelper.GotoBookMark("shr");//收货人
                        wordhelper.InsertText(customer.NameEn + (char)10 + customer.AddressEn);//客户地址
                        wordhelper.GotoBookMark("tzr");//通知人
                        wordhelper.InsertText(customer.NameEn + (char)10 + customer.AddressEn);//客户地址
                    }
                }
                if (invoice.CompanyID.HasValue)
                {
                    Guid companyid = invoice.CompanyID.GetValueOrDefault();
                    Company company = _Entities.Company.Where(v => v.ID.Equals(companyid)).FirstOrDefault();
                    if (company != null)
                    {
                        wordhelper.GotoBookMark("jydw");//经营单位
                        wordhelper.InsertText(company.NameEH + (char)10 + company.AddressEH);//公司英文，公司地址
                    }
                }
                invoice.ProductPack.Load();

                //插入价格条款、起运国、起运港口信息
                wordhelper.GotoBookMark("childContentHead");                
                if (invoice.PriceClause == "C&F")
                {
                    wordhelper.InsertText(invoice.PriceClause + "   " + invoice.EdnHaven + ","+invoice.TansportCountry);
                }
                else
                {
                    wordhelper.InsertText(invoice.PriceClause + "   " + invoice.StartHaven + ",CHINA");
                }

                //添加唛头
                wordhelper.GotoBookMark("childContentMt");
                wordhelper.InsertText(invoice.Mark);

                Table table = wordhelper.AddTable(wordhelper.GotoBookMark("childContentArea"), invoice.ProductPack.Count + 2, 7);
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
                double zongtiji = 0;
                for (int i = 0; i < invoice.ProductPack.Count; i++)
                {
                    Guid productid = invoice.ProductPack.ElementAt(i).ProductID.GetValueOrDefault();
                    Product product = _Entities.Product.Where(v => v.ID.Equals(productid)).FirstOrDefault();
                    if (product == null)
                    {
                        product = new Product();
                    }
                    invoice.ProductSummary.Load();

                    for (int s = 0; s < invoice.ProductSummary.Count; s++)
                    {
                        invoice.ProductSummary.ElementAt(s).ProductReference.Load();
                    }

                    ProductSummary productSummary = invoice.ProductSummary.Where(v => v.ProductReference.Value.Equals(product)).FirstOrDefault();

                    if (productSummary == null)
                    {
                        productSummary = new ProductSummary();
                    }
                    table.Cell(count, 1).Range.Text = string.IsNullOrEmpty(product.NameCode) ? product.NameEH : (product.NameCode + " " + product.NameEH);
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
                    //显示报关价格
                    table.Cell(count, 6).Range.Text = invoice.CurrencyType.ToString() + productSummary.ExportPrice.GetValueOrDefault().ToString();
                    //显示单款总体积
                    //table.Cell(count, 6).Range.Text = invoice.ProductPack.ElementAt(i).PackBulk.GetValueOrDefault().ToString();
                    zongtiji+= invoice.ProductPack.ElementAt(i).PackBulk.GetValueOrDefault();

                    jgcount += productSummary.ExportAmount.GetValueOrDefault();//价格总和
                    table.Cell(count, 7).Range.Text = invoice.CurrencyType.ToString() + productSummary.ExportAmount.GetValueOrDefault().ToString();
                    count++;
                }

                table.Cell(count, 1).Merge(table.Cell(count, 7));
                table.Cell(count, 1).Range.Text = "—".PadLeft(40, '—');
                table.Cell(count + 1, 1).Range.Text = "TOTAL：";
                table.Cell(count + 1, 2).Range.Text = jscount + jsunit;
                table.Cell(count + 1, 3).Range.Text = slcount + slunit;
                table.Cell(count + 1, 4).Range.Text = mzcount + "KG";
                table.Cell(count + 1, 5).Range.Text = jzcount + "KG";
                table.Cell(count + 1, 7).Range.Text = ZhouBo.Core.BasicOperate.GetString(invoice.CurrencyType, true) + jgcount;

                wordhelper.GotoBookMark("ckje");//出口金额
                wordhelper.InsertText(ZhouBo.Core.BasicOperate.GetString(invoice.CurrencyType, true) + jgcount);

                wordhelper.GotoBookMark("zongtiji");//总体积
                wordhelper.InsertText(zongtiji.ToString());

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
        #endregion

    }
}
