<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.AccessoriesBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    辅料信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <caption>
            辅料信息</caption>
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    编号：
                </td>
                <td align="left" colspan="5">
                    <%= Html.Encode(Model.AccessoriesNo)%>
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 10%;">
                    主 标
                </td>
                <td align="right" style="width: 15%;">
                    名称：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode(Model.Zbmc)%>
                </td>
                <td align="right" style="width: 15%;">
                    颜色：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode(Model.ZbColor)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ZbCount)%>
                </td>
                <td align="right">
                    尺码：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ZbSize)%>
                </td>
            </tr>
            <!-- 其它辅助资料 -->
            <tr id="AccessoriesChildBuy♂" style="display: none;">
                <td colspan="5">
                    <%
                        Model.AccessoriesChildBuy.Load();
                        if (Model.AccessoriesChildBuy.Count > 0)
                        {
                            ViewDataDictionary viewdictionary = new ViewDataDictionary();
                            viewdictionary.Add("number", Model.AccessoriesChildBuy.Count);
                            viewdictionary.Add("Details", true);
                            Html.RenderPartial("OtherAccessories", Model.AccessoriesChildBuy.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- 其它辅助资料 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
