<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/Customer.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    客户详细信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        客户详细信息</h2>

    <script type="text/javascript">
        function print() {
            $("table > thead").printArea("<table width='100%'></table>");
        }
    </script>

    <table width="100%">
        <thead>
            <tr>
                <td rowspan="8" align="center" valign="middle" style="width: 20%;">
                    客户基本信息
                </td>
                <td align="right" style="width: 20%;">
                    客户代码（简称）：
                </td>
                <td align="left" style="width: 20%;">
                    <%= Html.Encode( Model.NameCode)%>
                </td>
                <td align="right" style="width: 20%;">
                    中文名称：
                </td>
                <td align="left" style="width: 20%;">
                    <%= Html.Encode(Model.NameCn)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.NameEn)%>
                </td>
                <td align="right">
                    地 址：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Address)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文地址：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.AddressEn)%>
                </td>
                <td align="right">
                    是共享数据：
                </td>
                <td align="left">
                    <%= Html.CheckBox("Customer♂IsShare", Model.IsShare)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    国家：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Country)%>
                </td>
                <td align="right">
                    省份（州）：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Province)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    城市：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.City)%>
                </td>
                <td align="right">
                    邮政编码：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.DakCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    电话号码：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Phone)%>
                </td>
                <td align="right">
                    传真号码：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Fax)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    网站：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.Internet)%>
                </td>
                <td align="right">
                    客户类别：
                </td>
                <td align="left">
                    <%= Html.Encode(Model.TypeCode)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注：
                </td>
                <td align="left" colspan="3" style="width: 99%;">
                    <%= Html.Encode( Model.Note)%>
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
                    <%= Html.Encode(Model.Bank)%>
                </td>
                <td align="right">
                    账&nbsp;&nbsp;&nbsp;&nbsp;户：
                </td>
                <td align="left">
                    <%= Html.Encode( Model.BankCode)%>
                </td>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="打 印" onclick="print();" />
                    <input type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
