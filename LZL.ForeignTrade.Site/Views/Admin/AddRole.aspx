<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӽ�ɫ
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
        ��ӽ�ɫ</h2>
    <p>
        ��ɫ���ƣ�<%= Html.TextBox("rolename")%></p>
    <p>
        <input type="submit" value="ȷ ��" /><input id="Back" type="button" value="�� ��" /></p>
    <%} %>
</asp:Content>
