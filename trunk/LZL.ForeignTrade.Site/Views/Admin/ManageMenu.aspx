<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="MenuTitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    ��ɫ�˵�����
</asp:Content>
<asp:Content ID="MenuMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { 
    %>
    <table width="100%" id="menu" class="list">
        <caption>
            �˵�����</caption>
        <thead>
            <tr>
                <td>
                    �� ��
                </td>
                <td>
                    �� ��
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
