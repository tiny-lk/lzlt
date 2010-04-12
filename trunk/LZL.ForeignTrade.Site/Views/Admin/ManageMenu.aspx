<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="MenuTitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    角色菜单管理
</asp:Content>
<asp:Content ID="MenuMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { 
    %>
    <table width="100%" id="menu" class="list">
        <caption>
            菜单管理</caption>
        <thead>
            <tr>
                <td>
                    序 号
                </td>
                <td>
                    名 称
                </td>
                <td>
                    Url
                </td>
            </tr>
        </thead>
        <%
          
        %>
        <tbody>
            <tr>
            </tr>
        </tbody>
        <tbody>
        </tbody>
    </table>
    <%}
    %>
</asp:Content>
