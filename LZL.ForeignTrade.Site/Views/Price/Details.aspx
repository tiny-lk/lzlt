<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Price>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������ϸ��Ϣ
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
            <li><a href="#tabs-1">���۵���Ϣ</a></li>
            <li><a href="#tabs-2">��Ʒ��Ϣ</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                ���۵���Ϣ</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="�� ӡ" class="print" />
                        <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                        ���۵�������Ϣ
                    </td>
                    <td align="right" style="width: 15%;">
                        ���۵��ţ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode(Model.Name)%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ���۵����ڣ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.Encode(Model.Date)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���۱��֣�
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
                    <td align="center" rowspan="3" valign="middle">
                        �������
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
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.TransportMode)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        ��Ʒ��Ϣͳ�ƻ���
                    </td>
                    <td align="right">
                        ���۵����ͣ�
                    </td>
                    <td align="left">
                        <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("���۵�����", Html.Encode(Model.PriceType))%>
                    </td>
                    <td align="right">
                        �ܱ��۽�
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseQuote)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ܰ�װ������
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClausePackNumber)%>
                    </td>
                    <td align="right">
                        ��װ��λ��Ӣ�ģ���
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseUnitEN)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ë�أ�KG����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseWeight)%>
                    </td>
                    <td align="right">
                        �ܾ��أ�KG����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseNetWeight)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �������CBM����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseBulk)%>
                    </td>
                    <td align="right">
                        ��Ʒ��������
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseNumber)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʒ�ܵ�λ��
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseUnit)%>
                    </td>
                    <td align="right">
                        ��Ʒ������<br />
                        ����ͬ��λ����
                    </td>
                    <td align="left">
                        <%= Html.Encode(Model.ClauseNotUnit)%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="2" valign="middle">
                        ������Ϣ
                    </td>
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
                    <td align="right">
                        ��ע��Ϣ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.Encode(Model.Note)%>
                    </td>
                </tr>
                <!-- ��Ʒ��װ��Ϣ -->
                <tr id="ProductPack��" style="display: none;">
                    <td colspan="5">
                        <%
                            Model.ProductPack.Load();
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
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="button" value="�� ӡ" class="print" />
                        <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
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
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
