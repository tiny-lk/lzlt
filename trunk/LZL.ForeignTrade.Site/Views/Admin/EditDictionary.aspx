<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Dictionary>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭�����ֵ�
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �༭�����ֵ���Ϣ</h2>
    <% using (Html.BeginForm())
       { %>
        <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Dictionary��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Dictionary��objectname" value="LZL.ForeignTrade.DataEntity.Dictionary,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDictionary") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Dictionary��ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td align="right">
                    ���ͣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary��Type", Html.Encode(Model.Type))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary��Name", Html.Encode(Model.Name))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary��Code", Html.Encode(Model.Code))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �����룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary��Pid", Html.Encode(Model.Pid))%>
                </td>
            </tr>
        </thead>
        <!-- ����¼���� -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDictionary") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
