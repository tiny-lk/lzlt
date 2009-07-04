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
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Customer♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Customer♂objectname" value="LZL.ForeignTrade.DataEntity.Customer,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="8" align="center" valign="middle">
                    客户基本信息
                </td>
                <td align="right">
                    客户代码（简称）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂NameCode")%>
                </td>
                <td align="right">
                    中文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂NameCn")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂NameEn")%>
                </td>
                <td align="right">
                    地 址：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂Address")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文地址：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂AddressEn")%>
                </td>
                <td align="right">
                    是共享数据：
                </td>
                <td align="left">
                    <%= Html.CheckBox("Customer♂IsShare",false)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    国家：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂Country")%>
                </td>
                <td align="right">
                    省份（州）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂Province")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    城市：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂City")%>
                </td>
                <td align="right">
                    邮政编码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂DakCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    电话号码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂Phone")%>
                </td>
                <td align="right">
                    传真号码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂Fax")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    网站：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂Internet")%>
                </td>
                <td align="right">
                    客户类别：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂TypeCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Customer♂Note", new { style = "width:99%; height:80px;" })%>
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
                    <%= Html.TextBox("Customer♂Bank")%>
                </td>
                <td align="right">
                    账&nbsp;&nbsp;&nbsp;&nbsp;户：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂BankCode")%>
                </td>
            </tr>
            <!-- 联系人区域 -->
            <tr id="LinkMan♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 联系人区域 -->
            <!-- 备忘录区域 -->
            <tr id="Memorandum♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="addcontrol(this,'LinkManControl','LinkMan♂',1)">添加联系人信息</a></li>
    <li><a href="#" onclick="addcontrol(this,'MemorandumControl','Memorandum♂',1)">备忘录</a></li>
</asp:Content>
