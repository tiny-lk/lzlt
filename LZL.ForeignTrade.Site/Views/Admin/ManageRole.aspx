<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    角色管理
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        角色管理</h2>

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
                    var State = confirm('你确认要删除' + $(document).data('checkvalue') + '吗？');
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
                    <input type="button" id="Add" value="添 加" />
                    <input type="button" id="Delete" value="删 除" disabled="disabled" check="n" />
                    <input type="button" id="Refresh" value="刷 新" />
                </td>
            </tr>
        </thead>
        <tbody listmouse="listmouseovercss">
            <tr>
                <td>
                    <a href="#" id="allselect">全选</a>/<a href="#" id="reverseselect">反选</a>
                </td>
                <td>
                    角色名称
                </td>
                <td>
                    备注信息
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
