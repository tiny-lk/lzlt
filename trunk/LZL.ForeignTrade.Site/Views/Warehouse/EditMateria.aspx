<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.MaterialBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    原材料信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("MaterialBuy♂YclType", "材料类别");
            autocompletedictionary("MaterialBuy♂BColor", "布料颜色");
            autocompletedictionary("MaterialBuy♂LwColor", "布料颜色");
            autocompletedictionary("MaterialBuy♂SpColor", "布料颜色");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="MaterialBuy♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="MaterialBuy♂objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("MaterialBuy♂ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%">
    <caption>原材料信息</caption>
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MateriaBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    原<br />
                    材<br />
                    料
                </td>
                <td align="right">
                    编号：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂YclNo", Html.Encode(Model.YclNo), new { validate = "required:true" })%>
                </td>
                <td align="right">
                    类别：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂YclType", Html.Encode(Model.YclType))%><a href="#"
                        onclick="LoadDictionaryPanel('材料类别',true,this)">选择</a>
                </td>
                <td align="right">
                    成分：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂YclCf", Html.Encode(Model.YclCf))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BWeight", Html.Encode(Model.BWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BColor", Html.Encode(Model.BColor))%><a href="#" onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BCount", Html.Encode(Model.BCount), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BPrice", Html.Encode(Model.BPrice), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂Bgh", Html.Encode(Model.Bgh))%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right" rowspan="2">
                    罗<br />
                    纹
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂LwWeight", Html.Encode(Model.LwWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂LwColor", Html.Encode(Model.LwColor))%><a href="#"
                        onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂LwCount", Html.Encode(Model.LwCount), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂LwPrice", Html.Encode(Model.LwPrice), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂LwGh", Html.Encode(Model.LwGh))%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right" rowspan="2">
                    松<br />
                    片
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂SpWeight", Html.Encode(Model.SpWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂SpColor", Html.Encode(Model.SpColor))%><a href="#"
                        onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂SpCount", Html.Encode(Model.SpCount), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂SpPrice", Html.Encode(Model.SpPrice), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂SpGh", Html.Encode(Model.SpGh))%>
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
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MateriaBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
