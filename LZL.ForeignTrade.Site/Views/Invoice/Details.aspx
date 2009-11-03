<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Invoice/Invoice.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Invoice>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    ��ʾ��Ʊ����֤����Ϣ
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">��Ʊ��Ϣ</a></li>
            <li><a href="#tabs-2">��Ʒ��Ϣ</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                ��Ʊ�����ݣ���Ϣ</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="7" align="center" valign="middle" style="width: 10%;">
                        ��Ʊ���
                    </td>
                    <td align="right" style="width: 15%;">
                        ��Ʊ�ţ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode( Model.Name)%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ��Ʊ���ڣ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode(Model.Date.ToShortDateString())%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ں�ͬ�ţ�
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.ExportContractsName)%>
                    </td>
                    <td align="right">
                        �������ţ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.RevocationNo)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʊ���֣�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.CurrencyType)%>
                    </td>
                    <td align="right">
                        �۸����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.PriceClause)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �۸������˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.PriceClauseNote)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseType)%>
                    </td>
                    <td align="right">
                        ó�׷�ʽ��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Trade)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ����˵����
                    </td>
                    <td align="left" colspan="3">
                        <%=  Html.Encode(Model.ClauseTypeNote)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ѡ��ͻ���
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
                        ��˾��ƣ�
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
                        ����֤��Ϣ
                    </td>
                    <td align="right">
                        ����֤�ţ�
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.CreditCardNo)%>
                    </td>
                    <td align="right">
                        ��֤���У�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.AccountBank)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��֤���ڣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.AccountDate)%>
                    </td>
                    <td align="right">
                        װ�����ޣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ShipmentDate)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ч���ޣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ValidDate)%>
                    </td>
                    <td align="right">
                        ��Ʊ���ͣ�
                    </td>
                    <td align="left">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("��Ʊ����", Html.Encode(Model.Type))%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        ������Ϣ
                    </td>
                    <td align="right">
                        �˵ֹ���
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TansportCountry)%>
                    </td>
                    <td align="right">
                        ���˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.StartHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ת�˸ۿڣ�
                    </td>
                    <td align="left">
                        <%=Html.Encode(Model.TransferHaven)%>
                    </td>
                    <td align="right">
                        Ŀ�ĸۿڣ�
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.EdnHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���䷽ʽ��
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.TransportMode)%>
                    </td>
                    <td align="right">
                        �˷�֧����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.FreightPayment)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ������
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice��IsBatches", Model.IsBatches)%>
                    </td>
                    <td align="right">
                        ת�ˣ�
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice��IsTransfer", Model.IsTransfer)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ͷ��
                    </td>
                    <td align="left" colspan="3">
                        <%=  Html.Encode(Model.Mark)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        ��Ʒ��Ϣ����
                    </td>
                    <td align="right">
                        �����۽�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalSalesAmount)%>
                    </td>
                    <td align="right">
                        �ܰ�װ������
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackAmount)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Ӣ�İ�װ��λ��
                    </td>
                    <td align="left">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("Ӣ�ĵ�λ", Html.Encode(Model.TotalPackUnitEN))%>
                    </td>
                    <td align="right">
                        ��װë��(KG)��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackGrossWeight)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��װ����(KG)��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackNetWeight)%>
                    </td>
                    <td align="right">
                        ��װ���(CBM)��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalPackBulk)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʒ��������
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.TotalProductAmount)%>
                    </td>
                    <td align="right">
                        ��Ʒ�ܵ�λ��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TotalUnit)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʒ������(��ͬ��λ)��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.TotalDifferentUnit)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        ������Ϣ
                    </td>
                    <td align="right">
                        ��ע��Ϣ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.Note)%>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="center">
                        ��֤����
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        ��Ʊ
                    </td>
                    <td align="right">
                        ��Ʊ���
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.InvoiceItem)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        װ�䵥
                    </td>
                    <td align="right">
                        װ�䵥���
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.BoxItem)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="9" valign="middle">
                        �����ᵥ
                    </td>
                    <td align="right">
                        �ᵥ���룺
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.OceanNo)%>
                    </td>
                    <td align="right">
                        �ᵥ���ڣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanDate)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �����ˣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Shipper)%>
                    </td>
                    <td align="right">
                        �ջ��ˣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Consignee)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ֪ͨ�ˣ�
                    </td>
                    <td align="left">
                        <%=Html.Encode(Model.CircularizeMan)%>
                    </td>
                    <td align="right">
                        �ջ���ַ��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ReceivingAddress)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����ţ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.FlightNo)%>
                    </td>
                    <td align="right">
                        �ᵥ������
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanCount)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �˷�֧����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanFreightPayment)%>
                    </td>
                    <td align="right">
                        �˷ѽ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.FreightAmount)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        һ�̴�����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OneProcessName)%>
                    </td>
                    <td align="right">
                        ���̴�����
                    </td>
                    <td align="left">
                        <%=Html.Encode(Model.TwoProcessName)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanDeputy)%>
                    </td>
                    <td align="right">
                        �˵ֹ���
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.OceanTansportCountry)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���˸ۣ�
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.OceanStartHaven)%>
                    </td>
                    <td align="right">
                        ת�˸ۣ�
                    </td>
                    <td align="left">
                        <%=  Html.Encode(Model.OceanEdnHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Ŀ�ĸۣ�
                    </td>
                    <td align="left" colspan="4">
                        <%=  Html.Encode(Model.OceanTransferHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ᵥ��ע��
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
                <!-- ���۵���Ϣ -->
                <tr id="InvoiceExportContracts��" style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>;
                    text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            ���ں�ͬ��Ϣ</center>
                        <fieldset style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>; width: 95%;">
                            <legend>���ں�ͬ��Ϣ</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                                <%
                                    for (int i = 0; i < Model.InvoiceExportContracts.Count(); i++)
                                    {
                                        var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                        Response.Write(string.Format(htmlstr,
                                            @"<input type='checkbox' name='ExportContracts��ID' checked='true' value='" + Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() + "' />",
                                            Html.ActionLink(Model.InvoiceExportContracts.ElementAt(i).ExportContracts.Name, "Details", "ExportContracts", new { id = Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() }, null)));
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- ���۵���Ϣ -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table class="list" width="100%" id="tabs-2">
            <caption>
                ��Ʒ��Ϣ��̬����
            </caption>
            <%
                Model.ProductSummary.Load();
            %>
            <!-- ��Ʒ��Ϣ -->
            <tr id="ProductSummary��" style="<%=Model.ProductSummary.Count>0?"": "display: none"%>;">
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
            <!-- ��Ʒ��Ϣ -->
        </table>
    </div>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
