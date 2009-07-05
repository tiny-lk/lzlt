<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUser>" %>

<asp:Content ID="EditUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    编辑用户
</asp:Content>
<asp:Content ID="EditUserContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        编辑用户</h2>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#Return").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageUser/") %>';
            });
            $("#Edit").bind("click", function() {
                $("form").submit();
            });
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <fieldset>
        <legend>用户信息</legend>
        <%= Html.Hidden("id")%>
        <p>
            <label for="UserName">
                用户名称：</label>
            <%=Html.TextBox("UserName", Model.UserName) %>
        </p>
        <p>
            <label for="Email">
                E-Mail：</label><%=Html.TextBox("Email", Model.Email)%></p>
        <p>
            <label for="Password">
                密 码：</label>
            <%= Html.Password("Password")%></p>
                    <p>
            <label for="Password">
                 确认密码：</label>
            <%= Html.Password("confirmPassword")%></p>
        <p>
            <label for="approved">
                是有效：</label>
            <%= Html.CheckBox("approved", Model.IsApproved)%></p>
        <p>
            <label for="approved">
                是锁定：</label>
            <%= Html.CheckBox("lockedOut", Model.IsLockedOut)%></p>
    </fieldset>
    <ul>
        <% foreach (string role in (string[])ViewData["roles"])
           { %>
        <li>
            <%= Html.CheckBox("role." + role, Roles.IsUserInRole(Model.UserName, role))%>
            <label for="role.<%= role %>">
                <%= role%></label></li>
        <% } %>
    </ul>
    <p>
        <input type="submit" value="更 新" id="Edit" />
        <input id="Return" type="button" value="返 回" />
    </p>
    <%}
    %>
</asp:Content>
