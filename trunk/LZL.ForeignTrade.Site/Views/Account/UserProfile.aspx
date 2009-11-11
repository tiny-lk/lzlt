<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Account/Account.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="profileTitle" ContentPlaceHolderID="TitleContent" runat="server">
    账户信息
</asp:Content>
<asp:Content ID="profileContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        账户信息</h2>
    <p>
        账户的个人信息
    </p>
    <%= Html.ValidationSummary("个人基本信息修改失败，请更正错误后重试。")%>
    <% using (Html.BeginForm())
       {
           var user = ViewData.Model as MembershipUser;%>
    <div>
        <fieldset>
            <legend>帐户基本信息</legend>
            <p>
                用户名 ：<%= Html.Encode(user.UserName) %><br />
            </p>
            <p>
                电子邮件：<%= Html.TextBox("email",user.Email) %>
                <%= Html.ValidationMessage("email") %>
            </p>
            <p>
                创建时间：<%= user.CreationDate.ToLocalTime() %><br />
                最后登录时间：<%= user.LastLoginDate.ToLocalTime() %><br />
            </p>
            <p>
                <input type="submit" class="button" value="修改" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
