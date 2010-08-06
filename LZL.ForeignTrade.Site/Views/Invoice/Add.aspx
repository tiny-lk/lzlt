<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Invoice/Invoice.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    添加单据信息
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

        function submitInfo() {
            $("#btnTj").click();
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_Invoice♂CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_Invoice♂CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Invoice♂CustomerID']").val(formatted);
                }
            });

            $("input[name='_Invoice♂CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Invoice♂CustomerID']").val("");
                }
            });

            $("input[name='_Invoice♂CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_Invoice♂CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Invoice♂CompanyID']").val(formatted);
                }
            });

            $("input[name='_Invoice♂CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Invoice♂CompanyID']").val("");
                }
            });

            //获取联动数据
            $("#Invoice♂Shipper").attr("title", "双击自动获取运算值"); //托运人
            $("#Invoice♂Consignee").attr("title", "双击自动获取运算值"); //收货人
            $("#Invoice♂OceanFreightPayment").attr("title", "双击自动获取运算值"); //运费支付
            $("#Invoice♂OceanTansportCountry").attr("title", "双击自动获取运算值"); //运抵国
            $("#Invoice♂OceanStartHaven").attr("title", "双击自动获取运算值"); //起运港
            $("#Invoice♂OceanTransferHaven").attr("title", "双击自动获取运算值"); //转运港
            $("#Invoice♂OceanEdnHaven").attr("title", "双击自动获取运算值"); //目的港

            $("#Invoice♂Shipper").bind("dblclick", function(thisObj) {
                $("#Invoice♂Shipper").val($("#_Invoice♂CompanyID").val());
            }); //托运人

            $("#Invoice♂Consignee").bind("dblclick", function(thisObj) {
                $("#Invoice♂Consignee").val($("#_Invoice♂CustomerID").val());
            }); //收货人

            $("#Invoice♂OceanFreightPayment").bind("dblclick", function(thisObj) {
                $("#Invoice♂OceanFreightPayment").val($("#Invoice♂FreightPayment").val());
            }); //运费支付

            $("#Invoice♂OceanTansportCountry").bind("dblclick", function(thisObj) {
                $("#Invoice♂OceanTansportCountry").val($("#Invoice♂TansportCountry").val());
            }); //运抵国

            $("#Invoice♂OceanStartHaven").bind("dblclick", function(thisObj) {
                $("#Invoice♂OceanStartHaven").val($("#Invoice♂StartHaven").val());
            }); //起运港

            $("#Invoice♂OceanTransferHaven").bind("dblclick", function(thisObj) {
                $("#Invoice♂OceanTransferHaven").val($("#Invoice♂TransferHaven").val());
            }); //转运港

            $("#Invoice♂OceanEdnHaven").bind("dblclick", function(thisObj) {
                $("#Invoice♂OceanEdnHaven").val($("#Invoice♂EdnHaven").val());
            }); //目的港

            //初始化点击事件
            $("#hrSpxx").click();
            $("#hrSpbz").click();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Invoice♂CurrencyType", "货币类型");
            autocompletedictionary("Invoice♂PriceClause", "价格条款");
            autocompletedictionary("Invoice♂ClauseType", "付款方式");
            autocompletedictionary("Invoice♂Trade", "贸易方式");
            autocompletedictionary("Invoice♂TansportCountry", "港口");
            autocompletedictionary("Invoice♂StartHaven", "港口");
            autocompletedictionary("Invoice♂TransferHaven", "港口");
            autocompletedictionary("Invoice♂EdnHaven", "港口");
            autocompletedictionary("Invoice♂TransportMode", "运输方式");
            autocompletedictionary("Invoice♂FreightPayment", "运费支付");
            autocompletedictionary("Invoice♂OceanFreightPayment", "运输方式");
            autocompletedictionary("Invoice♂OceanTansportCountry", "港口");
            autocompletedictionary("Invoice♂OceanStartHaven", "港口");
            autocompletedictionary("Invoice♂OceanEdnHaven", "港口");
            autocompletedictionary("Invoice♂OceanTransferHaven", "港口");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Invoice♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Invoice♂objectname" value="LZL.ForeignTrade.DataEntity.Invoice,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Invoice♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Invoice♂iseditdate", "EditDate")%>
    <table cellpadding="0" cellspacing="0" border="0" align="center" width="60%">
        <tr>
            <td align="center" style="font-size: 14px">
                <span id="addnews" style="font-weight: bold; color: blue">1. 添加单证信息 </span>————
                2. 阅读(修改)单证信息
            </td>
        </tr>
    </table>
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">发票信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
                发票（单据）信息</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="7" align="center" valign="middle" style="width: 10%;">
                        发票简介
                    </td>
                    <td align="right" style="width: 15%;">
                        发票号：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice♂Name", "", new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        发票日期：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice♂Date", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        出口合同号：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ExportContractsName")%>
                        <% Response.Write("<a href='#'onclick=LoadControlList(this,'ExportContractsIndex')>选择</a>");%>
                    </td>
                    <td align="right">
                        撤销单号：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂RevocationNo")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        发票币种：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                    </td>
                    <td align="right">
                        价格条款：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂PriceClause")%><a href="#" onclick="LoadDictionaryPanel('价格条款',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        价格条款补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂PriceClauseNote", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ClauseType")%><a href="#" onclick="LoadDictionaryPanel('付款方式',true,this)">选择</a>
                    </td>
                    <td align="right">
                        贸易方式：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂Trade")%><a href="#" onclick="LoadDictionaryPanel('贸易方式',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂ClauseTypeNote", new { style = "width:99%; height:40px;" })%>
                    </td>
                    <%-- <td align="right">
                        发票类型：
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Invoice♂Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("发票类型"), "请选择")%>
                    </td>--%>
                </tr>
                <tr>
                    <td align="right">
                        选择客户：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Invoice♂CustomerID")%><!-- "-"表示不被处理的值 -->
                        <%=Html.Hidden("Invoice♂CustomerID")%>
                        <% Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>选择</a>");%>
                    </td>
                    <td align="right">
                        公司简称：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Invoice♂CompanyID")%><!-- "-"表示不被处理的值 -->
                        <%= Html.Hidden("Invoice♂CompanyID")%>
                        <%Response.Write("<a href='#'onclick=LoadControlList(this,'CompanyIndex')>选择</a>"); %>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" valign="middle">
                        信用证信息
                    </td>
                    <td align="right">
                        信用证号：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂CreditCardNo")%>
                    </td>
                    <td align="right">
                        开证银行：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂AccountBank")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        开证日期：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂AccountDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        装运期限：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ShipmentDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        有效期限：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ValidDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        信用证金额：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂CreditAmount", "", new { validate = "number:true" })%>万元
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        运输信息
                    </td>
                    <td align="right">
                        运抵国：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TansportCountry")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        起运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂StartHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        转运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TransferHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        目的港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂EdnHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        运输方式：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TransportMode")%><a href="#" onclick="LoadDictionaryPanel('运输方式',true,this)">选择</a>
                    </td>
                    <td align="right">
                        运费支付：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂FreightPayment")%><a href="#" onclick="LoadDictionaryPanel('运费支付',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        分批：
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice♂IsBatches",false)%>
                    </td>
                    <td align="right">
                        转运：
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice♂IsTransfer",false)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        唛头：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂Mark", new { style = "width:99%; height:40px;" })%>
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
                        <%= Html.TextArea("Invoice♂Note", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="center">
                        单证条款
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        发票
                    </td>
                    <td align="right">
                        发票条款：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂InvoiceItem", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        装箱单
                    </td>
                    <td align="right">
                        装箱单条款：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂BoxItem", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="9" valign="middle">
                        海运提单
                    </td>
                    <td align="right">
                        提单号码：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanNo")%>
                    </td>
                    <td align="right">
                        提单日期：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        托运人：
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice♂Shipper")%>
                    </td>
                    <td align="right" style="font-weight: bold;">
                        收货人：
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice♂Consignee")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        通知人：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂CircularizeMan")%>
                    </td>
                    <td align="right">
                        收货地址：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ReceivingAddress")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        航班号：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂FlightNo")%>
                    </td>
                    <td align="right">
                        提单份数：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanCount", "", new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        运费支付：
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice♂OceanFreightPayment")%><a href="#" onclick="LoadDictionaryPanel('运费支付',true,this)">选择</a>
                    </td>
                    <td align="right">
                        运费金额：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂FreightAmount", "", new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        一程船名：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OneProcessName")%>
                    </td>
                    <td align="right">
                        二程船名：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TwoProcessName")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        代理：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanDeputy")%>
                    </td>
                    <td align="right" style="font-weight: bold;">
                        运抵国：
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice♂OceanTansportCountry")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        起运港：
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice♂OceanStartHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right" style="font-weight: bold;">
                        转运港：
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice♂OceanEdnHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        目的港：
                    </td>
                    <td align="left" colspan="4" style="background-color: Silver">
                        <%= Html.TextBox("Invoice♂OceanTransferHaven")%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        提单备注：
                    </td>
                    <td align="left" colspan="4">
                        <%= Html.TextArea("Invoice♂OceanNote", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <!-- 报价单信息 -->
                <tr id="InvoiceExportContracts♂" style="display: none; text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            出口合同信息</center>
                        <!-- 标识子表添加总数 -->
                        <input type="hidden" value='0' name="InvoiceExportContracts♂regioncount" id="InvoiceExportContracts♂regioncount" />
                        <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                        <input type="hidden" name="region" value="InvoiceExportContracts♂" />
                        <!-- 标识子表实体对象类 -->
                        <input type="hidden" name="InvoiceExportContracts♂objectname" value="LZL.ForeignTrade.DataEntity.InvoiceExportContracts,LZL.ForeignTrade.DataEntity" />
                        <!-- 多对多关系中 -->
                        <!-- 标识子表外键实体对象名称、外键字段名称 -->
                        <input type="hidden" name="InvoiceExportContracts♂fk" value='ExportContracts' />
                        <!-- 标识多对多关系表中（一） -->
                        <input type="hidden" name="InvoiceExportContracts♂pfk" value='Invoice' />
                        <fieldset style="display: none; width: 95%;">
                            <legend>出口合同信息</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- 报价单信息 -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" style="display: none" class="button" id="btnTj" value="提 交" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table width="100%" id="tabs-2">
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
    </div>
    <%
        }
    %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openckht('InvoiceExportContracts♂','ExportContracts♂ID','ckhtxx','<%=Url.Action("Details","Price")%>');"
        class="button4">关联出口合同</a> <a href="#" id="hrSpxx" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary♂',1,'Invoice')"
            class="button4" style="display: none">添加商品信息</a><a href="#" id="hrSpbz" onclick="addcontrol(this,'ProductPackControl','ProductPack♂',1,'Invoice')"
                class="button4" style="display: none">添加商品包装</a> <a href="#" onclick='submitInfo();'
                    class="button4">数据整体提交</a>
</asp:Content>
