<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加商品信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        添加商品信息</h2>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Product♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Product♂objectname" value="LZL.ForeignTrade.DataEntity.Product,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle">
                    商品介绍信息
                </td>
                <td align="right">
                    商品代码（简称）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂NameCode")%>
                </td>
                <td align="right">
                    中文名称：
                </td>
                <td align="left">
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
                    <%= Html.TextBox("Product♂UnitCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂UnitEN")%>
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
                    <%= Html.TextBox("Product♂PackAmount")%>
                </td>
                <td align="right">
                    中文包装单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackUnitCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文包装单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackUnitEN")%>
                </td>
                <td align="right">
                    包装长度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackLength")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装宽度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackWidth")%>
                </td>
                <td align="right">
                    包装高度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackHeight")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装体积(CBM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackBulk")%>
                </td>
                <td align="right">
                    包装毛重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackGrossWeight")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装净重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackNetWeight")%>
                </td>
                <td align="right">
                    内盒商品数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂BoxAmount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    内盒中文单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂BoxUnitCH")%>
                </td>
                <td align="right">
                    内盒英文单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂BoxUnitEN")%>
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
                    <%= Html.TextBox("Product♂TypeCode")%>
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
            <!-- 联系人区域 -->
            <tr id="Linkman♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 联系人区域 -->
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
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li>供应商信息</li>
    <li>客户商品信息</li>
    <li>商品图片</li>
</asp:Content>
