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
    <input type="hidden" name="region" value="MaterialBuy♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="MaterialBuy♂objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("MaterialBuy♂ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%">
        <caption>
            原材料信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
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
                    <%= Html.TextBox("MaterialBuy♂YclNo", Html.Encode(Model.YclNo), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    类别：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("MaterialBuy♂YclType", Html.Encode(Model.YclType))%><a href="#"
                        onclick="LoadDictionaryPanel('材料类别',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    成分：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂YclCf", Html.Encode(Model.YclCf))%>
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy♂BWeight", Html.Encode(Model.BWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
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
            </tr>
            <!-- 其它辅助资料 -->
            <tr id="SubMaterialBuy♂" style="display: none;">
                <td colspan="5">
                    <%
                        Model.SubMaterialBuy.Load();
                        if (Model.SubMaterialBuy.Count > 0)
                        {
                            ViewDataDictionary viewdictionary = new ViewDataDictionary();
                            viewdictionary.Add("number", Model.SubMaterialBuy.Count);
                            Html.RenderPartial("OtherMaterialBuy", Model.SubMaterialBuy.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- 其它辅助资料 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ContentPlaceHolderID="ChildActionContent" ID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'OtherMaterialBuy','SubMaterialBuy♂',1,'MaterialBuy')"
        class="button">其它原料</a> <a href="#" onclick="addImage('<%=Html.Encode(Model.ID.ToString()) %>','原材料图片类型');"
            class="button4">原材料图片</a>
</asp:Content>
