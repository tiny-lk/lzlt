<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    注册
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>创建新帐户</h2>
    <p>
        请输入下面的必填信息来创建新账户。
    </p>
    <p>
        新密码最少需要<%=Html.Encode(ViewData["PasswordLength"])%>位字符。
    </p>
    <%= Html.ValidationSummary("新账户创建失败，请更正错误后重试。")%>

    <% using (Html.BeginForm()) { %>
        <div>
            <fieldset>
                <legend>帐户信息</legend>
                <p>
                    <label for="username">用户名：</label>
                    <%= Html.TextBox("username") %>
                    <%= Html.ValidationMessage("username") %>
                </p>
                <p>
                    <label for="email">电子邮件：</label>
                    <%= Html.TextBox("email") %>
                    <%= Html.ValidationMessage("email") %>
                </p>
                <p>
                    <label for="password">密码：</label>
                    <%= Html.Password("password") %>
                    <%= Html.ValidationMessage("password") %>
                </p>
                <p>
                    <label for="confirmPassword">再次输入密码：</label>
                    <%= Html.Password("confirmPassword") %>
                    <%= Html.ValidationMessage("confirmPassword") %>
                </p>
                <p>
                    <input type="submit" value="注册" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
