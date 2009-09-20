<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.MaterialBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    原材料信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <caption>
            原材料信息</caption>
        <thead>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MateriaBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" style="width: 10%;">
                    原材料
                </td>
                <td align="right">
                    编号：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.YclNo) %>
                </td>
                <td align="right">
                    类别：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.YclType)%>
                </td>
                <td align="right">
                    成分：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.YclCf)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BWeight)%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BColor)%>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BCount)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BPrice)%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.Bgh)%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    罗纹
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.LwWeight)%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.LwColor)%>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.LwCount)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.LwPrice)%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.LwGh)%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    松片
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.SpWeight)%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.SpColor)%>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.SpCount)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.SpPrice)%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.SpGh)%>
                </td>
                <td colspan="2">
                </td>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MateriaBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
