<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUserCollection>" %>

<asp:Content ID="ManageUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    用户管理
</asp:Content>
<asp:Content ID="ManageUserContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        用户管理</h2>
    <form method="post" action="ManageUser" class="manage-user">
    <p>
        <b>总注册用户：</b><%= ViewData["RegisteredUsers"]%></p>
    <p>
        <b>现在线用户：</b><%= ViewData["UsersOnlineNow"] %></p>
    <hr />
    <!-- user search options -->
    <p>
        用户搜索：<%= Html.TextBox("searchInput",ViewData["searchInput"])%>&nbsp;&nbsp;
        <%= Html.DropDownList("searchType", (SelectList)ViewData["searchOptionList"])%>&nbsp;&nbsp;
        <button type="submit" id="user-manageUser-button" style="height: 28px">
            搜索</button></p>
    <hr />
    <!-- the user grid -->
    <table cellpadding="2" cellspacing="0" align="left" summary="User Grid" border="1">
        <thead>
            <tr style="font-weight: bold; background-color: #A8C3CB;">
                <th align="center">
                    用户名
                </th>
                <th align="center">
                    电子邮件
                </th>
                <th align="center">
                    创建时间
                </th>
                <th align="center">
                    最后使用时间
                </th>
                <th align="center">
                    是否可用
                </th>
                <th>
                    &nbsp;
                </th>
                <th>
                    &nbsp;
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (MembershipUser membershipUser in ViewData.Model)
               { %>
            <tr id="user-<%= membershipUser.UserName %>">
                <td>
                    <%= membershipUser.UserName %>
                </td>
                <td>
                    <%= membershipUser.Email %>
                </td>
                <td align="center">
                    <%= membershipUser.CreationDate.ToLocalTime() %>
                </td>
                <td align="center">
                    <%= membershipUser.LastActivityDate.ToLocalTime() %>
                </td>
                <td align="center">
                    <%= Html.CheckBox("approved" ,membershipUser.IsApproved, new {disabled="true"}) %>
                </td>
                <td>
                    <a href="/Admin/EditUser/<%= membershipUser.UserName %>">
                        <img border="0" alt="Edit User" src="/content/images/EditSymbol.png" title="修改用户"
                            align="middle" /></a>
                </td>
                <td align="center">
                    <a class="delete-user-button" href="/Account/DeleteUser/<%= membershipUser.UserName %>">
                        <img border="0" alt="Delete User" src="/content/images/DeleteSymbol.png" title="删除用户"
                            align="middle" /></a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </form>
</asp:Content>
