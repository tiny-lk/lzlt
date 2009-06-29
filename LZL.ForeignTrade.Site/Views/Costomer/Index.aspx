<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    客户信息
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        客户信息</h2>
    <table width="97%" style="vertical-align: middle; text-align: center;">
        <tr>
            <td>
                选择
            </td>
            <td>
                序号
            </td>
            <td>
                客户代码
            </td>
            <td>
                客户中文名称
            </td>
            <td>
                客户英文名称
            </td>
            <td>
                电话
            </td>
            <td>
                客户类型
            </td>
            <td>
                是否共享
            </td>
            <td>
                操作
            </td>
        </tr>
        <%
            int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
            for (int i = 0; i < Model.Count; i++)
            {
                
        %>
        <tr>
            <td>
                <%= Html.CheckBox("select",false) %>
            </td>
            <td>
                <%= ((i + 1) * page).ToString()%>
            </td>
            <td>
                <%= Html.Encode( Model[i].NameCode) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].NameCn) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].NameEn) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].Phone) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].TypeCode) %>
            </td>
            <td>
                <%= Html.Encode( Model[i].IsShare?"是":"否" ) %>
            </td>
            <td>
                <%= Html.ActionLink("详细", "", new { id = Html.Encode(Model[i].ID) })%>|
                <%= Html.ActionLink("删除", "", new { id = Html.Encode(Model[i].ID) })%>
            </td>
        </tr>
        <%
            }
            
        %>
    </table>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
