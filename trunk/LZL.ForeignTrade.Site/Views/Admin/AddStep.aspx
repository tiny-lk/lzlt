<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加岗位
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

    <table width="100%" class="list">
        <caption>
            添加岗位</caption>
        <tr>
            <td>
                岗位名称：
                <%= Html.TextBox("Step♂Name")%>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" class="button" value="确 定" /><input id="Back" type="button"
                    class="button" value="返 回" />
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
