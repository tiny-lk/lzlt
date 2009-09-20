<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.WarehouseSale>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    销货信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="dynamictable">
        <caption>
            销货信息</caption>
        <tr>
            <td align="center" valign="middle" rowspan="4" style="width: 10%;">
                销货信息
            </td>
            <td align="right" style="width: 15%;">
                销货日期：
            </td>
            <td align="left" style="width: 30%;">
                <%= Html.Encode(Model.SaleDate.GetValueOrDefault().ToShortDateString())%>
            </td>
            <td align="right" style="width: 15%;">
                销售数量：
            </td>
            <td align="left" style="width: 30%;">
                <%=Html.Encode(Model.SaleCount)%>
            </td>
        </tr>
        <tr>
            <td align="right">
                销售单价：
            </td>
            <td align="left">
                <%=Html.Encode(Model.SalePrice)%>
            </td>
            <td align="right">
                销售重量：
            </td>
            <td align="left">
                <%=Html.Encode(Model.SaleWeight)%>
            </td>
        </tr>
        <tr>
            <td align="right">
                销售类别编号：
            </td>
            <td align="left" colspan="3">
                <%=Html.Encode(Model.SaleNo)%>
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/WarehouseSale") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
