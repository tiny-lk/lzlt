<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ExportContracts/ExportContracts.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.ExportContracts>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���ں�ͬ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $(".print").live("click", function() {
                $("table>tbody").printArea("true");
            });
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">���ں�ͬ��Ϣ</a></li>
            <li><a href="#tabs-2">��Ʒ��Ϣ</a></li>
            <%--            <li><a href="#tabs-3">��Ʒ��װ��Ϣ</a></li>--%>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                ���ں�ͬ��Ϣ</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" class="button" value="�� ӡ" class="print" />
                        <input type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                        ���ں�ͬ���
                    </td>
                    <td align="right" style="width: 15%;">
                        ���ں�ͬ�ţ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Html.Encode( Model.Name))%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ���ں�ͬǩԼ���ڣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.Date.ToShortDateString())%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ͻ������ţ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.CustomerNo)%>
                    </td>
                    <td align="right">
                        ��ͬ���
                    </td>
                    <td align="left">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model.Type))%>
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
                                    Response.Write(Html.ActionLink(obj.Name, "DetailsCompany", "Admin", new { id = obj.ID.ToString() }));
                                }
                            }
                        %>
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
                    <td align="center" rowspan="5" valign="middle">
                        ����������
                    </td>
                    <td align="right">
                        ��ͬ���֣�
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
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.ClauseType)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ����˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.ClauseTypeNote)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����֤�������ޣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.SubmitDate)%>
                    </td>
                    <td align="right">
                        Ͷ���ձ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.PolicyType)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="6" valign="middle">
                        ����������
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
                        <%= Html.Encode(Model.TransferHaven)%>
                    </td>
                    <td align="right">
                        Ŀ�ĸۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.EdnHaven)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���䷽ʽ��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.TransportMode)%>
                    </td>
                    <td align="right">
                        �������ڣ�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ShipmentDate)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ʲ�ٷֱȣ���
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.ErrorValue)%>%
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ͷ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.Mark)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��װҪ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.PackRequire)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        ��������
                    </td>
                    <td align="right">
                        ��ͬ�ۺ����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.ComprehensiveConvention)%>
                    </td>
                </tr>
                <% 
                    Model.ExportContractsPrice.Load();
                    if (Model.ExportContractsPrice.Count > 0)
                    {
                        for (int i = 0; i < Model.ExportContractsPrice.Count; i++)
                        {
                            Model.ExportContractsPrice.ElementAt(i).PriceReference.Load();
                        }
                    }
                %>
                <!-- ���۵���Ϣ -->
                <tr id="ExportContractsPrice��" style="<%=Model.ExportContractsPrice.Count>0?"": "display: none"%>;
                    text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            ���۵���Ϣ</center>
                        <fieldset style="<%=Model.ExportContractsPrice.Count>0?"": "display: none"%>; width: 95%;">
                            <legend>���۵���Ϣ</legend>
                            <ul id="bjdxx" style="float: left; width: 100%; clear: both; position: relative;">
                                <%
                                    for (int i = 0; i < Model.ExportContractsPrice.Count(); i++)
                                    {
                                        var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                        Response.Write(string.Format(htmlstr,
                                            @"<input type='checkbox' name='Price��ID' checked='true' value='" + Model.ExportContractsPrice.ElementAt(i).Price.ID.ToString() + "' />",
                                            Html.ActionLink(Model.ExportContractsPrice.ElementAt(i).Price.Name, "Details", "Price", new { id = Model.ExportContractsPrice.ElementAt(i).Price.ID.ToString() }, null)));
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- ���۵���Ϣ -->
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" class="button" value="�� ӡ" class="print" />
                        <input type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table class="list" width="100%" id="tabs-2">
            <caption>
                ��Ʒ��Ϣ
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
        <%--<table class="list" width="100%" id="tabs-3">
            <caption>
                ��Ʒ��װ��Ϣ
            </caption>
            <!-- ��Ʒ��װ��Ϣ -->
            <%
                Model.ProductPack.Load();
            %>
            <tr id="ProductPack��" style="<%=Model.ProductPack.Count>0?"": "display: none"%>;">
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
            <!-- ��Ʒ��װ��Ϣ -->
        </table>--%>
    </div>
    <%
        } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
