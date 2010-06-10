<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Step>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭��λ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {
            $("#Back").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageStep/") %>';
            })
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Step��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Step��objectname" value="LZL.ForeignTrade.DataEntity.Step,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Step��ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%" class="list">
        <caption>
            �༭��λ</caption>
        <tr>
            <td>
                ��λ���ƣ�
            </td>
            <td>
                <%= Html.TextBox("Step��Name", Html.Encode(Model.Name.ToString()))%>
            </td>
        </tr>
        <tr>
            <td>
                ��λ��ţ�
            </td>
            <td>
                <%= Html.Encode( Html.Encode(Model.RowNum.ToString()))%>
            </td>
        </tr>
        <tr>
            <td>
                ������ɫ��
            </td>
            <td>
                <% foreach (string role in (string[])ViewData["roles"])
                   { %>
                <%= Html.CheckBox("role",LZL.ForeignTrade.Controllers.AdminController.IsRoleInStep(Model.ID.ToString(), role), new { value = role })%>
                <%= role%>
                <br />
                <% } %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" class="button" value="ȷ ��" /><input id="Back" type="button"
                    class="button" value="�� ��" />
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
