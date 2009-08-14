using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Security;
using System.Configuration;
using LZL.ForeignTrade.DataEntity;
using System.IO;
using System.Web;

namespace LZL.ForeignTrade.Controllers
{
    [HandleError]
    public class AttachmentController:Controller
    {
        /// <summary>
        /// 管理首页
        /// </summary>
        /// <returns></returns>
        public ActionResult AttachmentDownload()
        {
            DirectoryInfo dires = new DirectoryInfo(Server.MapPath("../Views/Attachment/ResourceFolder/"));
            FileInfo[] files = dires.GetFiles();

            List<string> lstReturn = new List<string>();
            foreach (FileInfo f in files)
            {
                lstReturn.Add(f.Name);
            }
            ViewData["Resource"] = lstReturn;

            return View();
        }

        /// <summary>
        /// Attachments the manager.
        /// </summary>
        /// <param name="quyerCondition">The quyer condition.</param>
        /// <param name="queryvalue">The queryvalue.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        public ActionResult AttachmentManager(string quyerCondition, string queryvalue, int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "KeyName", "", "TableAttachment")) / pagesize);
            var pageAttachment = _Entities.TableAttachment.OrderBy(v => v.KeyName).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(pageAttachment);
        }
      
        /// <summary>
        /// Attachments the upload.
        /// </summary>
        /// <param name="fid">The fid.</param>
        /// <returns></returns>
        public ActionResult AttachmentUpload()
        {
            return View("AttachmentUpload");
        }

        /// <summary>
        /// Attachments the upload.
        /// </summary>
        /// <param name="form">The form.</param>
        /// <param name="Attachment">The attachment.</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public void AttachmentUpload(FormCollection form, HttpPostedFileBase FileData)
        {
            TableAttachment attachTemp = new TableAttachment();
            attachTemp.id = Guid.NewGuid();
            attachTemp.KeyName = form["KeyName"];
            attachTemp.Notes = form["Notes"];
            if (FileData != null)
            {
                byte[] array = new byte[FileData.ContentLength];
                FileData.InputStream.Read(array, 0, FileData.ContentLength);
                attachTemp.FileData = array;
                attachTemp.FileExt = FileData.FileName.Substring(FileData.FileName.LastIndexOf(".") + 1);
                attachTemp.FileName = FileData.FileName.Substring(FileData.FileName.LastIndexOf("\\") + 1);
            }

            Entities entities = new Entities();
            entities.AddToTableAttachment(attachTemp);
            entities.SaveChanges();
        }

        /// <summary>
        /// Deletes the attachment.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteAttachment(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.TableAttachment.Where(v => v.id.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("AttachmentManager", new { page = 1 });
        }

        /// <summary>
        /// Views the attachment.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ViewAttachment(string id)
        {
            Entities entities = new Entities();

            Guid guid = new Guid(id);
            var attachTemp = entities.TableAttachment.Where(v => v.id.Equals(guid)).FirstOrDefault();

            return View(attachTemp);
        }
    }
}