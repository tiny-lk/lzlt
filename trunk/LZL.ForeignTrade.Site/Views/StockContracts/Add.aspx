<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StockContracts/StockContracts.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    添加采购合同信息
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        function openckht(regionname, childobject, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { simple: true },
                url: '<%=Url.Action("ExportContractsIndex","Shared")%>',
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
        
        function submitInfo() {
            $("#btnTj").click();
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_StockContracts♂CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_StockContracts♂CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='StockContracts♂CustomerID']").val(formatted);
                }
            });

            $("input[name='_StockContracts♂CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='StockContracts♂CustomerID']").val("");
                }
            });

            $("input[name='_StockContracts♂CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_StockContracts♂CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='StockContracts♂CompanyID']").val(formatted);
                }
            });

            $("input[name='_StockContracts♂CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='StockContracts♂CompanyID']").val("");
                }
            });

            //初始化点击事件
            $("#hrSpxx").click();
            $("#hrSpbz").click();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("StockContracts♂CurrencyType", "货币类型");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="StockContracts♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="StockContracts♂objectname" value="LZL.ForeignTrade.DataEntity.StockContracts,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("StockContracts♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("StockContracts♂iseditdate", "EditDate")%>
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">采购合同信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
            <li><a href="#tabs-3">商品包装信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                采购合同信息</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" style="display:none" class="button" id="btnTj" value="提 交" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                        采购合同简介
                    </td>
                    <td align="right" style="width: 15%;">
                        采购合同号：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("StockContracts♂Name", "", new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        采购合同签约日期：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("StockContracts♂Date", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        选择客户：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_StockContracts♂CustomerID")%><!-- "-"表示不被处理的值 -->
                        <%=Html.Hidden("StockContracts♂CustomerID")%>
                        <% Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>选择</a>");%>
                    </td>
                    <td align="right">
                        公司简称：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_StockContracts♂CompanyID")%><!-- "-"表示不被处理的值 -->
                        <%= Html.Hidden("StockContracts♂CompanyID")%>
                        <%Response.Write("<a href='#'onclick=LoadControlList(this,'CompanyIndex')>选择</a>"); %>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        合同类别：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.DropDownList("StockContracts♂Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("采购合同类型"), "请选择")%>
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
                        <%= Html.TextArea("StockContracts♂Note", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="2" valign="middle">
                        费用类条款
                    </td>
                    <td align="right">
                        合同币种：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("StockContracts♂CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                    </td>
                    <td align="right">
                        付款日期：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("StockContracts♂SubmitDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("StockContracts♂PriceClauseNote", new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" valign="middle">
                        运输类条款
                    </td>
                    <td align="right">
                        交货日期：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("StockContracts♂ConsignmentDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        交货地点：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("StockContracts♂ConsignmentAddress")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        唛头：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("StockContracts♂Mark", new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        包装要求：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("StockContracts♂PackRequire", new { style = "width:99%; height:40px;" })%>
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
                        <%= Html.TextArea("StockContracts♂ComprehensiveConvention", new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <!-- 出口合同信息 -->
                <tr id="StockContractsExportContracts♂" style="display: none; text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            出口合同信息</center>
                        <!-- 标识子表添加总数 -->
                        <input type="hidden" value='0' name="StockContractsExportContracts♂regioncount" id="StockContractsExportContracts♂regioncount" />
                        <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                        <input type="hidden" name="region" value="StockContractsExportContracts♂" />
                        <!-- 标识子表实体对象类 -->
                        <input type="hidden" name="StockContractsExportContracts♂objectname" value="LZL.ForeignTrade.DataEntity.StockContractsExportContracts,LZL.ForeignTrade.DataEntity" />
                        <!-- 多对多关系中 -->
                        <!-- 标识子表外键实体对象名称、外键字段名称 -->
                        <input type="hidden" name="StockContractsExportContracts♂fk" value='ExportContracts' />
                        <!-- 标识多对多关系表中（一） -->
                        <input type="hidden" name="StockContractsExportContracts♂pfk" value='StockContracts' />
                        <fieldset style="display: none; width: 95%;">
                            <legend>出口合同信息</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- 出口合同信息 -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table width="100%" class="list" id="tabs-2">
            <caption>
                商品信息
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
                商品包装信息
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
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openckht('StockContractsExportContracts♂','ExportContracts♂ID','ckhtxx','<%=Url.Action("Details","ExportContracts")%>');"
        class="button4">关联出口合同</a> 
        <a href="#" id="hrSpxx" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary♂',1,'StockContracts')"
            class="button4"  style="display:none">添加商品信息</a> <a href="#" id="hrSpbz" onclick="addcontrol(this,'ProductPackControl','ProductPack♂',1,'StockContracts')"
                class="button4"  style="display:none">添加商品包装</a>
                <a href="#" onclick='submitInfo();' class="button4">数据整体提交</a>
</asp:Content>
