<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    �ͻ���Ϣ
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �ͻ���Ϣ</h2>
    <table width="97%" style="vertical-align: middle; text-align: center;">
        <tr>
            <td>
                ѡ��
            </td>
            <td>
                ���
            </td>
            <td>
                �ͻ�����
            </td>
            <td>
                �ͻ���������
            </td>
            <td>
                �ͻ�Ӣ������
            </td>
            <td>
                �绰
            </td>
            <td>
                �ͻ�����
            </td>
            <td>
                �Ƿ���
            </td>
            <td>
                ����
            </td>
        </tr>
        <%
            int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
            for (int i = 0; i < Model.Count; i++)
            {
                
        %>
        <tr>
            <td>
                <%= Html.CheckBox("select",false) %>
            </td>
            <td>
                <%= ((i + 1) * page).ToString()%>
            </td>
            <td>
                <%= Html.Encode( Model[i].NameCode) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].NameCn) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].NameEn) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].Phone) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].TypeCode) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].IsShare?"��":"��" ) %>
            </td>
            <td>
                <%= Html.ActionLink("��ϸ", "", new { id = Html.Encode(Model[i].ID) })%>|
                <%= Html.ActionLink("ɾ��", "", new { id = Html.Encode(Model[i].ID) })%>
            </td>
        </tr>
        <%
            }
            
        %>
    </table>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
