<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��������ֵ�����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Dictionary��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Dictionary��objectname" value="LZL.ForeignTrade.DataEntity.Dictionary,LZL.ForeignTrade.DataEntity" />
    <table width="100%"  class="list">
        <caption>
            ��������ֵ�����</caption>
        <thead align="center">
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDictionary") %>'" />
                </td>
            </tr>
            <tr>
                <td style="width:30%; text-align:right;">
                    ���ͣ�
                </td>
                <td align="left"  style="width:70%;">
                    <%= Html.TextBox("Dictionary��Type")%>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    ���ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary��Name")%>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    ���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary��Code")%>
                </td>
            </tr>
            <%-- <tr>
                <td style="text-align:right;">
                    �����룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary��Pid")%>
                </td>
            </tr>--%>
        </thead>
        <!-- ����¼���� -->
        <tfoot>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDictionary") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
