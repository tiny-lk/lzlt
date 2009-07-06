<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加角色
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $("#Back").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageUser/") %>';
            })
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <h2>
        添加角色</h2>
    <p>
        角色名称：<%= Html.TextBox("rolename")%></p>
    <p>
        <input type="submit" value="确 定" /><input id="Back" type="button" value="返 回" /></p>
    <%} %>
</asp:Content>
