<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Company>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    公司详细信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" class="list">
        <caption>
            公司详细信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Company♂ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td align="right">
                    公司简称：
                </td>
                <td align="left">
                    <%=Html.Encode(Model.Name)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    中文名称：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.NameCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Model.NameEH%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    中文地址：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.AddressCH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文地址：
                </td>
                <td align="left">
                    <%=  Html.Encode(Model.AddressEH)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    邮政编码：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.DakCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    电话：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Phone)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    传真：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Fax)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    网址：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Internet)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Email)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    开户银行：
                </td>
                <td align="left">
                    <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model.Bank))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    银行帐号：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.BankCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    公司徽标：
                </td>
                <td align="left">
                    <%=  Html.Encode(Model.Badge)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    公司签章：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Logo)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Note)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    是系统默认：
                </td>
                <td align="left">
                    <%= Html.CheckBox("Company♂IsSystem", Model.IsSystem.GetValueOrDefault())%>
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageCompany") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
