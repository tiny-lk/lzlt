<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Department>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Department��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Department��objectname" value="LZL.ForeignTrade.DataEntity.Department,LZL.ForeignTrade.DataEntity" />
    <table width="100%"  class="list">
        <caption>
            �༭����</caption>
        <thead align="center">
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDepartment") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Department��ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td style="width:30%; text-align:right;">
                    �������ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Department��Name", Html.Encode(Model.Name))%>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    ��������
                </td>
                <td align="left">
                    <%= Html.TextBox("Department��OrderField", Html.Encode(Model.OrderField))%>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    �����룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Department��ParentId", Html.Encode(Model.ParentId))%>
                </td>
            </tr>
        </thead>
        <!-- ����¼���� -->
        <tfoot>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDepartment") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
