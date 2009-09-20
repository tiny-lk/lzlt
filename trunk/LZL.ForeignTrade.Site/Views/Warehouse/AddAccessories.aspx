<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加辅料
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("AccessoriesBuy♂ZbColor", "布料颜色");
            autocompletedictionary("AccessoriesBuy♂ZbSize", "尺码");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="AccessoriesBuy♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="AccessoriesBuy♂objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption>
            辅料信息</caption>
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                    <%= Html.Hidden("AccessoriesBuy♂iscreatedate", "CreateDate")%>
                    <%= Html.Hidden("AccessoriesBuy♂iseditdate", "EditDate")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    编号：
                </td>
                <td align="left" colspan="5">
                    <%= Html.TextBox("AccessoriesBuy♂AccessoriesNo", "", new { validate = "required:true", style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    主 标
                </td>
                <td align="right">
                    名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂Zbmc")%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂ZbColor")%><a href="#" onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂ZbCount", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    尺码：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂ZbSize")%><a href="#" onclick="LoadDictionaryPanel('尺码',true,this)">选择</a>
                </td>
                <td>
                </td>
            </tr>
            <!-- 其它辅助资料 -->
            <tr id="AccessoriesChildBuy♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 其它辅助资料 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ContentPlaceHolderID="ChildActionContent" ID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'OtherAccessories','AccessoriesChildBuy♂',1,'AccessoriesBuy')"
        class="button">其它辅助</a>
</asp:Content>
