using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Word;
using LZL.ForeignTrade.DataEntity;
using System.IO;

namespace LZL.ForeignTrade.Controllers
{
    public class ExportContractsHelper
    {
        /// <summary>
        /// Singleton模式，类的唯一实例。
        /// </summary>
        public static readonly ExportContractsHelper Instance = new ExportContractsHelper();

        private ExportContractsHelper()
        {

        }

        public byte[] BuilderSales(Guid id, string path, string targetpath, out string filename)
        {
            Entities _Entities = new Entities();
            ExportContracts exportContracts = _Entities.ExportContracts.Where(v => v.ID.Equals(id)).FirstOrDefault();
            filename = exportContracts.Name + ".doc";
            targetpath += filename;
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                wordhelper.GotoBookMark("no");
                wordhelper.InsertText(exportContracts.Name);
                wordhelper.GotoBookMark("date");
                wordhelper.InsertText(exportContracts.Date.ToShortDateString());
                if (!string.IsNullOrEmpty(exportContracts.Type))
                {
                    Guid typeguid = new Guid(exportContracts.Type);
                    LZL.ForeignTrade.DataEntity.Dictionary dictionarytype = _Entities.Dictionary.Where(v => v.ID.Equals(typeguid)).FirstOrDefault();
                    if (dictionarytype != null)
                    {
                        wordhelper.GotoBookMark("contracttype");
                        string typename = dictionarytype.Name.Substring(0, 2);
                        if (typename.Equals("草拟", StringComparison.CurrentCultureIgnoreCase))
                        {
                            wordhelper.InsertText("（" + typename + "）");
                            wordhelper.GotoBookMark("contracttypeen");
                            wordhelper.InsertText("（draft）");
                        }
                        else if (typename.Equals("无效", StringComparison.CurrentCultureIgnoreCase))
                        {
                            wordhelper.InsertText("（" + typename + "）");
                            wordhelper.GotoBookMark("contracttypeen");
                            wordhelper.InsertText("（Invalid）");
                        }
                    }
                }
                

                if (exportContracts.CompanyID.HasValue)
                {
                    Guid companyid = exportContracts.CompanyID.GetValueOrDefault();
                    Company company = _Entities.Company.Where(v => v.ID.Equals(companyid)).FirstOrDefault();
                    if (company != null)
                    {
                        wordhelper.GotoBookMark("cncompany");
                        wordhelper.InsertText(company.NameCH);
                        wordhelper.GotoBookMark("encompany");
                        wordhelper.InsertText(company.NameEH);
                        wordhelper.GotoBookMark("cncompany2");
                        wordhelper.InsertText(company.NameCH);
                        wordhelper.GotoBookMark("encompany2");
                        wordhelper.InsertText(company.NameEH);
                        wordhelper.GotoBookMark("companyadd");
                        wordhelper.InsertText(company.AddressEH);
                        wordhelper.GotoBookMark("companyfax");
                        wordhelper.InsertText(company.Fax);
                        wordhelper.GotoBookMark("companytel");
                        wordhelper.InsertText(company.Phone);
                    }
                }

                if (exportContracts.CustomerID.HasValue)
                {
                    Guid customerid = exportContracts.CustomerID.GetValueOrDefault();
                    Customer customer = _Entities.Customer.Where(v => v.ID.Equals(customerid)).FirstOrDefault();
                    if (customer != null)
                    {
                        wordhelper.GotoBookMark("customername");
                        wordhelper.InsertText(customer.NameEn);
                        wordhelper.GotoBookMark("customertel");
                        wordhelper.InsertText(customer.Phone);
                        wordhelper.GotoBookMark("customeradd");
                        wordhelper.InsertText(customer.AddressEn);
                        wordhelper.GotoBookMark("customerfax");
                        wordhelper.InsertText(customer.Fax);
                    }
                }
                wordhelper.GotoBookMark("contenttitle");
                wordhelper.InsertText("           " + exportContracts.PriceClause + "   " + exportContracts.StartHaven + ",CHINA");
                exportContracts.ProductSummary.Load();
                Table table = wordhelper.AddTable(wordhelper.GotoBookMark("content"), exportContracts.ProductSummary.Count + 1, 4);
                table.PreferredWidthType = WdPreferredWidthType.wdPreferredWidthPercent;
                table.PreferredWidth = 95;
                table.Select();
                table.Rows.Alignment = WdRowAlignment.wdAlignRowRight;
                table.Range.Paragraphs.Alignment = WdParagraphAlignment.wdAlignParagraphRight;

                double sl = 0.0;//总数量
                double hjje = 0.0;//合计金额
                string dwmc = string.Empty;//单位名称
                int count = 1;
                for (int i = 0; i < exportContracts.ProductSummary.Count; i++)
                {
                    exportContracts.ProductSummary.ElementAt(i).ProductReference.Load();
                    Product product = exportContracts.ProductSummary.ElementAt(i).Product;
                    table.Cell(count, 1).Range.Text = string.IsNullOrEmpty(product.NameCode) ? product.NameEH : product.NameCode;
                    table.Cell(count, 1).Select();
                    dwmc = DataHelper.GetDictionaryName(exportContracts.ProductSummary.ElementAt(i).UnitEN);
                    sl += exportContracts.ProductSummary.ElementAt(i).Amount.GetValueOrDefault();
                    hjje += exportContracts.ProductSummary.ElementAt(i).ExportAmount.GetValueOrDefault();
                    table.Cell(count, 2).Range.Text = exportContracts.ProductSummary.ElementAt(i).Amount.GetValueOrDefault() + dwmc;
                    table.Cell(count, 3).Range.Text = exportContracts.ProductSummary.ElementAt(i).ExportPrice.GetValueOrDefault().ToString();
                    table.Cell(count, 4).Range.Text = exportContracts.ProductSummary.ElementAt(i).ExportAmount.GetValueOrDefault().ToString();
                    count++;
                }
                table.Cell(count, 1).Range.Text = "TOTAL：";
                table.Cell(count, 2).Range.Text = sl + dwmc;

                wordhelper.GotoBookMark("totalamount");
                wordhelper.InsertText("TOTAL VALUE：" + ZhouBo.Core.BasicOperate.GetString(exportContracts.CurrencyType, true) + hjje.ToString());

                wordhelper.GotoBookMark("total");
                wordhelper.InsertText(Number2English.Instance.NumberToString(hjje));

                wordhelper.GotoBookMark("timeshipment");
                wordhelper.InsertText(exportContracts.ShipmentDate.GetValueOrDefault().ToShortDateString());
                wordhelper.GotoBookMark("from");
                wordhelper.InsertText(exportContracts.StartHaven);
                wordhelper.GotoBookMark("to");
                wordhelper.InsertText(exportContracts.EdnHaven + "," + exportContracts.TansportCountry);
                wordhelper.GotoBookMark("errorvalue");
                wordhelper.InsertText(exportContracts.ErrorValue + "%");
                wordhelper.GotoBookMark("clausetype");
                wordhelper.InsertText(" BY "+exportContracts.ClauseType);
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
