using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Reflection;
using Excel=Microsoft.Office.Interop.Excel;
namespace LZL.ForeignTrade.Controllers
{
    public class ExcelHelper : IDisposable
    {
        object missing = System.Reflection.Missing.Value;
        Excel.Workbook myBook = null;
        Excel.Application myExcel = null;
        Excel.Worksheet mySheet = null;
        public ExcelHelper(string path)
        {
            myExcel = new Excel.Application();
            myExcel.Application.Workbooks.Open(path, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing);
            myBook = myExcel.Workbooks[1]; //工作薄
            mySheet = (Excel.Worksheet)myBook.ActiveSheet;//工作区
            myExcel.Visible = false;
        }

        public void WriteValue(int row, int column, object v)
        {
            mySheet.Cells[row, column] = v;
        }

        public void Save()
        {
            myBook.Save();
        }

        public void MergeCell(int row, int startcolumn, int endcolumn)
        {
            mySheet.get_Range(mySheet.Cells[row, startcolumn], mySheet.Cells[row, endcolumn]).Merge(Type.Missing);
        }

        public void SetCellAlignment(int row, int column, int alignment)//对齐方式
        {
            if (alignment == 0)
            {
                ((Excel.Range)mySheet.Cells[row, column]).HorizontalAlignment = Excel.XlHAlign.xlHAlignLeft;
            }
            else if (alignment == 1)
            {
                ((Excel.Range)mySheet.Cells[row, column]).HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
            }
            else if (alignment == 2)
            {
                ((Excel.Range)mySheet.Cells[row, column]).HorizontalAlignment = Excel.XlHAlign.xlHAlignRight;
            }
            else
            {
                ((Excel.Range)mySheet.Cells[row, column]).HorizontalAlignment = Excel.XlHAlign.xlHAlignLeft;
            }
        }

        #region IDisposable 成员

        public void Dispose()
        {
            if (myExcel != null)
            {
                myExcel.Quit();
            }
            if (mySheet != null)
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(mySheet);
                mySheet = null;
            }
            if (myBook != null)
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(myBook);
                myBook = null;
            }
            GC.Collect();
        }

        #endregion
    }
}
