<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUserCollection>" %>

<asp:Content ID="ManageUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    用户管理
</asp:Content>
<asp:Content ID="ManageUserContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.PrintArea.js")%>"></script>

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

            $("#Edit").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/EditUser/") %>' + $(document).data('checkvalue');
            });

            $("#Refresh").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageUser/") %>';
            });

            $(".print").bind("click", function() {
                $("table > tbody ").printArea("true");
            });

            $("#Delete").bind("click", function() {
                var State = confirm('你确认要删除' + $(document).data('checkvalue') + '吗？');
                if (State == true) {
                    window.location.href = '<%=Url.Content("~/Account/DeleteUser/") %>' + $(document).data('checkvalue');
                }
            });
        });

    </script>

    <% using (Html.BeginForm())
       { %>
    <table width="100%" style="vertical-align: middle; text-align: center;" summary="User Grid">
        <caption>
            用户管理</caption>
        <thead>
            <tr>
                <td colspan="2">
                    <%= Html.DropDownList("searchType", (SelectList)ViewData["searchOptionList"])%>
                </td>
                <td colspan="2">
                    <%= Html.TextBox("searchInput", ViewData["searchInput"])%>
                </td>
                <td colspan="2" align="left">
                    <input type="submit" id="Query" value="查 询" />
                    <input type="button" id="Edit" value="修 改" disabled="disabled" check="1" />
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
                    用户名
                </td>
                <td>
                    电子邮件
                </td>
                <td>
                    创建时间
                </td>
                <td>
                    最后使用时间
                </td>
                <td>
                    是否可用
                </td>
            </tr>
            <% foreach (MembershipUser membershipUser in ViewData.Model)
               { %>
            <tr id="user-<%= membershipUser.UserName %>">
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(membershipUser.UserName.ToString()) })%>
                </td>
                <td>
                    <%= membershipUser.UserName%>
                </td>
                <td>
                    <%= membershipUser.Email%>
                </td>
                <td align="center">
                    <%= membershipUser.CreationDate.ToLocalTime()%>
                </td>
                <td align="center">
                    <%= membershipUser.LastActivityDate.ToLocalTime()%>
                </td>
                <td align="center">
                    <%= Html.Encode(membershipUser.IsApproved ? "是" : "否")%>
                </td>
            </tr>
            <% } %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="9" align="right">
                    <a href="#" class="print">打 印</a>|
                    <%
                        int count = int.Parse(ViewData["pagecount"].ToString());
                        int p = Request["page"] == null ? 1 : int.Parse(Request["page"]);
                        if (p >= count && count <= 1)
                        {
                            Response.Write("上一页|下一页");
                        }
                        else
                        {
                            if (p < count)
                            {
                                Response.Write("上一页|" + Html.ActionLink("下一页", "Admin", "ManageUser", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("上一页", "Admin", "ManageUser", new { page = p - 1 }, null) + "|下一页");
                            }
                        }
                        Response.Write("|当前页：第 <span style='font-weight:bolder; color:Red;'>" + p + "</span> 页|总页码：<span style='font-weight:bolder; color:Red;'>" + count + "</span> 页");
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
    <% } %>
</asp:Content>
