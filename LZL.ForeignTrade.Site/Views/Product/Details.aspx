<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Product>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    商品详细信息
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $(".print").live("click", function() {
                $("thead").printArea("true");
            });
        });
    </script>

    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            商品信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="打 印" class="print" />
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
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
                    <%= Html.Encode( Model.NameCode)%>
                </td>
                <td align="right" style="width: 15%;">
                    中文名称：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode(Model.NameCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.NameEH)%>
                </td>
                <td align="right">
                    中文规格：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.SpecCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文规格：
                </td>
                <td align="left">
                    <%=  Html.Encode(Model.SpecEN)%>
                </td>
                <td align="right">
                    中文单位：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("中文单位", Html.Encode(Model.UnitCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文单位：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("英文单位", Html.Encode(Model.UnitEN))%>
                </td>
                <td align="right">
                    海关代码：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.CustomsCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品代码：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.BarCode)%>
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
                    <%= Html.Encode(Model.PackAmount)%>
                </td>
                <td align="right">
                    中文包装单位：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("中文单位", Html.Encode(Model.PackUnitCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文包装单位：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("英文单位", Html.Encode(Model.PackUnitEN))%>
                </td>
                <td align="right">
                    包装长度(CM)：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackLength)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装宽度(CM)：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackWidth)%>
                </td>
                <td align="right">
                    包装高度(CM)：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackHeight)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装体积(CBM)：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackBulk)%>
                </td>
                <td align="right">
                    包装毛重(KG)：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackGrossWeight)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装净重(KG)：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackNetWeight)%>
                </td>
                <td align="right">
                    内盒商品数量：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.BoxAmount)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    内盒中文单位：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("中文单位", Html.Encode(Model.BoxUnitCH))%>
                </td>
                <td align="right">
                    内盒英文单位：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("英文单位", Html.Encode(Model.BoxUnitEN))%>
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
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("商品类型", Html.Encode(Model.TypeCode))%>
                </td>
                <td align="right">
                    是否共享：
                </td>
                <td align="left">
                    <%= Html.CheckBox("IsShare", Model.IsShare)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品中文描述：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.DescriptionCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品英文描述：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.DescriptionEN)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注信息：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.Note)%>
                </td>
            </tr>
            <!-- 客户区域 -->
            <% 
                Model.ProductCustomer.Load();
                if (Model.ProductCustomer.Count > 0)
                {
                    for (int i = 0; i < Model.ProductCustomer.Count; i++)
                    {
                        Model.ProductCustomer.ElementAt(i).CustomerReference.Load();
                    }
            %>
            <tr style="text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        关联客户信息</center>
                    <%
                        var customers = Model.ProductCustomer.Where(v => v.Customer.TypeCode.Equals("01")).Select(v => v.Customer);
                        if (customers.Count() > 0)
                        {
                    %>
                    <fieldset style="width: 95%;">
                        <legend>供应商关系信息</legend>
                        <ul id="gysxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < customers.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    Response.Write(string.Format(htmlstr, Html.CheckBox("CustromID", true),
                                        Html.ActionLink(customers.ElementAt(i).NameCode, "Details", "Customer", new { id = customers.ElementAt(i).ID.ToString() }, new { target = "_blank" })));
                                }
                            %>
                        </ul>
                    </fieldset>
                    <%
                        }
                        var customers2 = Model.ProductCustomer.Where(v => v.Customer.TypeCode.Equals("02")).Select(v => v.Customer);
                        if (customers2.Count() > 0)
                        {
                    %>
                    <fieldset style="width: 95%;">
                        <legend>客户商品关系信息</legend>
                        <ul id="khspxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int s = 0; s < customers2.Count(); s++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    Response.Write(string.Format(htmlstr, Html.CheckBox("CustromID", true),
                                        Html.ActionLink(customers2.ElementAt(s).NameCode, "Details", "Customer", new { id = customers2.ElementAt(s).ID.ToString() }, new { target = "_blank" })));

                                }   
                            %>
                        </ul>
                    </fieldset>
                    <%
                        }
                }
                    %>
                </td>
            </tr>
            <!-- 客户区域 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="打 印" class="print" />
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
