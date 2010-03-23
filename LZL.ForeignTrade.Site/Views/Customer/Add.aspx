<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/Customer.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加客户信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Customer♂Province", "省州");
            autocompletedictionary("Customer♂City", "城市");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Customer♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Customer♂objectname" value="LZL.ForeignTrade.DataEntity.Customer,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Customer♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Customer♂iseditdate", "EditDate")%>
    <table width="100%"  class="list">
        <caption>
            添加客户信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="8" align="center" valign="middle" style="width: 10%;">
                    客户基本信息
                </td>
                <td align="right" style="width: 15%;">
                    客户代码（简称）：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Customer♂NameCode", "", new { validate = "required:true"})%>
                </td>
                <td align="right" style="width: 15%;">
                    中文名称：
                </td>
                <td align="left" style="width: 30%;">
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
                    <% =Html.CheckBox("Customer♂IsShare")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    国家：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Customer♂Country", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("国家"), "请选择")%>
                </td>
                <td align="right">
                    省份（州）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂Province")%><a href="#" onclick="LoadDictionaryPanel('省州',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    城市：
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer♂City")%><a href="#" id="test" onclick="LoadDictionaryPanel('城市',true,this)">选择</a>
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
                    <%= Html.TextBox("Customer♂Internet", "", new { validate = "url:true" })%>
                </td>
                <td align="right">
                    客户类别：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Customer♂TypeCode", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("客户类型"), new { validate = "required:true" })%>
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
                <td align="center" valign="middle" rowspan="2">
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
                    <%= Html.TextBox("Customer♂BankCode", "", new { validate = "creditcard:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    开户银行地址：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Customer♂BankAddress")%>
                </td>
            </tr>
            <!-- 联系人区域 -->
            <tr id="Linkman♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 联系人区域 -->
            <!-- 备忘录区域 -->
            <tr id="Memorandum♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 备忘录区域 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'LinkmanControl','Linkman♂',1,'Customer')" class="button4">
        添加联系人</a> <a href="#" onclick="addcontrol(this,'MemorandumControl','Memorandum♂',1,'Customer')"
            class="button4">添加备忘录</a>
</asp:Content>
