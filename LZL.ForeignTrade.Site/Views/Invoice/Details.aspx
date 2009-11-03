<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Invoice/Invoice.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Invoice>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    显示发票（单证）信息
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">发票信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                发票（单据）信息</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="7" align="center" valign="middle" style="width: 10%;">
                        发票简介
                    </td>
                    <td align="right" style="width: 15%;">
                        发票号：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode( Model.Name)%>
                    </td>
                    <td align="right" style="width: 15%;">
                        发票日期：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode(Model.Date.ToShortDateString())%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        出口合同号：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.ExportContractsName)%>
                    </td>
                    <td align="right">
                        撤销单号：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.RevocationNo)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        发票币种：
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
                    <td align="left">
                        <%= Html.Encode(Model.ClauseType)%>
                    </td>
                    <td align="right">
                        贸易方式：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Trade)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%=  Html.Encode(Model.ClauseTypeNote)%>
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
                    <td align="center" rowspan="3" valign="middle">
                        信用证信息
                    </td>
                    <td align="right">
                        信用证号：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.CreditCardNo)%>
                    </td>
                    <td align="right">
                        开证银行：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.AccountBank)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        开证日期：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.AccountDate)%>
                    </td>
                    <td align="right">
                        装运期限：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ShipmentDate)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        有效期限：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ValidDate)%>
                    </td>
                    <td align="right">
                        发票类型：
                    </td>
                    <td align="left">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("发票类型", Html.Encode(Model.Type))%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        运输信息
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
                        <%=Html.Encode(Model.TransferHaven)%>
                    </td>
                    <td align="right">
                        目的港口：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.EdnHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        运输方式：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.TransportMode)%>
                    </td>
                    <td align="right">
                        运费支付：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.FreightPayment)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        分批：
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice♂IsBatches", Model.IsBatches)%>
                    </td>
                    <td align="right">
                        转运：
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice♂IsTransfer", Model.IsTransfer)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        唛头：
                    </td>
                    <td align="left" colspan="3">
                        <%=  Html.Encode(Model.Mark)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        商品信息汇总
                    </td>
                    <td align="right">
                        总销售金额：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalSalesAmount)%>
                    </td>
                    <td align="right">
                        总包装数量：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackAmount)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        英文包装单位：
                    </td>
                    <td align="left">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("英文单位", Html.Encode(Model.TotalPackUnitEN))%>
                    </td>
                    <td align="right">
                        包装毛重(KG)：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackGrossWeight)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        包装净重(KG)：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackNetWeight)%>
                    </td>
                    <td align="right">
                        包装体积(CBM)：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackBulk)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        商品总数量：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.TotalProductAmount)%>
                    </td>
                    <td align="right">
                        商品总单位：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalUnit)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        商品总数量(不同单位)：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.TotalDifferentUnit)%>
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
                    <td colspan="5" align="center">
                        单证条款
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        发票
                    </td>
                    <td align="right">
                        发票条款：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.InvoiceItem)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        装箱单
                    </td>
                    <td align="right">
                        装箱单条款：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.BoxItem)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="9" valign="middle">
                        海运提单
                    </td>
                    <td align="right">
                        提单号码：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.OceanNo)%>
                    </td>
                    <td align="right">
                        提单日期：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanDate)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        托运人：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Shipper)%>
                    </td>
                    <td align="right">
                        收货人：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Consignee)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        通知人：
                    </td>
                    <td align="left">
                        <%=Html.Encode(Model.CircularizeMan)%>
                    </td>
                    <td align="right">
                        收货地址：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ReceivingAddress)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        航班号：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.FlightNo)%>
                    </td>
                    <td align="right">
                        提单份数：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanCount)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        运费支付：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanFreightPayment)%>
                    </td>
                    <td align="right">
                        运费金额：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.FreightAmount)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        一程船名：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OneProcessName)%>
                    </td>
                    <td align="right">
                        二程船名：
                    </td>
                    <td align="left">
                        <%=Html.Encode(Model.TwoProcessName)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        代理：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanDeputy)%>
                    </td>
                    <td align="right">
                        运抵国：
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanTansportCountry)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        启运港：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.OceanStartHaven)%>
                    </td>
                    <td align="right">
                        转运港：
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.OceanEdnHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        目的港：
                    </td>
                    <td align="left" colspan="4">
                        <%=  Html.Encode(Model.OceanTransferHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        提单备注：
                    </td>
                    <td align="left" colspan="4">
                        <%=Html.Encode(Model.OceanNote)%>
                    </td>
                </tr>
                <% 
                    Model.InvoiceExportContracts.Load();
                    if (Model.InvoiceExportContracts.Count > 0)
                    {
                        for (int i = 0; i < Model.InvoiceExportContracts.Count; i++)
                        {
                            Model.InvoiceExportContracts.ElementAt(i).ExportContractsReference.Load();
                        }
                    }
                %>
                <!-- 报价单信息 -->
                <tr id="InvoiceExportContracts♂" style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>;
                    text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            出口合同信息</center>
                        <fieldset style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>; width: 95%;">
                            <legend>出口合同信息</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                                <%
                                    for (int i = 0; i < Model.InvoiceExportContracts.Count(); i++)
                                    {
                                        var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                        Response.Write(string.Format(htmlstr,
                                            @"<input type='checkbox' name='ExportContracts♂ID' checked='true' value='" + Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() + "' />",
                                            Html.ActionLink(Model.InvoiceExportContracts.ElementAt(i).ExportContracts.Name, "Details", "ExportContracts", new { id = Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() }, null)));
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- 报价单信息 -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
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
    </div>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
