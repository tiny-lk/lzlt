using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LZL.ForeignTrade.Controllers
{
    public class WordHelper:IDisposable
    {
        private Microsoft.Office.Interop.Word.ApplicationClass oWordApplic;
        object missing = System.Reflection.Missing.Value;
        private Microsoft.Office.Interop.Word.Document oDoc;

        public WordHelper(string path)
        {
            oWordApplic = new Microsoft.Office.Interop.Word.ApplicationClass();
            oWordApplic.Visible = false;
            object fileName = path;
            object readOnly = false;
            object isVisible = false;
            try
            {
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
                try
                {
                    foreach (var item in v)
                    {
                        if (BookMarkExist(item.Key))
                        {
                            GotoBookMark(item.Key);
                            InsertText(item.Value);
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
        public void GotoBookMark(string strBookMarkName)
        {
            object missing = System.Reflection.Missing.Value;
            object Bookmark = (int)Microsoft.Office.Interop.Word.WdGoToItem.wdGoToBookmark;
            object NameBookMark = strBookMarkName;
            oWordApplic.Selection.GoTo(ref Bookmark, ref missing, ref missing, ref NameBookMark);
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

        #region IDisposable 成员

        public void Dispose()
        {
            GCForQuit();
        }

        #endregion
    }
}
