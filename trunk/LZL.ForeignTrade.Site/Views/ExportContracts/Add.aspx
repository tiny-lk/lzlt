<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ExportContracts/ExportContracts.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加出口合同信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        function openbjd(regionname, childobject, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { simple: true },
                url: '<%=Url.Action("PriceIndex","Shared")%>',
                success: function(data) {
                    addRelationcontrol(regionname, childobject, data, null, url);
                },
                error: function() {
                    alert("添加表单数据失败！");
                }
            });
        }
        function openspxx(regionname, childobject, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { simple: true },
                url: '<%=Url.Action("ProductIndex","Shared")%>',
                success: function(data) {
                    addRelationcontrol(regionname, childobject, data, null, url);
                },
                error: function() {
                    alert("添加表单数据失败！");
                }
            });
        }
        
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_ExportContracts♂CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_ExportContracts♂CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='ExportContracts♂CustomerID']").val(formatted);
                }
            });

            $("input[name='_ExportContracts♂CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='ExportContracts♂CustomerID']").val("");
                }
            });

            $("input[name='_ExportContracts♂CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_ExportContracts♂CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='ExportContracts♂CompanyID']").val(formatted);
                }
            });

            $("input[name='_ExportContracts♂CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='ExportContracts♂CompanyID']").val("");
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("ExportContracts♂CurrencyType", "货币类型");
            autocompletedictionary("ExportContracts♂PriceClause", "价格条款");
            autocompletedictionary("ExportContracts♂ClauseType", "付款方式");
            autocompletedictionary("ExportContracts♂TansportCountry", "港口");
            autocompletedictionary("ExportContracts♂StartHaven", "港口");
            autocompletedictionary("ExportContracts♂EdnHaven", "港口");
            autocompletedictionary("ExportContracts♂TransferHaven", "港口");
            autocompletedictionary("ExportContracts♂TransportMode", "运输方式");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="ExportContracts♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="ExportContracts♂objectname" value="LZL.ForeignTrade.DataEntity.ExportContracts,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("ExportContracts♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("ExportContracts♂iseditdate", "EditDate")%>
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            出口合同信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                    出口合同简介
                </td>
                <td align="right" style="width: 15%;">
                    出口合同号：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("ExportContracts♂Name", "", new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    出口合同签约日期：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("ExportContracts♂Date", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    客户订单号：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂CustomerNo")%>
                </td>
                <td align="right">
                    合同类别：
                </td>
                <td align="left">
                    <%= Html.DropDownList("ExportContracts♂Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("出口合同类型"), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    选择客户：
                </td>
                <td align="left">
                    <%= Html.TextBox("_ExportContracts♂CustomerID")%><!-- "-"表示不被处理的值 -->
                    <%=Html.Hidden("ExportContracts♂CustomerID")%>
                </td>
                <td align="right">
                    公司简称：
                </td>
                <td align="left">
                    <%= Html.TextBox("_ExportContracts♂CompanyID")%><!-- "-"表示不被处理的值 -->
                    <%= Html.Hidden("ExportContracts♂CompanyID")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="1" valign="middle">
                    其它信息
                </td>
                <td align="right">
                    备注信息：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂Note", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="5" valign="middle">
                    费用类条款
                </td>
                <td align="right">
                    合同币种：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                </td>
                <td align="right">
                    价格条款：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂PriceClause")%><a href="#" onclick="LoadDictionaryPanel('价格条款',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    价格条款补充说明：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂PriceClauseNote", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    付款方式：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("ExportContracts♂ClauseType")%><a href="#" onclick="LoadDictionaryPanel('付款方式',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    付款方式补充说明：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂ClauseTypeNote", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    信用证交付期限：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂SubmitDate", "", new { validate = "date:true", Class = "calendar" })%>
                </td>
                <td align="right">
                    投保险别：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂PolicyType")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="6" valign="middle">
                    运输类条款
                </td>
                <td align="right">
                    运抵国：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TansportCountry")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
                <td align="right">
                    起运港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂StartHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    转运港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TransferHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
                <td align="right">
                    目的港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂EdnHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    运输方式：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TransportMode")%><a href="#" onclick="LoadDictionaryPanel('运输方式',true,this)">选择</a>
                </td>
                <td align="right">
                    出运日期：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂ShipmentDate", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    允差（百分比）：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("ExportContracts♂ErrorValue", "", new { validate = "digits:true,min:0,max:100" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    唛头：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂Mark", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装要求：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂PackRequire", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="1" valign="middle">
                    其它条款
                </td>
                <td align="right">
                    合同综合条款：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂ComprehensiveConvention", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <!-- 商品包装信息 -->
            <tr id="ProductPack♂" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- 商品包装信息 -->
            
            <!-- 报价单信息 -->
            <tr id="ExportContractsPrice♂" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        报价单信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='0' name="ExportContractsPrice♂regioncount" id="ExportContractsPrice♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="ExportContractsPrice♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="ExportContractsPrice♂objectname" value="LZL.ForeignTrade.DataEntity.ExportContractsPrice,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="ExportContractsPrice♂fk" value='Price' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="ExportContractsPrice♂pfk" value='ExportContracts' />
                    <fieldset style="display: none; width: 95%;">
                        <legend>报价单信息</legend>
                        <ul id="bjdxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 报价单信息 -->
            <!-- 商品信息 -->
            <tr id="ExportContractsProduct♂" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        商品信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='0' name="ExportContractsProduct♂regioncount" id="ExportContractsProduct♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="ExportContractsProduct♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="ExportContractsProduct♂objectname" value="LZL.ForeignTrade.DataEntity.ExportContractsProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="ExportContractsProduct♂fk" value='Product' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="ExportContractsProduct♂pfk" value='ExportContracts' />
                    <fieldset style="display: none; width: 95%;">
                        <legend>商品信息</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 商品信息 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openbjd('ExportContractsPrice♂','Price♂ID','bjdxx','<%=Url.Action("Details","Price")%>');"
        class='button'>报价信息</a> <a href="#" onclick="openspxx('ExportContractsProduct♂','Product♂ID','spxx','<%=Url.Action("Details","Product")%>');"
            class='button'>商品信息</a> <a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack♂',1,'ExportContracts')"
                class="button">商品包装</a>
</asp:Content>
