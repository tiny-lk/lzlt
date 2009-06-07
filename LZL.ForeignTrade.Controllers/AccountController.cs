using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;

namespace LZL.ForeignTrade.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {

        // This constructor is used by the MVC framework to instantiate the controller using
        // the default forms authentication and membership providers.

        public AccountController()
            : this(null, null)
        {
        }

        // This constructor is not used by the MVC framework but is instead provided for ease
        // of unit testing this type. See the comments at the end of this file for more
        // information.
        public AccountController(IFormsAuthentication formsAuth, IMembershipService service)
        {
            FormsAuth = formsAuth ?? new FormsAuthenticationService();
            MembershipService = service ?? new AccountMembershipService();
        }

        public IFormsAuthentication FormsAuth
        {
            get;
            private set;
        }

        public IMembershipService MembershipService
        {
            get;
            private set;
        }

        public ActionResult LogOn()
        {

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1054:UriParametersShouldNotBeStrings",
            Justification = "Needs to take same parameter type as Controller.Redirect()")]
        public ActionResult LogOn(string userName, string password, bool rememberMe, string returnUrl)
        {

            if (!ValidateLogOn(userName, password))
            {
                return View();
            }

            FormsAuth.SignIn(userName, rememberMe);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public ActionResult LogOff()
        {

            FormsAuth.SignOut();

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Register()
        {

            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(string userName, string email, string password, string confirmPassword)
        {

            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

            if (ValidateRegistration(userName, email, password, confirmPassword))
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(userName, password, email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    FormsAuth.SignIn(userName, false /* createPersistentCookie */);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("_FORM", ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            return View();
        }

        [Authorize]
        public ActionResult ChangePassword()
        {

            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes",
            Justification = "Exceptions result in password not being changed.")]
        public ActionResult ChangePassword(string currentPassword, string newPassword, string confirmPassword)
        {

            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

            if (!ValidateChangePassword(currentPassword, newPassword, confirmPassword))
            {
                return View();
            }

            try
            {
                if (MembershipService.ChangePassword(User.Identity.Name, currentPassword, newPassword))
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("_FORM", "当前密码不正确或新的密码无效。");
                    return View();
                }
            }
            catch
            {
                ModelState.AddModelError("_FORM", "当前密码不正确或新的密码无效。");
                return View();
            }
        }

        public ActionResult ChangePasswordSuccess()
        {

            return View();
        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.User.Identity is WindowsIdentity)
            {
                throw new InvalidOperationException("不支持Windows身份验证。");
            }
        }

        #region Validation Methods

        private bool ValidateChangePassword(string currentPassword, string newPassword, string confirmPassword)
        {
            if (String.IsNullOrEmpty(currentPassword))
            {
                ModelState.AddModelError("currentPassword", "您必须指定当前密码。");
            }
            if (newPassword == null || newPassword.Length < MembershipService.MinPasswordLength)
            {
                ModelState.AddModelError("newPassword",
                    String.Format(CultureInfo.CurrentCulture,
                         "您指定的密码最少需要{0}个字符。",
                         MembershipService.MinPasswordLength));
            }

            if (!String.Equals(newPassword, confirmPassword, StringComparison.Ordinal))
            {
                ModelState.AddModelError("_FORM", "新密码和确认密码不匹配。");
            }

            return ModelState.IsValid;
        }

        private bool ValidateLogOn(string userName, string password)
        {
            if (String.IsNullOrEmpty(userName))
            {
                ModelState.AddModelError("username", "您必须指定一个用户名。");
            }
            if (String.IsNullOrEmpty(password))
            {
                ModelState.AddModelError("password", "您必须指定一个电子邮件地址。");
            }
            if (!MembershipService.ValidateUser(userName, password))
            {
                ModelState.AddModelError("_FORM", "用户名或密码错误。");
            }

            return ModelState.IsValid;
        }

        private bool ValidateRegistration(string userName, string email, string password, string confirmPassword)
        {
            if (String.IsNullOrEmpty(userName))
            {
                ModelState.AddModelError("username", "您必须指定一个用户名。");
            }
            if (String.IsNullOrEmpty(email))
            {
                ModelState.AddModelError("email", "您必须指定一个电子邮件地址。");
            }
            if (password == null || password.Length < MembershipService.MinPasswordLength)
            {
                ModelState.AddModelError("password",
                    String.Format(CultureInfo.CurrentCulture,
                         "您指定的密码最少需要{0}个字符。",
                         MembershipService.MinPasswordLength));
            }
            if (!String.Equals(password, confirmPassword, StringComparison.Ordinal))
            {
                ModelState.AddModelError("_FORM", "新密码和确认密码不匹配。");
            }
            return ModelState.IsValid;
        }

        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://msdn.microsoft.com/en-us/library/system.web.security.membershipcreatestatus.aspx for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "用户名已存在。请输入一个不同的用户名。";

                case MembershipCreateStatus.DuplicateEmail:
                    return "电子邮件地址已存在。请输入一个不同的电子邮件地址。 ";

                case MembershipCreateStatus.InvalidPassword:
                    return "密码的格式设置不正确。请输入正确格式的密码。";

                case MembershipCreateStatus.InvalidEmail:
                    return "电子邮件地址的格式设置不正确。请检查输入的值并重试。";

                case MembershipCreateStatus.InvalidAnswer:
                    return "密码提示问题答案的格式设置不正确。 请检查输入的值并重试。";

                case MembershipCreateStatus.InvalidQuestion:
                    return "密码提示问题的格式设置不正确。请检查输入的值并重试。";

                case MembershipCreateStatus.InvalidUserName:
                    return "在数据库中未找到用户名。请检查输入的值并重试。";

                case MembershipCreateStatus.ProviderError:
                    return "身份验证提供程序返回错误。请确认您的条目，然后重试。如果问题仍然存在，请与系统管理员联系。";

                case MembershipCreateStatus.UserRejected:
                    return "用户创建的请求已被取消。请确认您的条目，然后重试。如果问题仍然存在，请与系统管理员联系。";

                default:
                    return "发生一个未知的错误。请确认您的条目，然后重试。如果问题仍然存在，请与系统管理员联系。";
            }
        }
        #endregion

        /// <summary>
        /// 显示当前用户信息
        /// </summary>
        /// <returns></returns>
        public ActionResult UserProfile()
        {
            ViewData.Model = Membership.GetUser();
            return View();
        }

        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="email">电子邮件地址</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UserProfile(string email)
        {
            MembershipUser user = Membership.GetUser();
            user.Email = email;
            Membership.UpdateUser(user);

            ViewData.Model = user;
            return View();
        }
    }

    // The FormsAuthentication type is sealed and contains static members, so it is difficult to
    // unit test code that calls its members. The interface and helper class below demonstrate
    // how to create an abstract wrapper around such a type in order to make the AccountController
    // code unit testable.

    public interface IFormsAuthentication
    {
        void SignIn(string userName, bool createPersistentCookie);
        void SignOut();
    }

    public class FormsAuthenticationService : IFormsAuthentication
    {
        public void SignIn(string userName, bool createPersistentCookie)
        {
            FormsAuthentication.SetAuthCookie(userName, createPersistentCookie);
        }
        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }
    }

    public interface IMembershipService
    {
        int MinPasswordLength { get; }

        bool ValidateUser(string userName, string password);
        MembershipCreateStatus CreateUser(string userName, string password, string email);
        bool ChangePassword(string userName, string oldPassword, string newPassword);
    }

    public class AccountMembershipService : IMembershipService
    {
        private MembershipProvider _provider;

        public AccountMembershipService()
            : this(null)
        {
        }

        public AccountMembershipService(MembershipProvider provider)
        {
            _provider = provider ?? Membership.Provider;
        }

        public int MinPasswordLength
        {
            get
            {
                return _provider.MinRequiredPasswordLength;
            }
        }

        public bool ValidateUser(string userName, string password)
        {
            return _provider.ValidateUser(userName, password);
        }

        public MembershipCreateStatus CreateUser(string userName, string password, string email)
        {
            MembershipCreateStatus status;
            _provider.CreateUser(userName, password, email, null, null, true, null, out status);
            return status;
        }

        public bool ChangePassword(string userName, string oldPassword, string newPassword)
        {
            MembershipUser currentUser = _provider.GetUser(userName, true /* userIsOnline */);
            return currentUser.ChangePassword(oldPassword, newPassword);
        }
    }
}
