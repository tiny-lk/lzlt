using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Word;

namespace LZL.ForeignTrade.Controllers
{
    public class WordHelper:IDisposable
    {
        private Microsoft.Office.Interop.Word.ApplicationClass oWordApplic;
        object missing = System.Reflection.Missing.Value;
        public Microsoft.Office.Interop.Word.Document oDoc;

        public WordHelper(string path)
        {
            oWordApplic = new Microsoft.Office.Interop.Word.ApplicationClass();
            oWordApplic.Visible = false;
            object fileName = path;
            object readOnly = false;
            object isVisible = false;
            try
            {
                if (oWordApplic.Documents.Count > 0)
                { 
                    oDoc = oWordApplic.ActiveDocument; 
                    oDoc.Close(ref missing, ref missing, ref missing); 
                }  

                oDoc = oWordApplic.Documents.Open(ref fileName, ref missing, ref readOnly,
                                          ref missing, ref missing, ref missing, ref missing, ref missing, ref missing,
                                          ref missing, ref missing, ref isVisible, ref missing, ref missing, ref missing, ref missing);
                oDoc.Activate();
            }
            catch
            {
                GCForQuit();
            }
        }

        public void WriteDoc(Dictionary<string, string> v)
        {
            lock (oWordApplic)
            {
                 object missing = System.Reflection.Missing.Value;
                try
                {
                    foreach (var item in v)
                    {
                        if (BookMarkExist(item.Key))
                        {
                            Range range = GotoBookMark(item.Key);
                            if (item.Key.Equals("content"))
                            {
                                Table oTable=oDoc.Tables.Add(range, 1, 4, ref missing, ref missing);
                                oTable.PreferredWidthType = WdPreferredWidthType.wdPreferredWidthPercent;
                                oTable.PreferredWidth = 90;
                                oTable.Select();
                                oTable.Rows.Alignment = WdRowAlignment.wdAlignRowRight;
                                oWordApplic.Selection.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphRight;
                                oTable.Cell(1, 1).Range.Text = "test";
                                oTable.Cell(1, 2).Range.Text = "test2";
                                oTable.Cell(1, 3).Range.Text = "test3";
                                oTable.Cell(1, 4).Range.Text = "test4";

                            }
                            else
                            {
                                InsertText(item.Value);
                            }
                        }
                    }
                    oDoc.Save();
                }
                catch
                {
                    throw ;
                }
                finally
                {
                    GCForQuit();
                }
            }

        }

        public void Save()
        {
            oDoc.Save();
        }

        public Table AddTable(Range range, int r, int c)
        {
            object missing = System.Reflection.Missing.Value;
            return oDoc.Tables.Add(range, r, c, ref   missing, ref missing);
        }
        /// <summary>
        /// 在垃圾回收时，在任务管理器中还存在当前操作的WORD的进程
        /// 查阅资料，必须在另一个方法中在调用GC才可以真正的清楚掉，当前的进程
        /// </summary>
        private void GCForQuit()
        {
            if (oWordApplic != null)
            {
                oWordApplic.Quit(ref missing, ref missing, ref missing);
            }
            if (oDoc != null)
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(oDoc);
                oDoc = null;
            }
            if (oWordApplic != null)
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(oWordApplic);
                oWordApplic = null;
            }
            GC.Collect();
        }

        /// <summary>
        /// 定位到书签
        /// </summary>
        /// <param name="strBookMarkName">Book名称</param>
        public Range GotoBookMark(string strBookMarkName)
        {
            object missing = System.Reflection.Missing.Value;
            object Bookmark = (int)Microsoft.Office.Interop.Word.WdGoToItem.wdGoToBookmark;
            object NameBookMark = strBookMarkName;
            return oWordApplic.Selection.GoTo(ref Bookmark, ref missing, ref missing, ref NameBookMark);
        }
        /**/
        /// <summary>
        /// 定位到文档开头
        /// </summary>
        public void GoToTheBeginning()
        {
            object missing = System.Reflection.Missing.Value;
            object unit;
            unit = Microsoft.Office.Interop.Word.WdUnits.wdStory;
            oWordApplic.Selection.HomeKey(ref unit, ref missing);

        }
        /// <summary>
        /// 插入文本操作,所有的打开与保存操作在外部执行
        /// </summary>
        /// <param name="strText"></param>
        public void InsertText(string strText)
        {
            oWordApplic.Selection.TypeText(strText);
        }

        public bool BookMarkExist(string strBookMarkName)
        {
            return oDoc.Bookmarks.Exists(strBookMarkName);
        }

        /// <summary>
        /// 首行缩进
        /// </summary>
        /// <param name="fltCount">float类型的数值</param>
        public void SetFirstLineIndent(float fltCount)
        {
            oWordApplic.Selection.ParagraphFormat.FirstLineIndent = fltCount;
           
        }

        /// <summary>
        /// 左缩进
        /// </summary>
        /// <param name="fltCount">float类型的数值</param>
        public void SetLeftIndent(float fltCount)
        {
            oWordApplic.Selection.ParagraphFormat.LeftIndent = fltCount;
           
        }

        /// <summary>
        /// 插入空行
        /// </summary>
        public void InsertLineBreakBySelection()
        {
            oWordApplic.Selection.TypeParagraph();
        }

        /// <summary>
        /// 右缩进
        /// </summary>
        /// <param name="fltCount">float类型的数值</param>
        public void SetRightIndent(float fltCount)
        {
            oWordApplic.Selection.ParagraphFormat.RightIndent = fltCount;
        }

        #region IDisposable 成员

        public void Dispose()
        {
            GCForQuit();
        }

        #endregion
    }
}
