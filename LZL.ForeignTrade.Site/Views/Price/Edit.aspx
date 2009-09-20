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
    <table width="100%">
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
                <td align="center" rowspan="5" valign="middle">
                    商品信息统计汇总
                </td>
                <td align="right">
                    报价单类型：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Price♂PriceType", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("报价单类型", Html.Encode(Model.PriceType)), "请选择")%>
                </td>
                <td align="right">
                    总报价金额：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseQuote", Html.Encode(Model.ClauseQuote), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总包装数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClausePackNumber", Html.Encode(Model.ClausePackNumber), new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    包装单位（英文）：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Price♂ClauseUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model.ClauseUnitEN)), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总毛重（KG）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseWeight", Html.Encode(Model.ClauseWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    总净重（KG）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseNetWeight", Html.Encode(Model.ClauseNetWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    总体积（CBM）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseBulk", Html.Encode(Model.ClauseBulk), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    商品总数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseNumber", Html.Encode(Model.ClauseNumber), new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品总单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseUnit", Html.Encode(Model.ClauseUnit))%>
                </td>
                <td align="right">
                    商品总数量<br />
                    （不同单位）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Price♂ClauseNotUnit", Html.Encode(Model.ClauseNotUnit))%>
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
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注信息：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Price♂Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <% 
                Model.PriceProduct.Load();
                if (Model.PriceProduct.Count > 0)
                {
                    for (int i = 0; i < Model.PriceProduct.Count; i++)
                    {
                        Model.PriceProduct.ElementAt(i).ProductReference.Load();
                    }
                }
            %>
            <!-- 产品信息 -->
            <tr id="PriceProduct♂" style="text-align: left; <%=Model.PriceProduct.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        关联客户信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='<%= Model.PriceProduct.Count %>' name="PriceProduct♂regioncount"
                        id="PriceProduct♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="PriceProduct♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="PriceProduct♂objectname" value="LZL.ForeignTrade.DataEntity.PriceProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="PriceProduct♂fk" value='Product' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="PriceProduct♂pfk" value='Price' />
                    <fieldset style="width: 95%; <%=Model.PriceProduct.Count>0?"": "display: none"%>;">
                        <legend>商品信息</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.PriceProduct.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('PriceProduct♂','spxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Product♂ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.PriceProduct.ElementAt(i).Product.ID.ToString() + "' />",
                                        Html.ActionLink(Model.PriceProduct.ElementAt(i).Product.NameCode, "Details", "Product", new { id = Model.PriceProduct.ElementAt(i).Product.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 产品信息 -->
            <!-- 商品包装信息 -->
            <tr id="ProductPack♂" style="display: none;">
                <td colspan="5">
                    <%
                        Model.ProductPack.Load();
                        if (Model.ProductPack.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductPack.Count);
                            viewdictionary2.Add("FK", "Price");//报价单信息
                            Html.RenderPartial("ProductPackControl", Model.ProductPack.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- 商品包装信息 -->
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
        }
    %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="opengys('PriceProduct♂','Product♂ID','01','spxx','<%=Url.Action("Details","Product")%>');"
        class="button">商品信息</a> <a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack♂',1,'Price')"
            class="button">商品包装</a>
</asp:Content>
