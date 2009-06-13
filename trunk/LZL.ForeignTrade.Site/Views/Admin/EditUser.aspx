<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUser>" %>

<asp:Content ID="EditUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    编辑用户
</asp:Content>
<asp:Content ID="EditUserContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        编辑用户</h2>
    <form method="post" action="EditUser" class="manage-user">
    <!-- The hidden control manages the username -->
    <%= Html.Hidden("id") %>
    <!-- Shows detailed information about member from MembershipUser object -->
    <p>
        <b>UserName:</b>
        <%= Model.UserName %>
    </p>
    <p>
        <b>E-Mail:</b>
        <%= Model.Email%></p>
    <p>
        <b>Registered:</b>
        <%= Model.CreationDate.ToLocalTime()%></p>
    <p>
        <b>Last Login:</b>
        <%= Model.LastLoginDate.ToLocalTime()%></p>
    <p>
        <b>Last Activity:</b>
        <%= Model.LastActivityDate.ToLocalTime()%></p>
    <p>
        <b>Online Now:</b>
        <%= Html.CheckBox("onlineNow", Model.IsOnline, new { disabled = "true" })%></p>
    <p>
        <b>Approved:</b>
        <%= Html.CheckBox("approved", Model.IsApproved)%></p>
    <p>
        <b>Locked Out:</b>
        <%= Html.CheckBox("lockedOut", Model.IsLockedOut, new { disabled = "true" })%></p>
    <hr />
    <!-- This portion allows you to actually edit the roles of the user -->
    <h2>
        Edit User Roles</h2>
    <ul>
        <% foreach (string role in (string[])ViewData["roles"])
           { %>
        <li>
            <%= Html.CheckBox("role." + role,  Roles.IsUserInRole(Model.UserName, role))%>
            <label for="role.<%= role %>">
                <%= role %></label></li>
        <% } %>
    </ul>
    <p>
        <button type="submit" id="user-editUser-button">
            Update User</button>
        <button type="button" onclick="location.href='/User/ManageUser'" style="margin-left: 2em;">
            Return</button>
    </p>
    </form>
</asp:Content>
