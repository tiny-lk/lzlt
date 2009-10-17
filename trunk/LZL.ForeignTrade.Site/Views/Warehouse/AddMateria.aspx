<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加原材料
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        添加原材料</h2>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Materia♂YclType", "材料类别");
            autocompletedictionary("Materia♂BColor", "布料颜色");
            autocompletedictionary("Materia♂LwColor", "布料颜色");
            autocompletedictionary("Materia♂SpColor", "布料颜色");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Materia♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Materia♂objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    原材料
                </td>
                <td align="right">
                    编号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂YclNo", "", new { validate = "required:true" })%>
                </td>
                <td align="right">
                    类别：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂YclType")%><a href="#" onclick="LoadDictionaryPanel('材料类别',true,this)">选择</a>
                </td>
                <td align="right">
                    成分：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂YclCf")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂BWeight", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂BColor")%><a href="#" onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂BCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂BPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂Bgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    罗
                    纹
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂LwWeight", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂LwColor")%><a href="#" onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂LwCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂LwPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂LwGh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    松
                    片
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂SpWeight", "", new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂SpColor")%><a href="#" onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂SpCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂SpPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia♂SpGh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
