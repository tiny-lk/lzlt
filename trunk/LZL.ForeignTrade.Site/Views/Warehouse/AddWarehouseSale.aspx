<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    销货信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <div id="region">
        <!-- 标识子表添加总数 -->
        <input type="hidden" value='1' name="WarehouseSale♂regioncount" id="WarehouseSale♂regioncount" />
        <!-- 标识子表区域名称(表格名称、实体对象名称) -->
        <input type="hidden" name="region" value="WarehouseSale♂" />
        <!-- 标识子表实体对象类 -->
        <input type="hidden" name="WarehouseSale♂objectname" value="LZL.ForeignTrade.DataEntity.WarehouseSale,LZL.ForeignTrade.DataEntity" />
        <!-- 标识子表外键实体对象名称、外键字段名称 -->
        <input type="hidden" name="WarehouseSale♂fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "AccessoriesBuy" :ViewData["FK"] %>' />
        <%= Html.Hidden("WarehouseSale♂iscreatedate", "CreateDate")%>
        <%= Html.Hidden("WarehouseSale♂iseditdate", "EditDate")%>
    </div>
    <input type="hidden" name="AccessoriesBuy♂objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesBuy,LZL.ForeignTrade.DataEntity" />
    <%
        Response.Write(Html.Hidden("region", ViewData["FK"] + "♂"));
        Response.Write(Html.Hidden(ViewData["FK"] + "♂objectname", "LZL.ForeignTrade.DataEntity." + ViewData["FK"] + ",LZL.ForeignTrade.DataEntity"));
        Response.Write(Html.Hidden(ViewData["FK"] + "♂ID", ViewData["id"]));
    %>
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
                <%=Html.TextBox("WarehouseSale♂SaleDate", "", new { validate = "required:true,date:true", Class = "calendar" })%>
            </td>
            <td align="right" style="width: 15%;">
                销售数量：
            </td>
            <td align="left" style="width: 30%;">
                <%=Html.TextBox("WarehouseSale♂SaleCount", "", new { validate = "number:true" })%>
            </td>
        </tr>
        <tr>
            <td align="right">
                销售单价：
            </td>
            <td align="left">
                <%=Html.TextBox("WarehouseSale♂SalePrice", "", new { validate = "number:true" })%>
            </td>
            <td align="right">
                销售重量：
            </td>
            <td align="left">
                <%=Html.TextBox("WarehouseSale♂SaleWeight", "", new { validate = "number:true" })%>
            </td>
        </tr>
        <tr>
            <td align="right">
                销售类别编号：
            </td>
            <td align="left" colspan="3">
                <%=Html.TextBox("WarehouseSale♂SaleNo")%>
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/WarehouseSale") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
