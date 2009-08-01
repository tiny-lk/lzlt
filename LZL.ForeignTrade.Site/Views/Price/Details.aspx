<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Price>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������ϸ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <caption>
            ���۵���Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                </td>
            </tr>
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
            <!-- ��Ʒ��Ϣ -->
            <tr id="PriceProduct��" style="<%=Model.PriceProduct.Count>0?"": "display: none"%>;
                text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        �����ͻ���Ϣ</center>
                    <fieldset style="<%=Model.PriceProduct.Count>0?"": "display: none"%>; width: 95%;">
                        <legend>��Ʒ��Ϣ</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.PriceProduct.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Product��ID' checked='true' value='" + Model.PriceProduct.ElementAt(i).Product.ID.ToString() + "' />",
                                        Html.ActionLink(Model.PriceProduct.ElementAt(i).Product.NameCode, "Details", "Product", new { id = Model.PriceProduct.ElementAt(i).Product.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- ��Ʒ��Ϣ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
