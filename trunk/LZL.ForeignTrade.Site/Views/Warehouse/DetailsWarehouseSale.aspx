<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.WarehouseSale>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="dynamictable">
        <caption>
            ������Ϣ</caption>
        <tr>
            <td align="center" valign="middle" rowspan="4" style="width: 10%;">
                ������Ϣ
            </td>
            <td align="right" style="width: 15%;">
                �������ڣ�
            </td>
            <td align="left" style="width: 30%;">
                <%= Html.Encode(Model.SaleDate.GetValueOrDefault().ToShortDateString())%>
            </td>
            <td align="right" style="width: 15%;">
                ����������
            </td>
            <td align="left" style="width: 30%;">
                <%=Html.Encode(Model.SaleCount)%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���۵��ۣ�
            </td>
            <td align="left">
                <%=Html.Encode(Model.SalePrice)%>
            </td>
            <td align="right">
                ����������
            </td>
            <td align="left">
                <%=Html.Encode(Model.SaleWeight)%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��������ţ�
            </td>
            <td align="left" colspan="3">
                <%=Html.Encode(Model.SaleNo)%>
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/WarehouseSale") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
