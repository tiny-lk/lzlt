<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӹ�˾��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Company��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Company��objectname" value="LZL.ForeignTrade.DataEntity.Company,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Company��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Company��iseditdate", "EditDate")%>
    <table width="100%"  class="list">
        <caption>
            ��ӹ�˾��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾��ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Name","", new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��NameCH","", new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��NameEH","", new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��AddressCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��AddressEH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��DakCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �绰��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Phone")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���棺
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Fax")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Internet","", new { validate = "url:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email��
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Email","", new { validate = "email:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������У�
                </td>
                <td align="left">
                    <%= Html.DropDownList("Company��Bank", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("�������",""), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �����ʺţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��BankCode","", new { validate = "creditcard:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾�ձ꣺
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Badge")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��˾ǩ�£�
                </td>
                <td align="left">
                    <%= Html.TextBox("Company��Logo")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Company��Note","", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ϵͳĬ�ϣ�
                </td>
                <td align="left" colspan="3">
                    <%= Html.CheckBox("Company��IsSystem")%>
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
