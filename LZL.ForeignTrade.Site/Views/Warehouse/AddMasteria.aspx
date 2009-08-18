<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加原材料
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        添加原材料</h2>
    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Masteria♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Masteria♂objectname" value="LZL.ForeignTrade.DataEntity.MasteriaBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    原材料编号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂YclNo")%>
                </td>
                <td align="right">
                    原材料类别：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂YclType")%>
                </td>
                <td align="right">
                    原材料成分：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂YclCf")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    原材料重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂BWeight")%>
                </td>
                <td align="right">
                    原材料颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂BColor")%>
                </td>
                <td align="right">
                    原材料数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂BCount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    原材料单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂BPrice")%>
                </td>
                <td align="right">
                    原材料缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂Bgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right">
                    罗纹重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂LwWeight")%>
                </td>
                <td align="right">
                    罗纹颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂LwColor")%>
                </td>
                <td align="right">
                    罗纹数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂LwCount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    罗纹单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂LwPrice")%>
                </td>
                <td align="right">
                    罗纹缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂Lwgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right">
                    松片重量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂SpWeight")%>
                </td>
                <td align="right">
                    松片颜色：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂SpColor")%>
                </td>
                <td align="right">
                    松片数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂SpCount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    松片单价：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂SpPrice")%>
                </td>
                <td align="right">
                    松片缸号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Masteria♂Spgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
