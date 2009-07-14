using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Security;
using System.Configuration;
using LZL.ForeignTrade.DataEntity;

namespace LZL.ForeignTrade.Controllers
{
    [HandleError]
    public class AdminController : Controller
    {
        /// <summary>
        /// 管理首页
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 用户管理
        /// </summary>
        /// <param name="searchType"></param>
        /// <param name="searchInput"></param>
        /// <param name="page">页码</param>
        /// <returns></returns>
        public ActionResult ManageUser(string searchType, string searchInput, int? page)
        {
            List<SelectListItem> searchOptionList = new List<SelectListItem>() 
            {
                new SelectListItem() { Value = "UserName", Text = "用户名" },
                new SelectListItem() { Value = "Email", Text = "电子邮件" }
            };
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["searchOptionList"] = new SelectList(searchOptionList, "Value", "Text", searchType ?? "UserName");
            ViewData["searchInput"] = searchInput ?? string.Empty;
            ViewData["UsersOnlineNow"] = Membership.GetNumberOfUsersOnline().ToString();
            int totalRecords;
            MembershipUserCollection viewData;
            if (String.IsNullOrEmpty(searchInput))
            {
                viewData = Membership.GetAllUsers(((page ?? 1) - 1), pagesize, out totalRecords);
            }
            else if (searchType == "Email")
            {
                viewData = Membership.FindUsersByEmail(searchInput, ((page ?? 1) - 1), pagesize, out totalRecords);
            }
            else
            {
                viewData = Membership.FindUsersByName(searchInput, ((page ?? 1) - 1), pagesize, out totalRecords);
            }
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)totalRecords) / pagesize);
            return View(viewData);
        }

        public ActionResult ManageRole()
        {
            return View(Roles.GetAllRoles());
        }
        /// <summary>
        /// 编辑用户
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>

        public ActionResult EditUser(string id)
        {
            ViewData["roles"] = (String[])Roles.GetAllRoles();
            MembershipUser membershipUser = Membership.GetUser(id);
            return View(membershipUser);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditUser(string id, FormCollection form)
        {
            MembershipUser membershipUser = Membership.GetUser(id);
            membershipUser.Email = form["Email"];
            if (string.IsNullOrEmpty(form["approved"]))
            {
                membershipUser.IsApproved = false;
            }
            else
            {
                membershipUser.IsApproved = true;
            }
            membershipUser.Comment = form["note"];
            string password = membershipUser.GetPassword();
            if (!form["Password"].Equals(password))
            {
                membershipUser.ChangePassword(membershipUser.GetPassword(), form["Password"]);
            }

            Membership.UpdateUser(membershipUser);
            string[] userroles = Roles.GetRolesForUser(id);
            if (userroles.Length > 0)
            {
                Roles.RemoveUserFromRoles(id, userroles);
            }
            if (!string.IsNullOrEmpty(form["role"]))
            {
                string[] roles = form["role"].Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).
                    Where(v => !v.Equals("false", StringComparison.CurrentCultureIgnoreCase)).ToArray();
                if (roles.Length > 0)
                {
                    Roles.AddUserToRoles(id, roles);
                }
            }
            return RedirectToAction("ManageUser");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult AddRole()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRole(FormCollection form)
        {
            if (!string.IsNullOrEmpty(form["rolename"]))
            {
                Roles.CreateRole(form["rolename"].ToUpper());
            }
            return RedirectToAction("ManageRole");
        }

        public ActionResult DeleteRole(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < ids.Length; i++)
                {
                    try
                    {
                        Roles.DeleteRole(ids[i], true);
                    }
                    catch (Exception err)
                    {
                        return View("Error", new HandleErrorInfo(err, "Admin", "DeleteRole"));
                    }
                }
            }
            return RedirectToAction("ManageRole");
        }

<<<<<<< .mine
        /// <summary>
        /// Managers the dictionary.---add by lj
        /// </summary>
        /// <param name="quyerCondition">The quyer condition.</param>
        /// <param name="queryvalue">The queryvalue.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        [AcceptVerbs("Post", "Get")]
        public ActionResult ManageDictionary(string quyerCondition, string queryvalue, int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "Type", "", "Dictionary")) / pagesize);
            var customers = _Entities.Dictionary.OrderBy(v => v.Type).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(customers);
        }

        /// <summary>
        /// Edits the specified id.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult EditDictionary(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Dictionary.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the dictionary.
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditDictionary(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageDictionary");
        }

        /// <summary>
        /// Adds this instance.
        /// </summary>
        /// <returns></returns>
        public ActionResult AddDictionary()
        {
            return View();
        }

        /// <summary>
        /// Adds the dictionary.
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddDictionary(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
            {
                return View();
            }

            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageDictionary");
        }

        /// <summary>
        /// Deletes the specified id.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteDictionary(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.Dictionary.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("ManageDictionary", new { page = 1 });
        }

=======

        /// <summary>
        /// Managers the dictionary.---add by lj
        /// </summary>
        /// <param name="quyerCondition">The quyer condition.</param>
        /// <param name="queryvalue">The queryvalue.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        [AcceptVerbs("Post", "Get")]
        public ActionResult ManageDictionary(string quyerCondition, string queryvalue, int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "Type", "", "Dictionary")) / pagesize);
            var customers = _Entities.Dictionary.OrderBy(v => v.Type).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(customers);
        }

        /// <summary>
        /// Edits the specified id.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult EditDictionary(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Dictionary.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the dictionary.
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditDictionary(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageDictionary");
        }

        /// <summary>
        /// Adds this instance.
        /// </summary>
        /// <returns></returns>
        public ActionResult AddDictionary()
        {
            return View();
        }

        /// <summary>
        /// Adds the dictionary.
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddDictionary(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
            {
                return View();
            }

            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageDictionary");
        }

        /// <summary>
        /// Deletes the specified id.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteDictionary(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.Dictionary.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("ManageDictionary", new { page = 1 });
        }

>>>>>>> .r29
    }
}

