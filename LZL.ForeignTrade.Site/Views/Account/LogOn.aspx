<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    登录
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>登录</h2>
    <p>
        请输入您的用户名与密码。 您还没有账户？<%= Html.ActionLink("现在就创建一个帐户", "Register")%> 
    </p>
    <%= Html.ValidationSummary("登录失败，请验证用户名或密码后重试。") %>

    <% using (Html.BeginForm()) { %>
        <div>
            <fieldset>
                <legend>账户信息</legend>
                <p>
                    <label for="username">用户名：</label>
                    <%= Html.TextBox("username", "", new { style = "width:200px" })%>
                    <%= Html.ValidationMessage("username") %>
                </p>
                <p>
                    <label for="password">密码：</label>
                    <%= Html.Password("password", "", new { style = "width:200px" })%>
                    <%= Html.ValidationMessage("password") %>
                </p>
                <p>
                    <%= Html.CheckBox("rememberMe") %> <label class="inline" for="rememberMe">在此计算机上保存我的信息。</label>
                </p>
                <p>
                    <input type="submit" class="button" value="登录" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
