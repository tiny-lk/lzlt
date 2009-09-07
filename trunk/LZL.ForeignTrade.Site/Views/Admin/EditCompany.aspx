<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Company>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭��˾��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Company��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Company��objectname" value="LZL.ForeignTrade.DataEntity.Company,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption>
            �༭��˾��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Company��ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td align="right">
                    ��˾��ƣ�
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��Name", Html.Encode(Model.Name), new { style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������ƣ�
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��NameCH", Html.Encode(Model.NameCH), new { style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��NameEH", Html.Encode(Model.NameEH), new { style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ĵ�ַ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��AddressCH", Html.Encode(Model.AddressCH), new { style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��AddressEH", Html.Encode(Model.AddressEH), new { style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��DakCode", Html.Encode(Model.DakCode))%>
                </td>
                <td align="right">
                    �绰��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Phone", Html.Encode(Model.Phone))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���棺
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Fax", Html.Encode(Model.Fax))%>
                </td>
                <td align="right">
                    ��ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Internet", Html.Encode(Model.Internet))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Email", Html.Encode(Model.Email))%>
                </td>
                <td align="right">
                    �������У�
                </td>
                <td align="left">
                    <%= Html.DropDownList("Company��Bank", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("�������", Html.Encode(Model.Bank)), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �����ʺţ�
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��BankCode", Html.Encode(Model.BankCode), new { style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾�ձ꣺
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��Badge", Html.Encode(Model.Badge))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾ǩ�£�
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Company��Logo", Html.Encode(Model.Logo))%>
                </td>
            </tr>
        </thead>
        <!-- ����¼���� -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
