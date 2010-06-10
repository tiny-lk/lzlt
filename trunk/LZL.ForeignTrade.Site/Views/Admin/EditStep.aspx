<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Step>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑岗位
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
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Step♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Step♂objectname" value="LZL.ForeignTrade.DataEntity.Step,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Step♂ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%" class="list">
        <caption>
            编辑岗位</caption>
        <tr>
            <td>
                岗位名称：
            </td>
            <td>
                <%= Html.TextBox("Step♂Name", Html.Encode(Model.Name.ToString()))%>
            </td>
        </tr>
        <tr>
            <td>
                岗位序号：
            </td>
            <td>
                <%= Html.Encode( Html.Encode(Model.RowNum.ToString()))%>
            </td>
        </tr>
        <tr>
            <td>
                包含角色：
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
                <input type="submit" class="button" value="确 定" /><input id="Back" type="button"
                    class="button" value="返 回" />
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
