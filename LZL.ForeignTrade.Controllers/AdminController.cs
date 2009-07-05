using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Security;
using System.Configuration;

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

        public ActionResult ManageRole(int? page)
        {
            return View();
        }
        /// <summary>
        /// 编辑用户
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EditUser(string id)
        {
            ViewData["roles"] = (String[])Roles.GetAllRoles();
            MembershipUser membershipUser = Membership.GetUser(id);

            return View(membershipUser);
        }
    }
}
