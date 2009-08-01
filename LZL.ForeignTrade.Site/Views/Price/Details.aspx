<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Price>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    报价详细信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <caption>
            报价单信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                    报价单基本信息
                </td>
                <td align="right" style="width: 15%;">
                    报价单号：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode(Model.Name)%>
                </td>
                <td align="right" style="width: 15%;">
                    报价单日期：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode(Model.Date)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    报价币种：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.CurrencyType)%>
                </td>
                <td align="right">
                    价格条款：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PriceClause)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    价格条款补充说明：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.PriceClauseNote)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    付款方式：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.ClauseType)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    付款方式补充说明：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.ClauseTypeNote)%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="3" valign="middle">
                    运输情况
                </td>
                <td align="right">
                    运抵国：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.TansportCountry)%>
                </td>
                <td align="right">
                    起运港口：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.StartHaven)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    转运港口：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.TransferHaven)%>
                </td>
                <td align="right">
                    目的港口：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.EdnHaven)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    运输方式：
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.TransportMode)%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="5" valign="middle">
                    商品信息统计汇总
                </td>
                <td align="right">
                    报价单类型：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("报价单类型", Html.Encode(Model.PriceType))%>
                </td>
                <td align="right">
                    总报价金额：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseQuote)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总包装数量：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClausePackNumber)%>
                </td>
                <td align="right">
                    包装单位（英文）：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseUnitEN)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总毛重（KG）：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseWeight)%>
                </td>
                <td align="right">
                    总净重（KG）：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseNetWeight)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总体积（CBM）：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseBulk)%>
                </td>
                <td align="right">
                    商品总数量：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseNumber)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品总单位：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseUnit)%>
                </td>
                <td align="right">
                    商品总数量<br />
                    （不同单位）：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.ClauseNotUnit)%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="2" valign="middle">
                    其它信息
                </td>
                <td align="right">
                    选择客户：
                </td>
                <td align="left">
                    <%
                        if (Model.CustomerID != null)
                        {
                            var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model.CustomerID);
                            if (obj != null)
                            {
                                Response.Write(Html.ActionLink(obj.NameCode, "Details", "Customer", new { id = obj.ID.ToString() }, null));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    公司简称：
                </td>
                <td align="left">
                    <%
                        if (Model.CompanyID != null)
                        {
                            var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCompany(Model.CompanyID);
                            if (obj != null)
                            {
                                Response.Write(Html.ActionLink(obj.Name, "Details", "Company", new { id = obj.ID.ToString() }));
                            }
                        }
                    %>
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
            <% 
                Model.PriceProduct.Load();
                if (Model.PriceProduct.Count > 0)
                {
                    for (int i = 0; i < Model.PriceProduct.Count; i++)
                    {
                        Model.PriceProduct.ElementAt(i).ProductReference.Load();
                    }
                }
            %>
            <!-- 产品信息 -->
            <tr id="PriceProduct♂" style="<%=Model.PriceProduct.Count>0?"": "display: none"%>;
                text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        关联客户信息</center>
                    <fieldset style="<%=Model.PriceProduct.Count>0?"": "display: none"%>; width: 95%;">
                        <legend>商品信息</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.PriceProduct.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Product♂ID' checked='true' value='" + Model.PriceProduct.ElementAt(i).Product.ID.ToString() + "' />",
                                        Html.ActionLink(Model.PriceProduct.ElementAt(i).Product.NameCode, "Details", "Product", new { id = Model.PriceProduct.ElementAt(i).Product.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 产品信息 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
