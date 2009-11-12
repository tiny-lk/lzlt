<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Company>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��˾��ϸ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" class="list">
        <caption>
            ��˾��ϸ��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Company��ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td align="right">
                    ��˾��ƣ�
                </td>
                <td align="left">
                    <%=Html.Encode(Model.Name)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������ƣ�
                </td>
                <td align="left">
                    <%= Html.Encode(Model.NameCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Model.NameEH%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.AddressCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left">
                    <%=  Html.Encode(Model.AddressEH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������룺
                </td>
                <td align="left">
                    <%= Html.Encode(Model.DakCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �绰��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Phone)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���棺
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Fax)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ַ��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Internet)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Email)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������У�
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model.Bank))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �����ʺţ�
                </td>
                <td align="left">
                    <%= Html.Encode(Model.BankCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾�ձ꣺
                </td>
                <td align="left">
                    <%=  Html.Encode(Model.Badge)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾ǩ�£�
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Logo)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Note)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ϵͳĬ�ϣ�
                </td>
                <td align="left">
                    <%= Html.CheckBox("Company��IsSystem", Model.IsSystem.GetValueOrDefault())%>
                </td>
            </tr>
        </thead>
        <!-- ����¼���� -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
