<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitlePrice" ContentPlaceHolderID="TitleContent" runat="server">
    添加报价单
</asp:Content>
<asp:Content ID="MainPrice" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/ui/ui.draggable.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.bgiframe.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/ui/ui.dialog.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

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

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Price♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Price♂objectname" value="LZL.ForeignTrade.DataEntity.Price,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            商品信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle">
                    报价单基本信息
                </td>
                <td align="right" style="width: 20%;">
                    报价单号：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂Name")%>
                </td>
                <td align="right" style="width: 20%;">
                    报价单日期：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂Date")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    报价币种：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂CurrencyType")%>
                </td>
                <td align="right">
                    价格条款：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂PriceClause")%>
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
                    <%= Html.TextBox("Price♂ClauseType")%>
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
                    <%= Html.TextBox("Price♂TansportCountry")%>
                </td>
                <td align="right">
                    起运港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂StartHaven")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    转运港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂EdnHaven")%>
                </td>
                <td align="right">
                    目的港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂TransportMode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    运输方式：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Price♂TransportMode")%>
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
                    <%= Html.TextBox("Price♂PriceType")%>
                </td>
                <td align="right">
                    总报价金额：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseQuote")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总包装数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClausePackNumber")%>
                </td>
                <td align="right">
                    包装单位（英文）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseUnitEN")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总毛重（KG）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseWeight")%>
                </td>
                <td align="right">
                    总净重（KG）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseNetWeight")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总体积（CBM）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseBulk")%>
                </td>
                <td align="right">
                    商品总数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseNumber")%>
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
                </td>
                <td align="right">
                    公司简称：
                </td>
                <td align="left">
                    <%= Html.TextBox("_Price♂CompanyID")%><!-- "-"表示不被处理的值 -->
                    <%= Html.Hidden("Price♂CompanyID")%>
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
            <!-- 产品信息 -->
            <tr id="PriceProduct♂" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        关联客户信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='0' name="PriceProduct♂regioncount" id="PriceProduct♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="PriceProduct♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="PriceProduct♂objectname" value="LZL.ForeignTrade.DataEntity.PriceProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="PriceProduct♂fk" value='Product' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="PriceProduct♂pfk" value='Price' />
                    <fieldset style="display: none; width: 95%;">
                        <legend>商品信息</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 产品信息 -->
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
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="opengys('PriceProduct♂','Product♂ID','01','spxx','<%=Url.Action("Details","Product")%>');">
        关联商品信息</a></li>
</asp:Content>
