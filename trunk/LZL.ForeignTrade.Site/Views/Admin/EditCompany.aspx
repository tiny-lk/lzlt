<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Company>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭��˾��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �༭��˾��Ϣ</h2>
    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Company��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Company��objectname" value="LZL.ForeignTrade.DataEntity.Company,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
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
                <td align="left">
                    <%= Html.TextBox("Company��Name", Html.Encode(Model.Name))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��NameCH", Html.Encode(Model.NameCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��NameEH", Html.Encode(Model.NameEH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��AddressCH", Html.Encode(Model.AddressCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��AddressEH", Html.Encode(Model.AddressEH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��DakCode", Html.Encode(Model.DakCode))%>
                </td>
            </tr>
            <tr>
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
            </tr>
            <tr>
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
            </tr>
            <tr>
                <td align="right">
                    �������У�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Bank", Html.Encode(Model.Bank))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �����ʺţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��BankCode", Html.Encode(Model.BankCode))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾�ձ꣺
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Badge", Html.Encode(Model.Badge))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾ǩ�£�
                </td>
                <td align="left">
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
