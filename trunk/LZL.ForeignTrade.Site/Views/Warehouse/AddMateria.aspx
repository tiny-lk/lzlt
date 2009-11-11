<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加原材料
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        添加原材料</h2>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("MaterialBuy♂YclType", "材料类别");
            autocompletedictionary("MaterialBuy♂BColor", "布料颜色");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="MaterialBuy♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="MaterialBuy♂objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%"  class="list">
        <thead>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="4" style="width: 10%;">
                    原材料
                </td>
                <td align="right" style="width: 15%;">
                    编号：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("MaterialBuy♂YclNo", "", new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    类别：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("MaterialBuy♂YclType")%><a href="#" onclick="LoadDictionaryPanel('材料类别',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    成分：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂YclCf")%>
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BWeight", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BColor")%><a href="#" onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂Bgh")%>
                </td>
            </tr>
            <!-- 其它辅助资料 -->
            <tr id="SubMaterialBuy♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 其它辅助资料 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ContentPlaceHolderID="ChildActionContent" ID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'OtherMaterialBuy','SubMaterialBuy♂',1,'MaterialBuy')"
        class="button">其它原料</a>
</asp:Content>
