<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加客户信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <h2>
        添加客户信息</h2>
    <% using (Html.BeginForm())
       { %>
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:history.back(1);" />
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="7" align="center" valign="middle">
                    客户基本信息
                </td>
                <td align="right">
                    客户代码（简称）：
                </td>
                <td align="left">
                    <%= Html.TextBox("khdmjc")%>
                </td>
                <td align="right">
                    中文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("zwmc")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("ywmc")%>
                </td>
                <td align="right">
                    英文地址：
                </td>
                <td align="left">
                    <%= Html.TextBox("ywdz")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    国家：
                </td>
                <td align="left">
                    <%= Html.TextBox("gj")%>
                </td>
                <td align="right">
                    省份（州）：
                </td>
                <td align="left">
                    <%= Html.TextBox("sf")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    城市：
                </td>
                <td align="left">
                    <%= Html.TextBox("cs")%>
                </td>
                <td align="right">
                    编码：
                </td>
                <td align="left">
                    <%= Html.TextBox("yzbm")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    电话号码：
                </td>
                <td align="left">
                    <%= Html.TextBox("dhhm")%>
                </td>
                <td align="right">
                    传真号码：
                </td>
                <td align="left">
                    <%= Html.TextBox("czhm")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    网站：
                </td>
                <td align="left">
                    <%= Html.TextBox("wzdz")%>
                </td>
                <td align="right">
                    客户类别：
                </td>
                <td align="left">
                    <%= Html.TextBox("khlb")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("bz", new { style = "width:99%; height:80px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" valign="middle">
                    财务信息
                </td>
                <td align="right">
                    开户银行：
                </td>
                <td align="left">
                    <%= Html.TextBox("kfhy")%>
                </td>
                <td align="right">
                    账&nbsp;&nbsp;&nbsp;&nbsp;户：
                </td>
                <td align="left">
                    <%= Html.TextBox("yhzh")%>
                </td>
            </tr>
            <!-- 联系人区域 -->
            <tr id="lxr★" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 联系人区域 -->
            <!-- 备忘录区域 -->
            <tr id="bwl★" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 备忘录区域 -->
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:history.back(1);" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="addcontrol(this,'LinkManControl','lxr★')">添加联系人信息</a></li>
    <li><a href="#" onclick="addcontrol(this,'MemorandumControl','bwl★')">备忘录</a></li>
</asp:Content>
