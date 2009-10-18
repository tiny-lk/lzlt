<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.MaterialBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    原材料信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
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

    <table width="100%">
        <caption>
            原材料信息</caption>
        <thead>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
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
            </tr>
            <tr>
                <td align="right">
                    成分：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.YclCf)%>
                </td>
                <td align="right">
                    重量：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BWeight)%>
                </td>
            </tr>
            <tr>
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
            <!-- 其它辅助资料 -->
            <tr id="SubMaterialBuy♂" style="display: none;">
                <td colspan="5">
                    <%
                        Model.SubMaterialBuy.Load();
                        if (Model.SubMaterialBuy.Count > 0)
                        {
                            ViewDataDictionary viewdictionary = new ViewDataDictionary();
                            viewdictionary.Add("number", Model.SubMaterialBuy.Count);
                            viewdictionary.Add("Details", true);
                            Html.RenderPartial("OtherMaterialBuy", Model.SubMaterialBuy.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- 其它辅助资料 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="addImage('<%=Html.Encode(Model.ID.ToString()) %>','原材料图片类型');"
        class="button4">原材料图片</a>
</asp:Content>
