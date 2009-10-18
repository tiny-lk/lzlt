<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.AccessoriesBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    辅料信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("AccessoriesBuy♂ZbColor", "布料颜色");
            autocompletedictionary("AccessoriesBuy♂ZbSize", "尺码");
        });
        function addImage(key, n) {
            $("#imagemodedialog").remove();
            $("body").append("<div id='imagemodedialog'></div>");
            $.ajax({
                type: "get",
                dataType: "html",
                data: { fid: key, name: n },
                url: '<%=Url.Action("ImageUserControl","Shared")%>',
                success: function(data) {
                    $("#imagemodedialog").dialog({
                        bgiframe: true,
                        height: 140,
                        modal: true,
                        width: 700,
                        height: 'auto',
                        position: 'center',
                        resizable: true,
                        draggable: true,
                        closeOnEscape: true
                    });
                    $("#imagemodedialog").append(data);
                    $("#imagemodedialog").dialog();
                    $("#imagemodedialog").dialog('open');
                },
                error: function() {
                    alert("添加表单数据失败！");
                }
            });
        }
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="AccessoriesBuy♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="AccessoriesBuy♂objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesBuy,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("AccessoriesBuy♂ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%">
        <caption>
            辅料信息</caption>
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" style="width: 10%;">
                    主 标
                </td>
                <td align="right">
                    编号：
                </td>
                <td align="left" colspan="4">
                    <%= Html.TextBox("AccessoriesBuy♂AccessoriesNo", Html.Encode(Model.AccessoriesNo), new { validate = "required:true"})%>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 15%;">
                    名称：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("AccessoriesBuy♂Zbmc", Html.Encode(Model.Zbmc), new { validate = "required:true"})%>
                </td>
                <td align="right" style="width: 15%;">
                    颜色：
                </td>
                <td align="left" style="width: 30%;">
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
        class="button">其它辅助</a> <a href="#" onclick="addImage('<%=Html.Encode(Model.ID.ToString()) %>','辅助采购类型');"
            class="button4">辅助采购图片</a>
</asp:Content>
