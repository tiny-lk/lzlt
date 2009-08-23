<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.AccessoriesBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑辅料
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        编辑辅料</h2>
    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>
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
    <%= Html.Hidden("AccessoriesBuy♂ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    编号：
                </td>
                <td align="left" colspan="5">
                    <%= Html.TextBox("AccessoriesBuy♂AccessoriesNo", Html.Encode(Model.AccessoriesNo), new { validate = "required:true",style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    主<br />
                    标
                </td>
                <td align="right">
                    名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂Zbmc", Html.Encode(Model.Zbmc))%>
                </td>
                <td align="right">
                    颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂ZbColor", Html.Encode(Model.ZbColor))%><a href="#"
                        onclick="LoadDictionaryPanel('布料颜色',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂ZbCount", Html.Encode(Model.ZbCount), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    尺码：
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy♂ZbSize", Html.Encode(Model.ZbSize))%><a href="#"
                        onclick="LoadDictionaryPanel('尺码',true,this)">选择</a>
                </td>
                <td>
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
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
