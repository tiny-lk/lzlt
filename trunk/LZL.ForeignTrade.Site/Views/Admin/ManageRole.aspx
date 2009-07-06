<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��ɫ����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ��ɫ����</h2>

    <script type="text/javascript">
        $(document).ready(function() {

            $("#allselect").bind("click", function() {
                $.each($('table > tbody > tr').find("input[type='checkbox']"), function(i, o) {
                    if ($(o).attr("checked") != true) {
                        $(o).click();
                    }
                })
            });

            $("#reverseselect").bind("click", function() {
                $('table > tbody > tr').find("input[type='checkbox']").click();
            });

            $("#Add").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/AddRole/") %>';
            });

            $("#Delete").bind("click", function() {
                if ($(document).data('checkvalue') != "" || $(document).data('checkvalue') != null) {
                    var State = confirm('��ȷ��Ҫɾ��' + $(document).data('checkvalue') + '��');
                    if (State == true) {
                        window.location.href = '<%=Url.Content("~/Admin/DeleteRole/") %>' + $(document).data('checkvalue');
                    }
                }
            });


            $("#Refresh").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageRole/") %>';
            });

        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <table width="100%" style="vertical-align: middle; text-align: center;" summary="User Grid">
        <thead>
            <tr>
                <td colspan="3" align="right">
                    <input type="button" id="Add" value="�� ��" />
                    <input type="button" id="Delete" value="ɾ ��" disabled="disabled" check="n" />
                    <input type="button" id="Refresh" value="ˢ ��" />
                </td>
            </tr>
        </thead>
        <tbody listmouse="listmouseovercss">
            <tr>
                <td>
                    <a href="#" id="allselect">ȫѡ</a>/<a href="#" id="reverseselect">��ѡ</a>
                </td>
                <td>
                    ��ɫ����
                </td>
                <td>
                    ��ע��Ϣ
                </td>
            </tr>
            <% foreach (string role in (string[])ViewData.Model)
               { %>
            <tr>
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(role) })%>
                </td>
                <td>
                    <%=Html.Encode(role) %>
                </td>
                <td>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <%} %>
</asp:Content>
