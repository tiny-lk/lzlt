<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUserCollection>" %>

<asp:Content ID="ManageUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    �û�����
</asp:Content>
<asp:Content ID="ManageUserContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �û�����</h2>
    <form method="post" action="ManageUser" class="manage-user">
    <p>
        <b>��ע���û���</b><%= ViewData["RegisteredUsers"]%></p>
    <p>
        <b>�������û���</b><%= ViewData["UsersOnlineNow"] %></p>
    <hr />
    <!-- user search options -->
    <p>
        �û�������<%= Html.TextBox("searchInput",ViewData["searchInput"])%>&nbsp;&nbsp;
        <%= Html.DropDownList("searchType", (SelectList)ViewData["searchOptionList"])%>&nbsp;&nbsp;
        <button type="submit" id="user-manageUser-button" style="height: 28px">
            ����</button></p>
    <hr />
    <!-- the user grid -->
    <table cellpadding="2" cellspacing="0" align="left" summary="User Grid" border="1">
        <thead>
            <tr style="font-weight: bold; background-color: #A8C3CB;">
                <th align="center">
                    �û���
                </th>
                <th align="center">
                    �����ʼ�
                </th>
                <th align="center">
                    ����ʱ��
                </th>
                <th align="center">
                    ���ʹ��ʱ��
                </th>
                <th align="center">
                    �Ƿ����
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
                        <img border="0" alt="Edit User" src="/content/images/EditSymbol.png" title="�޸��û�"
                            align="middle" /></a>
                </td>
                <td align="center">
                    <a class="delete-user-button" href="/Account/DeleteUser/<%= membershipUser.UserName %>">
                        <img border="0" alt="Delete User" src="/content/images/DeleteSymbol.png" title="ɾ���û�"
                            align="middle" /></a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </form>
</asp:Content>
