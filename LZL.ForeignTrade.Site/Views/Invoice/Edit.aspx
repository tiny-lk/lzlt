<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Invoice/Invoice.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Invoice>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    编辑发票（单证）信息
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

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
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">发票信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                发票（单据）信息</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="提 交" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="7" align="center" valign="middle" style="width: 10%;">
                        发票简介
                        <%= Html.Hidden("Invoice♂ID", Html.Encode(Model.ID.ToString()))%>
                    </td>
                    <td align="right" style="width: 15%;">
                        发票号：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice♂Name",Html.Encode( Model.Name), new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        发票日期：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice♂Date", Html.Encode(Model.Date.ToShortDateString()), new { validate = "date:true,required:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        出口合同号：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ExportContractsName", Html.Encode(Model.ExportContractsName))%>
                    </td>
                    <td align="right">
                        撤销单号：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂RevocationNo", Html.Encode(Model.RevocationNo))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        发票币种：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂CurrencyType", Html.Encode(Model.CurrencyType))%><a href="#"
                            onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                    </td>
                    <td align="right">
                        价格条款：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂PriceClause", Html.Encode(Model.PriceClause))%><a href="#"
                            onclick="LoadDictionaryPanel('价格条款',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        价格条款补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ClauseType", Html.Encode(Model.ClauseType))%><a href="#"
                            onclick="LoadDictionaryPanel('付款方式',true,this)">选择</a>
                    </td>
                    <td align="right">
                        贸易方式：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂Trade", Html.Encode(Model.Trade))%><a href="#" onclick="LoadDictionaryPanel('贸易方式',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂ClauseTypeNote", Html.Encode(Model.ClauseTypeNote), new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        选择客户：
                    </td>
                    <td align="left">
                        <%
                            if (Model.CustomerID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model.CustomerID);
                                if (obj != null)
                                {
                                    Response.Write(Html.TextBox("_Invoice♂CustomerID", obj.NameCode));
                                    Response.Write(Html.Hidden("Invoice♂CustomerID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_Invoice♂CustomerID"));
                                    Response.Write(Html.Hidden("Invoice♂CustomerID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_Invoice♂CustomerID"));
                                Response.Write(Html.Hidden("Invoice♂CustomerID"));
                            }
                            Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>选择</a>");
                        %>
                    </td>
                    <td align="right">
                        公司简称：
                    </td>
                    <td align="left">
                        <%
                            if (Model.CompanyID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCompany(Model.CompanyID);
                                if (obj != null)
                                {
                                    Response.Write(Html.TextBox("_Invoice♂CompanyID", obj.Name));
                                    Response.Write(Html.Hidden("Invoice♂CompanyID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_Invoice♂CompanyID"));
                                    Response.Write(Html.Hidden("Invoice♂CompanyID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_Invoice♂CompanyID"));
                                Response.Write(Html.Hidden("Invoice♂CompanyID"));
                            }
                        %>
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
                        <%= Html.TextBox("Invoice♂CreditCardNo", Html.Encode(Model.CreditCardNo))%>
                    </td>
                    <td align="right">
                        开证银行：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂AccountBank", Html.Encode(Model.AccountBank))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        开证日期：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂AccountDate", Html.Encode(Model.AccountDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        装运期限：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ShipmentDate", Html.Encode(Model.ShipmentDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        有效期限：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ValidDate", Html.Encode(Model.ValidDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        发票类型：
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Invoice♂Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("发票类型", Html.Encode(Model.Type)), "请选择")%>
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
                        <%= Html.TextBox("Invoice♂TansportCountry", Html.Encode(Model.TansportCountry))%><a
                            href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        起运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂StartHaven", Html.Encode(Model.StartHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        转运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TransferHaven", Html.Encode(Model.TransferHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        目的港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂EdnHaven", Html.Encode(Model.EdnHaven))%><a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        运输方式：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TransportMode", Html.Encode(Model.TransportMode))%><a href="#"
                            onclick="LoadDictionaryPanel('运输方式',true,this)">选择</a>
                    </td>
                    <td align="right">
                        运费支付：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂FreightPayment", Html.Encode(Model.FreightPayment))%><a
                            href="#" onclick="LoadDictionaryPanel('运费支付',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        分批：
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice♂IsBatches", Model.IsBatches)%>
                    </td>
                    <td align="right">
                        转运：
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice♂IsTransfer", Model.IsTransfer)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        唛头：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice♂Mark", Html.Encode(Model.Mark), new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        商品信息汇总
                    </td>
                    <td align="right">
                        总销售金额：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TotalSalesAmount", Html.Encode(Model.TotalSalesAmount), new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        总包装数量：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TotalPackAmount", Html.Encode(Model.TotalPackAmount), new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        英文包装单位：
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Invoice♂TotalPackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model.TotalPackUnitEN)), "请选择")%>
                    </td>
                    <td align="right">
                        包装毛重(KG)：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TotalPackGrossWeight", Html.Encode(Model.TotalPackGrossWeight), new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        包装净重(KG)：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TotalPackNetWeight", Html.Encode(Model.TotalPackNetWeight), new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        包装体积(CBM)：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TotalPackBulk", Html.Encode(Model.TotalPackBulk), new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        商品总数量：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TotalProductAmount", Html.Encode(Model.TotalProductAmount), new { validate = "digits:true" })%>
                    </td>
                    <td align="right">
                        商品总单位：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TotalUnit", Html.Encode(Model.TotalUnit))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        商品总数量(不同单位)：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Invoice♂TotalDifferentUnit", Html.Encode(Model.TotalDifferentUnit))%>
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
                        <%= Html.TextArea("Invoice♂Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
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
                        <%= Html.TextArea("Invoice♂InvoiceItem", Html.Encode(Model.InvoiceItem), new { style = "width:99%; height:60px;" })%>
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
                        <%= Html.TextArea("Invoice♂BoxItem", Html.Encode(Model.BoxItem), new { style = "width:99%; height:60px;" })%>
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
                        <%= Html.TextBox("Invoice♂OceanNo", Html.Encode(Model.OceanNo))%>
                    </td>
                    <td align="right">
                        提单日期：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanDate", Html.Encode(Model.OceanDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        托运人：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂Shipper", Html.Encode(Model.Shipper))%>
                    </td>
                    <td align="right">
                        收货人：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂Consignee", Html.Encode(Model.Consignee))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        通知人：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂CircularizeMan", Html.Encode(Model.CircularizeMan))%>
                    </td>
                    <td align="right">
                        收货地址：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂ReceivingAddress", Html.Encode(Model.ReceivingAddress))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        航班号：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂FlightNo", Html.Encode(Model.FlightNo))%>
                    </td>
                    <td align="right">
                        提单份数：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanCount", Html.Encode(Model.OceanCount), new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        运费支付：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanFreightPayment", Html.Encode(Model.OceanFreightPayment))%><a
                            href="#" onclick="LoadDictionaryPanel('运费支付',true,this)">选择</a>
                    </td>
                    <td align="right">
                        运费金额：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂FreightAmount", Html.Encode(Model.FreightAmount), new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        一程船名：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OneProcessName", Html.Encode(Model.OneProcessName))%>
                    </td>
                    <td align="right">
                        二程船名：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂TwoProcessName", Html.Encode(Model.TwoProcessName))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        代理：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanDeputy", Html.Encode(Model.OceanDeputy))%>
                    </td>
                    <td align="right">
                        运抵国：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanTansportCountry", Html.Encode(Model.OceanTansportCountry))%><a
                            href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        启运港：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanStartHaven", Html.Encode(Model.OceanStartHaven))%><a
                            href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        转运港：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice♂OceanEdnHaven", Html.Encode(Model.OceanEdnHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        目的港：
                    </td>
                    <td align="left" colspan="4">
                        <%= Html.TextBox("Invoice♂OceanTransferHaven", Html.Encode(Model.OceanTransferHaven))%><a
                            href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        提单备注：
                    </td>
                    <td align="left" colspan="4">
                        <%= Html.TextArea("Invoice♂OceanNote", Html.Encode(Model.OceanNote), new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <% 
                    Model.InvoiceExportContracts.Load();
                    if (Model.InvoiceExportContracts.Count > 0)
                    {
                        for (int i = 0; i < Model.InvoiceExportContracts.Count; i++)
                        {
                            Model.InvoiceExportContracts.ElementAt(i).ExportContractsReference.Load();
                        }
                    }
                %>
                <!-- 报价单信息 -->
                <tr id="InvoiceExportContracts♂" style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>;
                    text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            出口合同信息</center>
                        <!-- 标识子表添加总数 -->
                        <input type="hidden" value='<%= Model.InvoiceExportContracts.Count %>' name="InvoiceExportContracts♂regioncount"
                            id="InvoiceExportContracts♂regioncount" />
                        <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                        <input type="hidden" name="region" value="InvoiceExportContracts♂" />
                        <!-- 标识子表实体对象类 -->
                        <input type="hidden" name="InvoiceExportContracts♂objectname" value="LZL.ForeignTrade.DataEntity.InvoiceExportContracts,LZL.ForeignTrade.DataEntity" />
                        <!-- 多对多关系中 -->
                        <!-- 标识子表外键实体对象名称、外键字段名称 -->
                        <input type="hidden" name="InvoiceExportContracts♂fk" value='ExportContracts' />
                        <!-- 标识多对多关系表中（一） -->
                        <input type="hidden" name="InvoiceExportContracts♂pfk" value='Invoice' />
                        <fieldset style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>; width: 95%;">
                            <legend>出口合同信息</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                                <%
                                    for (int i = 0; i < Model.InvoiceExportContracts.Count(); i++)
                                    {
                                        var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                        var script = @"$(this).parent().remove();display('InvoiceExportContracts♂','ckhtxx')";
                                        Response.Write(string.Format(htmlstr,
                                            @"<input type='checkbox' name='ExportContracts♂ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() + "' />",
                                            Html.ActionLink(Model.InvoiceExportContracts.ElementAt(i).ExportContracts.Name, "Details", "ExportContracts", new { id = Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() }, null)));
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- 报价单信息 -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="提 交" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table class="list" width="100%" id="tabs-2">
            <caption>
                商品信息动态区域
            </caption>
            <%
                Model.ProductSummary.Load();
            %>
            <!-- 商品信息 -->
            <tr id="ProductSummary♂" style="<%=Model.ProductSummary.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <%
                        if (Model.ProductSummary.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductSummary.Count);
                            viewdictionary2.Add("FK", "Invoice");//报价单信息
                            Html.RenderPartial("ProductSummaryControl", Model.ProductSummary.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- 商品信息 -->
        </table>
    </div>
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openckht('InvoiceExportContracts♂','ExportContracts♂ID','ckhtxx','<%=Url.Action("Details","Price")%>');"
        class="button">出口合同</a> <a href="#" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary♂',1,'Invoice')"
            class="button">商品信息</a>
</asp:Content>
