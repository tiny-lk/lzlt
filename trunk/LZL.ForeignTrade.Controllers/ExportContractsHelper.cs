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

        public byte[] BuilderPackingList(Guid id, string path, string targetpath)
        {
            Entities _Entities = new Entities();
            ExportContracts exportContracts = _Entities.ExportContracts.Where(v => v.ID.Equals(id)).FirstOrDefault();
            targetpath += exportContracts.ID.ToString() + ".doc";
            File.Copy(path, targetpath, true);
            using (WordHelper wordhelper = new WordHelper(targetpath))
            {
                wordhelper.GotoBookMark("date");
                wordhelper.InsertText(DateTime.Now.ToShortDateString());

                if (exportContracts.CustomerID.HasValue)
                {
                    Guid customerid = exportContracts.CustomerID.GetValueOrDefault();
                    Customer customer = _Entities.Customer.Where(v => v.ID.Equals(customerid)).FirstOrDefault();
                    if (customer != null)
                    {
                        wordhelper.GotoBookMark("to");
                        wordhelper.InsertText(customer.NameEn + (char)10 + customer.AddressEn);//客户地址
                    }
                }
                exportContracts.ProductPack.Load();
                Table table = wordhelper.AddTable(wordhelper.GotoBookMark("content"), exportContracts.ProductPack.Count + 2, 7);
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
                for (int i = 0; i < exportContracts.ProductPack.Count; i++)
                {
                    Guid productid = exportContracts.ProductPack.ElementAt(i).ProductID.GetValueOrDefault();
                    Product product = _Entities.Product.Where(v => v.ID.Equals(productid)).FirstOrDefault();
                    if (product == null)
                    {
                        product = new Product();
                    }
                    exportContracts.ProductSummary.Load();
                    ProductSummary productSummary = exportContracts.ProductSummary.Where(v => v.Product.Equals(product)).FirstOrDefault();
                    if (productSummary == null)
                    {
                        productSummary = new ProductSummary();
                    }
                    table.Cell(count, 1).Range.Text = string.IsNullOrEmpty(product.NameEH) ? product.NameCH : product.NameEH;
                    table.Cell(count, 1).Select();
                    table.Cell(count, 1).Range.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphLeft;
                    jscount += exportContracts.ProductPack.ElementAt(i).PieceAmount.GetValueOrDefault();//件数
                    jsunit = DataHelper.GetDictionaryName(exportContracts.ProductPack.ElementAt(i).PackUnitEN);
                    table.Cell(count, 2).Range.Text = exportContracts.ProductPack.ElementAt(i).PieceAmount.GetValueOrDefault() + jsunit;
                    slcount += productSummary.Amount.GetValueOrDefault();
                    slunit = DataHelper.GetDictionaryName(productSummary.UnitEN);
                    table.Cell(count, 3).Range.Text = productSummary.Amount.GetValueOrDefault() + slunit;
                    mzcount += exportContracts.ProductPack.ElementAt(i).GrossWeight.GetValueOrDefault();//毛重
                    table.Cell(count, 4).Range.Text = exportContracts.ProductPack.ElementAt(i).GrossWeight.GetValueOrDefault() + "KG";
                    jzcount += exportContracts.ProductPack.ElementAt(i).NetWeight.GetValueOrDefault();//净重
                    table.Cell(count, 5).Range.Text = exportContracts.ProductPack.ElementAt(i).NetWeight.GetValueOrDefault() + "KG";
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
                table.Cell(count + 1, 7).Range.Text = "USD" + jgcount;
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

    }
}
