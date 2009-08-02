<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Product>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    ��Ʒ��ϸ��Ϣ
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
            ��Ʒ��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ӡ" class="print" />
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                    ��Ʒ������Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    ��Ʒ���루��ƣ���
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode( Model.NameCode)%>
                </td>
                <td align="right" style="width: 15%;">
                    �������ƣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode(Model.NameCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.Encode(Model.NameEH)%>
                </td>
                <td align="right">
                    ���Ĺ��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.SpecCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�Ĺ��
                </td>
                <td align="left">
                    <%=  Html.Encode(Model.SpecEN)%>
                </td>
                <td align="right">
                    ���ĵ�λ��
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("���ĵ�λ", Html.Encode(Model.UnitCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("Ӣ�ĵ�λ", Html.Encode(Model.UnitEN))%>
                </td>
                <td align="right">
                    ���ش��룺
                </td>
                <td align="left">
                    <%= Html.Encode(Model.CustomsCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ���룺
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.BarCode)%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="6" valign="middle">
                    ��Ʒ��װ
                </td>
                <td align="right">
                    ��װ��Ʒ������
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackAmount)%>
                </td>
                <td align="right">
                    ���İ�װ��λ��
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("���ĵ�λ", Html.Encode(Model.PackUnitCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�İ�װ��λ��
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("Ӣ�ĵ�λ", Html.Encode(Model.PackUnitEN))%>
                </td>
                <td align="right">
                    ��װ����(CM)��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackLength)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CM)��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackWidth)%>
                </td>
                <td align="right">
                    ��װ�߶�(CM)��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackHeight)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CBM)��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackBulk)%>
                </td>
                <td align="right">
                    ��װë��(KG)��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackGrossWeight)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ����(KG)��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.PackNetWeight)%>
                </td>
                <td align="right">
                    �ں���Ʒ������
                </td>
                <td align="left">
                    <%= Html.Encode(Model.BoxAmount)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ں����ĵ�λ��
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("���ĵ�λ", Html.Encode(Model.BoxUnitCH))%>
                </td>
                <td align="right">
                    �ں�Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("Ӣ�ĵ�λ", Html.Encode(Model.BoxUnitEN))%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="4" valign="middle">
                    ������Ϣ
                </td>
                <td align="right">
                    ��Ʒ���
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("��Ʒ����", Html.Encode(Model.TypeCode))%>
                </td>
                <td align="right">
                    �Ƿ���
                </td>
                <td align="left">
                    <%= Html.CheckBox("IsShare", Model.IsShare)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ����������
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.DescriptionCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ƷӢ��������
                </td>
                <td align="left" colspan="3">
                    <%= Html.Encode(Model.DescriptionEN)%>
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
            <!-- �ͻ����� -->
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
                        �����ͻ���Ϣ</center>
                    <%
                        var customers = Model.ProductCustomer.Where(v => v.Customer.TypeCode.Equals("01")).Select(v => v.Customer);
                        if (customers.Count() > 0)
                        {
                    %>
                    <fieldset style="width: 95%;">
                        <legend>��Ӧ�̹�ϵ��Ϣ</legend>
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
                        <legend>�ͻ���Ʒ��ϵ��Ϣ</legend>
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
            <!-- �ͻ����� -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ӡ" class="print" />
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
