<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    领料管理
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <% using (Html.BeginForm())
       { %>
    <div id="region">
        <!-- 标识子表区域名称(表格名称、实体对象名称) -->
        <input type="hidden" name="region" value="WarehouseSale♂" />
        <!-- 标识子表实体对象类 -->
        <input type="hidden" name="WarehouseSale♂objectname" value="LZL.ForeignTrade.DataEntity.WarehouseSale,LZL.ForeignTrade.DataEntity" />
        <%= Html.Hidden("WarehouseSale♂iscreatedate", "CreateDate")%>
        <%= Html.Hidden("WarehouseSale♂iseditdate", "EditDate")%>
    </div>
    <%
        Response.Write(Html.Hidden("WarehouseSale♂propertyobject", ViewData["FK"]));
        Response.Write(Html.Hidden("WarehouseSale♂propertyobjectvalue", ViewData["id"]));
    %>
    <table class="list" width="100%">
        <caption>
            领料信息</caption>
        <tr>
            <td align="center" rowspan="3" style="width: 10%;">
                领料信息
            </td>
            <td align="right" style="width: 15%;">
                领料日期：
            </td>
            <td align="left" style="width: 30%;">
                <%=Html.TextBox("WarehouseSale♂SaleDate", "", new { validate = "required:true,date:true", Class = "calendar" })%>
            </td>
            <td align="right" style="width: 15%;">
                领料数量：
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
                领料重量：
            </td>
            <td align="left">
                <%=Html.TextBox("WarehouseSale♂SaleWeight", "", new { validate = "number:true" })%>
            </td>
        </tr>
        <tr>
            <td align="right">
                领料类别编号：
            </td>
            <td align="left" colspan="3">
                <%=Html.TextBox("WarehouseSale♂SaleNo")%>
            </td>
        </tr>
        <!-- 生产情况区域 -->
        <tr id="ColorWarehouseSale♂" style="display: none;">
            <td colspan="5">
            </td>
        </tr>
        <!-- 生产情况区域 -->
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" class="button" value="提 交" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/WarehouseSale") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'ColorWarehouseSale','ColorWarehouseSale♂',1,'WarehouseSale','type=<%=Request["type"]%>')"
        class="button4">
        <% 
            if (Request["type"] == "1")
            {
                Response.Write("生产原材料");
            }
            else
            {
                Response.Write("生产辅料");
            }             
        %></a>
</asp:Content>
