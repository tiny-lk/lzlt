<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitlePrice" ContentPlaceHolderID="TitleContent" runat="server">
    添加报价单
</asp:Content>
<asp:Content ID="MainPrice" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        function opengys(regionname, childobject, khtype, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { simple: true },
                url: '<%=Url.Action("ProductIndex","Shared")%>',
                success: function(data) {
                    addRelationcontrol(regionname, childobject, data, addid, url);
                },
                error: function() {
                    alert("添加表单数据失败！");
                }
            });
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_Price♂CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    selectFirst: false,
                    scrollHeight: 300,
                    dataType: 'json',
                    autoFill: false,
                    extraParams: { t: "Customer", f: "NameCode" },
                    parse: function(data) {
                        var rows = [];
                        $.each(data, function(i, o) {
                            rows[rows.length] = { data: o, value: i, result: o
                            };
                        }); return rows;
                    },
                    formatItem: function(row, i, n) {
                        return row;
                    }
                });

            $("input[name='_Price♂CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Price♂CustomerID']").val(formatted);
                }
            });

            $("input[name='_Price♂CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Price♂CustomerID']").val("");
                }
            });

            $("input[name='_Price♂CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    selectFirst: false,
                    scrollHeight: 300,
                    dataType: 'json',
                    autoFill: false,
                    extraParams: { t: "Company", f: "Name" },
                    parse: function(data) {
                        var rows = [];
                        $.each(data, function(i, o) {
                            rows[rows.length] = { data: o, value: i, result: o
                            };
                        }); return rows;
                    },
                    formatItem: function(row, i, n) {
                        return row;
                    }
                });

            $("input[name='_Price♂CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Price♂CompanyID']").val(formatted);
                }
            });

            $("input[name='_Price♂CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Price♂CompanyID']").val("");
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Price♂CurrencyType", "货币类型");
            autocompletedictionary("Price♂PriceClause", "价格条款");
            autocompletedictionary("Price♂ClauseType", "付款方式");
            autocompletedictionary("Price♂TansportCountry", "港口");
            autocompletedictionary("Price♂StartHaven", "港口");
            autocompletedictionary("Price♂TransferHaven", "港口");
            autocompletedictionary("Price♂EdnHaven", "港口");
            autocompletedictionary("Price♂TransportMode", "运输方式");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Price♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Price♂objectname" value="LZL.ForeignTrade.DataEntity.Price,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Price♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Price♂iseditdate", "EditDate")%>
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">报价单信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
            <li><a href="#tabs-3">商品包装信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                报价单信息</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="提 交" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                        报价单基本信息
                    </td>
                    <td align="right" style="width: 15%;">
                        报价单号：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Price♂Name", "", new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        报价单日期：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Price♂Date", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        报价币种：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                    </td>
                    <td align="right">
                        价格条款：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂PriceClause")%><a href="#" onclick="LoadDictionaryPanel('价格条款',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        价格条款补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price♂PriceClauseNote", new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Price♂ClauseType")%><a href="#" onclick="LoadDictionaryPanel('付款方式',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price♂ClauseTypeNote", new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" valign="middle">
                        运输情况
                    </td>
                    <td align="right">
                        运抵国：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂TansportCountry")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        起运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂StartHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        转运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂TransferHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        目的港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂EdnHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        运输方式：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Price♂TransportMode")%>
                        <a href="#" onclick="LoadDictionaryPanel('运输方式',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        商品信息统计汇总
                    </td>
                    <td align="right">
                        报价单类型：
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Price♂PriceType", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("报价单类型"), "请选择")%>
                    </td>
                    <td align="right">
                        总报价金额：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClauseQuote", "", new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        总包装数量：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClausePackNumber", "", new { validate = "digits:true" })%>
                    </td>
                    <td align="right">
                        包装单位（英文）：
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Price♂ClauseUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位"), "请选择")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        总毛重（KG）：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClauseWeight", "", new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        总净重（KG）：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClauseNetWeight", "", new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        总体积（CBM）：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClauseBulk", "", new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        商品总数量：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClauseNumber", "", new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        商品总单位：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClauseUnit")%>
                    </td>
                    <td align="right">
                        商品总数量<br />
                        （不同单位）：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂ClauseNotUnit")%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="2" valign="middle">
                        其它信息
                    </td>
                    <td align="right">
                        选择客户：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Price♂CustomerID")%><!-- "-"表示不被处理的值 -->
                        <%=Html.Hidden("Price♂CustomerID")%>
                        <% Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>选择</a>");%>
                    </td>
                    <td align="right">
                        公司简称：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Price♂CompanyID")%><!-- "-"表示不被处理的值 -->
                        <%= Html.Hidden("Price♂CompanyID")%>
                          <%Response.Write("<a href='#'onclick=LoadControlList(this,'CompanyIndex')>选择</a>"); %>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        备注信息：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price♂Note", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="提 交" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table width="100%" class="list" id="tabs-2">
            <caption>
                商品信息动态区域
            </caption>
            <!-- 商品信息 -->
            <tr id="ProductSummary♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 商品信息 -->
        </table>
        <table width="100%" class="list" id="tabs-3">
            <caption>
                商品包装信息动态区域
            </caption>
            <!-- 商品包装信息 -->
            <tr id="ProductPack♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 商品包装信息 -->
        </table>
    </div>
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary♂',1,'Price')"
        class="button">商品信息</a><a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack♂',1,'Price')"
            class="button">商品包装</a>
</asp:Content>
