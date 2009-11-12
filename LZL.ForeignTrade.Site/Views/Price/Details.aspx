<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Price>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    报价详细信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $(".print").live("click", function() {
                $("table>tbody").printArea("true");
            });
        });
    </script>

    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">报价单信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
            <li><a href="#tabs-3">商品包装信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                报价单信息</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" class="button" value="打 印" class="print" />
                        <input type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                    </td>
                </tr>
            </thead>
            <tbody>
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
                                    Response.Write(Html.ActionLink(obj.Name, "DetailsCompany", "Admin", new { id = obj.ID.ToString() }));
                                }
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        报价单类型：
                    </td>
                    <td align="left">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model.PriceType))%>
                    </td>
                    <td align="right">
                        备注信息：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Note)%>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" class="button" value="打 印" class="print" />
                        <input type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table class="list" width="100%" id="tabs-2">
            <caption>
                商品信息动态区域
            </caption>
            <%
                Model.ProductSummary.Load();
            %>
            <!-- 商品信息 -->
            <tr id="ProductSummary♂" style="<%=Model.ProductSummary.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <%
                        if (Model.ProductSummary.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductSummary.Count);
                            viewdictionary2.Add("Details", true);
                            Html.RenderPartial("ProductSummaryControl", Model.ProductSummary.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- 商品信息 -->
        </table>
        <table class="list" width="100%" id="tabs-3">
            <caption>
                商品包装信息动态区域
            </caption>
            <!-- 商品包装信息 -->
            <%
                Model.ProductPack.Load();
            %>
            <tr id="ProductPack♂" style="<%=Model.ProductPack.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <%
                        if (Model.ProductPack.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductPack.Count);
                            viewdictionary2.Add("Details", true);
                            Html.RenderPartial("ProductPackControl", Model.ProductPack.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- 商品包装信息 -->
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
