<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Price>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
            $.validator.setDefaults();

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

            $($("form")).validate({
                rules: {
                    Price♂Name: {
                        required: true
                    }
                },
                messages: {
                    Price♂Name: {
                        required: "报价单号不能为空！"
                    }
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
            <li><a href="#tabs-1">发票信息</a></li>
            <li><a href="#tabs-2">商品信息</a></li>
            <li><a href="#tabs-3">商品包装信息</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
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
                    <%= Html.Hidden("Price♂ID", Html.Encode(Model.ID.ToString()))%>
                    <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                        报价单基本信息
                    </td>
                    <td align="right" style="width: 15%;">
                        报价单号：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Price♂Name",Html.Encode( Model.Name))%>
                    </td>
                    <td align="right" style="width: 15%;">
                        报价单日期：
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Price♂Date", Html.Encode(Model.Date), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        报价币种：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂CurrencyType", Html.Encode(Model.CurrencyType))%><a href="#"
                            onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                    </td>
                    <td align="right">
                        价格条款：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂PriceClause", Html.Encode(Model.PriceClause))%><a href="#"
                            onclick="LoadDictionaryPanel('价格条款',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        价格条款补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price♂PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Price♂ClauseType", Html.Encode(Model.ClauseType))%><a href="#"
                            onclick="LoadDictionaryPanel('付款方式',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        付款方式补充说明：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price♂ClauseTypeNote", Html.Encode(Model.ClauseTypeNote), new { style = "width:99%; height:40px;" })%>
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
                        <%= Html.TextBox("Price♂TansportCountry", Html.Encode(Model.TansportCountry))%>
                        <a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        起运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂StartHaven", Html.Encode(Model.StartHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        转运港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂TransferHaven", Html.Encode(Model.TransferHaven))%>
                        <a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                    <td align="right">
                        目的港口：
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price♂EdnHaven", Html.Encode(Model.EdnHaven))%>
                        <a href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        运输方式：
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Price♂TransportMode", Html.Encode(Model.TransportMode))%>
                        <a href="#" onclick="LoadDictionaryPanel('运输方式',true,this)">选择</a>
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
                        <%
                            if (Model.CustomerID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model.CustomerID);
                                if (obj != null)
                                {
                                    Response.Write(Html.TextBox("_Price♂CustomerID", obj.NameCode));
                                    Response.Write(Html.Hidden("Price♂CustomerID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_Price♂CustomerID"));
                                    Response.Write(Html.Hidden("Price♂CustomerID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_Price♂CustomerID"));
                                Response.Write(Html.Hidden("Price♂CustomerID"));
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
                                    Response.Write(Html.TextBox("_Price♂CompanyID", obj.Name));
                                    Response.Write(Html.Hidden("Price♂CompanyID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_Price♂CompanyID"));
                                    Response.Write(Html.Hidden("Price♂CompanyID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_Price♂CompanyID"));
                                Response.Write(Html.Hidden("Price♂CompanyID"));
                            }
                        %>
                        <%Response.Write("<a href='#'onclick=LoadControlList(this,'CompanyIndex')>选择</a>"); %>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        报价单类型：
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Price♂PriceType", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("报价单类型", Html.Encode(Model.PriceType)), "请选择")%>
                    </td>
                    <td align="right">
                        备注信息：
                    </td>
                    <td align="left">
                        <%= Html.TextArea("Price♂Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
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
                            viewdictionary2.Add("FK", "Price");//报价单信息
                            Html.RenderPartial("ProductSummaryControl", Model.ProductSummary.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- 商品信息 -->
        </table>
        <table class="list" width="100%" id="tabs-3">
            <caption>
                商品包装信息动态区域
            </caption>
            <% 
                Model.ProductPack.Load();
            %>
            <!-- 商品包装信息 -->
            <tr id="ProductPack♂" style="<%=Model.ProductPack.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <%
                        if (Model.ProductPack.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductPack.Count);
                            viewdictionary2.Add("FK", "Price");
                            Html.RenderPartial("ProductPackControl", Model.ProductPack.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- 商品包装信息 -->
        </table>
    </div>
    <%
        }
    %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary♂',1,'Price')"
        class="button">商品信息</a> <a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack♂',1,'Price')"
            class="button">商品包装</a>
</asp:Content>
