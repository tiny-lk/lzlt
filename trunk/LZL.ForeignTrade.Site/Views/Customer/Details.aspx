<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/Customer.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �ͻ���ϸ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $(".print").live("click", function() {
                $("thead").printArea("true");
            });
        });
    </script>

    <table width="100%">
        <caption>
            �ͻ���Ϣ</caption>
        <thead>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ӡ" class="print" />
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="8" align="center" valign="middle" style="width: 10%;">
                    �ͻ�������Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    �ͻ����루��ƣ���
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode( Model.NameCode)%>
                </td>
                <td align="right" style="width: 15%;">
                    �������ƣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.Encode(Model.NameCn)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.Encode(Model.NameEn)%>
                </td>
                <td align="right">
                    �� ַ��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Address)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.AddressEn)%>
                </td>
                <td align="right">
                    �ǹ������ݣ�
                </td>
                <td align="left">
                    <%= Html.CheckBox("Customer��IsShare", Model.IsShare)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ң�
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("����", Html.Encode(Model.Country))%>
                </td>
                <td align="right">
                    ʡ�ݣ��ݣ���
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Province)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���У�
                </td>
                <td align="left">
                    <%= Html.Encode(Model.City)%>
                </td>
                <td align="right">
                    �������룺
                </td>
                <td align="left">
                    <%= Html.Encode(Model.DakCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �绰���룺
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Phone)%>
                </td>
                <td align="right">
                    ������룺
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Fax)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��վ��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Internet)%>
                </td>
                <td align="right">
                    �ͻ����
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName("�ͻ�����", Html.Encode(Model.TypeCode))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��
                </td>
                <td align="left" colspan="3" style="width: 99%;">
                    <%= Html.Encode( Model.Note)%>
                </td>
            </tr>
            <tr>
                <td align="center" valign="middle">
                    ������Ϣ
                </td>
                <td align="right">
                    �������У�
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Bank)%>
                </td>
                <td align="right">
                    ��&nbsp;&nbsp;&nbsp;&nbsp;����
                </td>
                <td align="left">
                    <%= Html.Encode( Model.BankCode)%>
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <tr id="Linkman��" style="display: none;">
                <td colspan="5">
                    <%
                        Model.Linkman.Load();
                        if (Model.Linkman.Count > 0)
                        {
                            ViewDataDictionary viewdictionary = new ViewDataDictionary();
                            viewdictionary.Add("number", Model.Linkman.Count);
                            viewdictionary.Add("Details", true);
                            Html.RenderPartial("LinkmanControl", Model.Linkman.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <!-- ����¼���� -->
            <tr id="Memorandum��" style="display: none;">
                <td colspan="5">
                    <%
                        Model.Memorandum.Load();
                        if (Model.Memorandum.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.Memorandum.Count);
                            viewdictionary2.Add("Details", true);
                            Html.RenderPartial("MemorandumControl", Model.Memorandum.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ӡ" class="print" />
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
