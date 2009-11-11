<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Department>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑部门
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Department♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Department♂objectname" value="LZL.ForeignTrade.DataEntity.Department,LZL.ForeignTrade.DataEntity" />
    <table width="100%"  class="list">
        <caption>
            编辑部门</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDepartment") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Department♂ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td align="right">
                    部门名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Department♂Name", Html.Encode(Model.Name))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    部门排序：
                </td>
                <td align="left">
                    <%= Html.TextBox("Department♂OrderField", Html.Encode(Model.OrderField))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    父编码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Department♂ParentId", Html.Encode(Model.ParentId))%>
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDepartment") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
