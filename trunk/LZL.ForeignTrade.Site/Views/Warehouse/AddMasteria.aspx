<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���ԭ����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ���ԭ����</h2>
    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Masteria��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Masteria��objectname" value="LZL.ForeignTrade.DataEntity.MasteriaBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    ԭ���ϱ�ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��YclNo")%>
                </td>
                <td align="right">
                    ԭ�������
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��YclType")%>
                </td>
                <td align="right">
                    ԭ���ϳɷ֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��YclCf")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ԭ����������
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��BWeight")%>
                </td>
                <td align="right">
                    ԭ������ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��BColor")%>
                </td>
                <td align="right">
                    ԭ����������
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��BCount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ԭ���ϵ��ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��BPrice")%>
                </td>
                <td align="right">
                    ԭ���ϸ׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��Bgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right">
                    ����������
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��LwWeight")%>
                </td>
                <td align="right">
                    ������ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��LwColor")%>
                </td>
                <td align="right">
                    ����������
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��LwCount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���Ƶ��ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��LwPrice")%>
                </td>
                <td align="right">
                    ���Ƹ׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��Lwgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ƭ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��SpWeight")%>
                </td>
                <td align="right">
                    ��Ƭ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��SpColor")%>
                </td>
                <td align="right">
                    ��Ƭ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��SpCount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ƭ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��SpPrice")%>
                </td>
                <td align="right">
                    ��Ƭ�׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria��Spgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
        </thead>
        <!-- ����¼���� -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
