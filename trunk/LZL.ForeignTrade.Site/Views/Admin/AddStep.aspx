<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��Ӹ�λ
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

    <table width="100%" class="list">
        <caption>
            ��Ӹ�λ</caption>
        <tr>
            <td>
                ��λ���ƣ�
                <%= Html.TextBox("Step��Name")%>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" class="button" value="ȷ ��" /><input id="Back" type="button"
                    class="button" value="�� ��" />
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
