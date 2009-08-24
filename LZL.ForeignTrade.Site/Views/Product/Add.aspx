<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加商品信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript">
        function opengys(regionname, childobject, khtype, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { type: khtype },
                url: '<%=Url.Action("CustomerIndex","Shared")%>',
                success: function(data) {
                    addRelationcontrol(regionname, childobject, data, addid, url);
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
    <input type="hidden" name="region" value="Product♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Product♂objectname" value="LZL.ForeignTrade.DataEntity.Product,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            商品信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Product/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                    商品介绍信息
                </td>
                <td align="right" style="width: 15%;">
                    商品代码（简称）：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Product♂NameCode", "", new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    中文名称：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Product♂NameCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂NameEH")%>
                </td>
                <td align="right">
                    中文规格：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂SpecCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文规格：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂SpecEN")%>
                </td>
                <td align="right">
                    中文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂UnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("中文单位"), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位"), "请选择")%>
                </td>
                <td align="right">
                    海关代码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂CustomsCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品代码：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Product♂BarCode")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="6" valign="middle">
                    商品包装
                </td>
                <td align="right">
                    包装商品数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackAmount", "", new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    中文包装单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂PackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("中文单位"), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文包装单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位"), "请选择")%>
                </td>
                <td align="right">
                    包装长度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackLength", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装宽度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackWidth", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    包装高度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackHeight", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装体积(CBM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackBulk", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    包装毛重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackGrossWeight", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装净重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackNetWeight", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    内盒商品数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂BoxAmount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    内盒中文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂BoxUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("中文单位"), "请选择")%>
                </td>
                <td align="right">
                    内盒英文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂BoxUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位"), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="4" valign="middle">
                    其它信息
                </td>
                <td align="right">
                    商品类别：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂TypeCode", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("商品类型"), "请选择")%>
                </td>
                <td align="right">
                    是否共享：
                </td>
                <td align="left">
                    <%= Html.CheckBox("Product♂IsShare",false)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品中文描述：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product♂DescriptionCH", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品英文描述：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product♂DescriptionEN", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注信息：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product♂Note", new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <!-- 客户区域 -->
            <tr id="ProductCustomer♂" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        关联客户信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='0' name="ProductCustomer♂regioncount" id="ProductCustomer♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="ProductCustomer♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="ProductCustomer♂objectname" value="LZL.ForeignTrade.DataEntity.ProductCustomer,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="ProductCustomer♂fk" value='Customer' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="ProductCustomer♂pfk" value='Product' />
                    <fieldset style="display: none; width: 95%;">
                        <legend>供应商关系信息</legend>
                        <ul id="gysxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                    <fieldset style="display: none; width: 95%;">
                        <legend>客户商品关系信息</legend>
                        <ul id="khspxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 客户区域 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Product/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="opengys('ProductCustomer♂','Customer♂ID','01','gysxx','<%=Url.Action("Details","Customer")%>');"
        class="button">供应商</a> <a href="#" onclick="opengys('ProductCustomer♂','Customer♂ID','02','khspxx','<%=Url.Action("Details","Customer")%>');"
            class="button">客户商品</a> <a href="#" class="button">商品图片</a>
</asp:Content>
