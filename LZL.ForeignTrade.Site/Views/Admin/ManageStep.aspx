<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Step>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��λ����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
                window.location.href = '<%=Url.Content("~/Admin/AddStep/") %>';
            });

            $("#Edit").live("click", function() {
                if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                    var id = $(document).data('checkvalue');

                    window.location.href = '<%=Url.Action("EditStep","Admin")%>' + '/' + id;
                }
            });

            $("#Delete").bind("click", function() {
                if ($(document).data('checkvalue') != "" || $(document).data('checkvalue') != null) {
                    var State = confirm('��ȷ��Ҫɾ��' + $(document).data('checkvalue') + '��');
                    if (State == true) {
                        window.location.href = '<%=Url.Content("~/Admin/DeleteStep/") %>' + $(document).data('checkvalue');
                    }
                }
            });

            $("#Refresh").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageStep/") %>';
            });

        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <table width="100%" class="list">
        <caption>
            ��λ����</caption>
        <thead>
            <tr>
                <td colspan="3" align="right">
                    <input type="button" class="button" id="Add" value="�� ��" />
                    <input type="button" class="button" id="Edit" value="�� ��" disabled="disabled" check="1" />
                    <input type="button" class="button" id="Delete" value="ɾ ��" disabled="disabled" check="n" />
                    <input type="button" class="button" id="Refresh" value="ˢ ��" />
                </td>
            </tr>
        </thead>
        <tbody listmouse="listmouseovercss">
            <tr>
                <td>
                    <a href="#" id="allselect">ȫѡ</a>/<a href="#" id="reverseselect">��ѡ</a>
                </td>
                <td>
                    ��λ����
                </td>
            </tr>
            <%           
                for (int temp = 0; temp < Model.Count; temp++)
                { %>
            <tr>
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[temp].ID.ToString() ) })%>
                </td>
                <td>
                    <%=Html.Encode(Model[temp].Name)%>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <%} %>
</asp:Content>
