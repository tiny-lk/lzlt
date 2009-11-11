<%@ Page Language="C#" MasterPageFile="~/Views/Account/Account.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    修改密码
</asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>修改密码</h2>
    <p>
        要修改密码，请提供您目前的密码。 
    </p>
    <p>
        新密码最少需要<%=Html.Encode(ViewData["PasswordLength"])%>位字符。
    </p>
    <%= Html.ValidationSummary("密码修改失败，请更正错误后重试。")%>

    <% using (Html.BeginForm()) { %>
        <div>
            <fieldset>
                <legend>帐户信息</legend>
                <p>
                    <label for="currentPassword">当前密码：</label>
                    <%= Html.Password("currentPassword") %>
                    <%= Html.ValidationMessage("currentPassword") %>
                </p>
                <p>
                    <label for="newPassword">新密码：</label>
                    <%= Html.Password("newPassword") %>
                    <%= Html.ValidationMessage("newPassword") %>
                </p>
                <p>
                    <label for="confirmPassword">确认新密码：</label>
                    <%= Html.Password("confirmPassword") %>
                    <%= Html.ValidationMessage("confirmPassword") %>
                </p>
                <p>
                    <input type="submit" class="button" value="修改密码" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
