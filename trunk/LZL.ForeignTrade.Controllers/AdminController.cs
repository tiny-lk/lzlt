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
            return RedirectToAction("ManageUser");
        }

        #region 用户管理
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
        #endregion

        #region 角色管理

        public ActionResult ManageRole()
        {
            return View(Roles.GetAllRoles());
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
        #endregion

        #region 岗位管理

        public ActionResult ManageStep()
        {
            Entities _Entities = new Entities();
            List<Step> lstStep = new List<Step>();
            lstStep = _Entities.Step.OrderBy(v => v.ID).ToList();
            return View(lstStep);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult AddStep()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddStep(FormCollection form)
        {
            if (string.IsNullOrEmpty(form["region"]))
            {
                return View();
            }
            //Entities _Entities = new Entities();
            //SharedController.mainTable(form, _Entities);
            //_Entities.SaveChanges();

            string sql = "insert into step(name)values('" + form["Step♂Name"] + "')";
            SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["FTConnection"].ToString(), System.Data.CommandType.Text, sql);


            return RedirectToAction("ManageStep");
        }

        public ActionResult DeleteStep(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.Step.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("ManageStep");
        }
        #endregion

        #region 数据字典管理 ---add by lj
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

            List<Dictionary> lstDic = new List<Dictionary>();
            if (!string.IsNullOrEmpty(queryvalue))
            {
                lstDic = _Entities.Dictionary.Where(v => v.Type.IndexOf(queryvalue) >= 0).OrderBy(v => v.Type).ToList();
            }
            else
            {
                lstDic = _Entities.Dictionary.OrderBy(v => v.Type).ToList();
            }

            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)lstDic.Count) / pagesize);
            var dictionarys = lstDic.Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(dictionarys);
        }

        /// <summary>
        /// Edits the specified id.---add by lj
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
        /// Edits the dictionary.---add by lj
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
        /// Adds this instance.---add by lj
        /// </summary>
        /// <returns></returns>
        public ActionResult AddDictionary()
        {
            return View();
        }

        /// <summary>
        /// Adds the dictionary.---add by lj
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
        /// Deletes the specified id.---add by lj
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
        #endregion

        #region 公司信息管理 ---add by lj
        /// <summary>
        /// Managers the company.---add by lj
        /// </summary>
        /// <param name="quyerCondition">The quyer condition.</param>
        /// <param name="queryvalue">The queryvalue.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        [AcceptVerbs("Post", "Get")]
        public ActionResult ManageCompany(string quyerCondition, string queryvalue, int? page)
        {
            int pagecount = 1;
            var querylist = DataHelper.GetCompanys(string.Empty, string.Empty, 1, out pagecount);
            ViewData["pagecount"] = pagecount;
            return View(querylist);
        }

        /// <summary>
        /// Edits the specified id.---add by lj
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult EditCompany(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Company.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        public ActionResult DetailsCompany(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Company.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }
        /// <summary>
        /// Edits the company.---add by lj
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditCompany(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageCompany");
        }

        /// <summary>
        /// Adds this instance.---add by lj
        /// </summary>
        /// <returns></returns>
        public ActionResult AddCompany()
        {
            return View();
        }

        /// <summary>
        /// Adds the company.---add by lj
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCompany(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
            {
                return View();
            }

            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageCompany");
        }

        /// <summary>
        /// Deletes the specified id.---add by lj
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteCompany(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.Company.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("ManageCompany", new { page = 1 });
        }
        #endregion

        #region 部门信息管理 ---add by lj
        /// <summary>
        /// Managers the Department.---add by lj
        /// </summary>
        /// <param name="quyerCondition">The quyer condition.</param>
        /// <param name="queryvalue">The queryvalue.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        public ActionResult ManageDepartment(string quyerCondition, string queryvalue, int? page)
        {
            Entities _Entities = new Entities();
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            ViewData["pagecount"] = (int)Math.Ceiling((double)((double)DataHelper.Getcount(page, "Name", "", "Department")) / pagesize);
            var companys = _Entities.Department.OrderBy(v => v.Name).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(companys);
        }

        /// <summary>
        /// Manages the department.
        /// </summary>
        /// <param name="strid">The strid.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        public ActionResult ManageChildDepartment(string id, int? page)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            int pagesize = int.Parse(ConfigurationManager.AppSettings["pagenumber"]);
            var dataList = _Entities.Department.Where(v => v.ParentId.Value.Equals(guid));
            ViewData["pagecount"] = (int)Math.Ceiling((double)(dataList.Count()) / pagesize);
            var companys = dataList.OrderBy(v => v.Name).Skip(pagesize * ((page ?? 1) - 1)).Take(pagesize).ToList();
            return View(companys);
        }

        /// <summary>
        /// Edits the specified id.---add by lj
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult EditDepartment(string id)
        {
            Entities _Entities = new Entities();
            Guid guid = new Guid(id);
            return View(_Entities.Department.Where(v => v.ID.Equals(guid)).FirstOrDefault());
        }

        /// <summary>
        /// Edits the Department.---add by lj
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditDepartment(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
                return View();
            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageDepartment");
        }

        /// <summary>
        /// Adds this instance.---add by lj
        /// </summary>
        /// <returns></returns>
        public ActionResult AddDepartment()
        {
            return View();
        }

        /// <summary>
        /// Adds the Department.---add by lj
        /// </summary>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddDepartment(FormCollection formvalues)
        {
            if (string.IsNullOrEmpty(formvalues["region"]))
            {
                return View();
            }

            Entities _Entities = new Entities();
            SharedController.mainTable(formvalues, _Entities);
            _Entities.SaveChanges();
            return RedirectToAction("ManageDepartment");
        }

        /// <summary>
        /// Deletes the specified id.---add by lj
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns></returns>
        public ActionResult DeleteDepartment(string id)
        {
            Entities entities = new Entities();
            string[] ids = id.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < ids.Length; i++)
            {
                Guid guid = new Guid(ids[i]);
                var dictionary = entities.Department.Where(v => v.ID.Equals(guid)).FirstOrDefault();
                entities.DeleteObject(dictionary);
            }
            entities.SaveChanges();
            return RedirectToAction("ManageDepartment", new { page = 1 });
        }
        #endregion

        #region 部门用户关联
        /// <summary>
        /// Manages the user relation.
        /// </summary>
        /// <param name="searchType">Type of the search.</param>
        /// <param name="searchInput">The search input.</param>
        /// <returns></returns>
        public ActionResult ManageUserRelation(string searchType, string searchInput)
        {
            List<SelectListItem> searchOptionList = new List<SelectListItem>() 
            {
                new SelectListItem() { Value = "UserName", Text = "用户名" },
                new SelectListItem() { Value = "Email", Text = "电子邮件" }
            };

            ViewData["searchOptionList"] = new SelectList(searchOptionList, "Value", "Text", searchType ?? "UserName");
            ViewData["searchInput"] = searchInput ?? string.Empty;

            MembershipUserCollection viewData;
            if (String.IsNullOrEmpty(searchInput))
            {
                viewData = Membership.GetAllUsers();
            }
            else if (searchType == "Email")
            {
                viewData = Membership.FindUsersByEmail(searchInput);
            }
            else
            {
                viewData = Membership.FindUsersByName(searchInput);
            }

            Entities _Entities = new Entities();
            ViewData["UserRelation"] = _Entities.UserDepartRelation.ToList();

            return View(viewData);
        }

        /// <summary>
        /// Manages the user relation.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <param name="formvalues">The formvalues.</param>
        /// <returns></returns>
        public ActionResult SaveUserRelation()
        {
            Entities _Entities = new Entities();
            string strParamIds = Request["id"];
            string strDepartId = Request["DepartId"];

            //删除旧的勾选项
            List<UserDepartRelation> userList = _Entities.UserDepartRelation.Where(v => v.DepartId.Equals(strDepartId)).ToList();
            foreach (UserDepartRelation objUser in userList)
            {
                _Entities.DeleteObject(objUser);
            }

            //保存新的勾选项
            if (strParamIds != "undefined")
            {
                string[] ids = strParamIds.Split(new[] { '♂' }, StringSplitOptions.RemoveEmptyEntries);

                for (int i = 0; i < ids.Length; i++)
                {
                    var objUserRel = new UserDepartRelation();

                    // Deserialize (Include white list!)
                    //TryUpdateModel(objUserRel,new {"UserId","DepartId"},formvalues.ToValueProvider());
                    // Validate
                    //if (String.IsNullOrEmpty(objUserRel.UserId))
                    //    ModelState.AddModelError("UserId", "UserId is required!");
                    //if (String.IsNullOrEmpty(objUserRel.DepartId))
                    //    ModelState.AddModelError("DepartId", "DepartId is required!");
                    // If valid, save movie to database
                    //if (ModelState.IsValid)
                    //{
                    //}

                    objUserRel.ID = Guid.NewGuid();
                    objUserRel.DepartId = strDepartId;
                    objUserRel.UserId = ids[i];
                    _Entities.AddToUserDepartRelation(objUserRel);
                }
            }

            _Entities.SaveChanges();
            return RedirectToAction("ManageDepartment");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ManageMenu()
        {
            return View();
        }

        //[AcceptVerbs(HttpVerbs.Post)]
        //public ActionResult ManageMenu()
        //{

        //    return View();
        //}
        #endregion
    }
}

