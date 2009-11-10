<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StockContracts/StockContracts.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.StockContracts>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    采购合同详细信息
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $(".print").live("click", function() {
                $("thead").printArea("true");
            });
        });
    </script>

    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">采购合同信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
            <li><a href="#tabs-3">商品包装信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                采购合同信息</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="打 印" class="print" />
                        <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                        采购合同简介
                    </td>
                    <td align="right" style="width: 15%;">
                        采购合同号：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode( Html.Encode( Model.Name))%>
                    </td>
                    <td align="right" style="width: 15%;">
                        采购合同签约日期：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode(Model.Date.ToShortDateString())%>
                    </td>
                </tr>
                <tr>
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
                        合同类别：
                    </td>
                    <td align="left" colspan="3">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName( Html.Encode(Model.Type))%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        其它信息
                    </td>
                    <td align="right">
                        备注信息：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.Note)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="2" valign="middle">
                        费用类条款
                    </td>
                    <td align="right">
                        合同币种：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.CurrencyType)%>
                    </td>
                    <td align="right">
                        付款日期：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.SubmitDate)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%=Html.Encode(Model.PriceClauseNote)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" valign="middle">
                        运输类条款
                    </td>
                    <td align="right">
                        交货日期：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ConsignmentDate)%>
                    </td>
                    <td align="right">
                        交货地点：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ConsignmentAddress)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        唛头：
                    </td>
                    <td align="left" colspan="3">
                        <%=Html.Encode(Model.Mark)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        包装要求：
                    </td>
                    <td align="left" colspan="3">
                        <%=Html.Encode(Model.PackRequire)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        其它条款
                    </td>
                    <td align="right">
                        合同综合条款：
                    </td>
                    <td align="left" colspan="3">
                        <%=Html.Encode(Model.ComprehensiveConvention)%>
                    </td>
                </tr>
                <% 
                    Model.StockContractsExportContracts.Load();
                    if (Model.StockContractsExportContracts.Count > 0)
                    {
                        for (int i = 0; i < Model.StockContractsExportContracts.Count; i++)
                        {
                            Model.StockContractsExportContracts.ElementAt(i).ExportContractsReference.Load();
                        }
                    }
                %>
                <!-- 出口合同信息 -->
                <tr id="StockContractsExportContracts♂" style="<%=Model.StockContractsExportContracts.Count>0?"": "display: none"%>;
                    text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            出口合同信息</center>
                        <fieldset style="<%=Model.StockContractsExportContracts.Count>0?"": "display: none"%>;
                            width: 95%;">
                            <legend>出口合同信息</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                                <%
                                    for (int i = 0; i < Model.StockContractsExportContracts.Count(); i++)
                                    {
                                        var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                        Response.Write(string.Format(htmlstr,
                                            @"<input type='checkbox' name='ExportContracts♂ID' checked='true'  value='" + Model.StockContractsExportContracts.ElementAt(i).ExportContracts.ID.ToString() + "' />",
                                            Html.ActionLink(Model.StockContractsExportContracts.ElementAt(i).ExportContracts.Name, "Details", "ExportContracts", new { id = Model.StockContractsExportContracts.ElementAt(i).ExportContracts.ID.ToString() }, null)));
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- 出口合同信息 -->
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="打 印" class="print" />
                        <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
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
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
