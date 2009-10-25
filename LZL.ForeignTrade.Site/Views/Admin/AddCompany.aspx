<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加公司信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Company♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Company♂objectname" value="LZL.ForeignTrade.DataEntity.Company,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Company♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Company♂iseditdate", "EditDate")%>
    <table width="100%"  class="list">
        <caption>
            添加公司信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    公司简称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂Name","", new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    中文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂NameCH","", new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂NameEH","", new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    中文地址：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂AddressCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文地址：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂AddressEH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    邮政编码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂DakCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    电话：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂Phone")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    传真：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂Fax")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    网址：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂Internet","", new { validate = "url:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂Email","", new { validate = "email:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    开户银行：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Company♂Bank", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("银行类别",""), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    银行帐号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂BankCode","", new { validate = "creditcard:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    公司徽标：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂Badge")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    公司签章：
                </td>
                <td align="left">
                    <%= Html.TextBox("Company♂Logo")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Company♂Note","", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    是系统默认：
                </td>
                <td align="left" colspan="3">
                    <%= Html.CheckBox("Company♂IsSystem")%>
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
