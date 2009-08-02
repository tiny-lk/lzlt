<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ExportContracts/ExportContracts.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.ExportContracts>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑出口合同信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

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
                <%= Html.Hidden("ExportContracts♂ID", Html.Encode(Model.ID.ToString()))%>
                <td align="right" style="width: 15%;">
                    出口合同号：
                </td>
                <td align="left"  style="width:30%;">
                    <%= Html.TextBox("ExportContracts♂Name",Html.Encode( Model.Name), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    出口合同签约日期：
                </td>
                <td align="left"  style="width:30%;">
                    <%= Html.TextBox("ExportContracts♂Date", Html.Encode(Model.Date.ToShortDateString()), new { validate = "date:true,required:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    客户订单号：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂CustomerNo", Html.Encode(Model.CustomerNo))%>
                </td>
                <td align="right">
                    合同类别：
                </td>
                <td align="left">
                    <%= Html.DropDownList("ExportContracts♂Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("出口合同类型", Html.Encode(Model.Type)), "请选择")%>
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
                                Response.Write(Html.TextBox("_ExportContracts♂CustomerID", obj.NameCode));
                                Response.Write(Html.Hidden("ExportContracts♂CustomerID", obj.ID.ToString()));
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_ExportContracts♂CustomerID"));
                                Response.Write(Html.Hidden("ExportContracts♂CustomerID"));
                            }
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_ExportContracts♂CustomerID"));
                            Response.Write(Html.Hidden("ExportContracts♂CustomerID"));
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
                                Response.Write(Html.TextBox("_ExportContracts♂CompanyID", obj.Name));
                                Response.Write(Html.Hidden("ExportContracts♂CompanyID", obj.ID.ToString()));
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_ExportContracts♂CompanyID"));
                                Response.Write(Html.Hidden("ExportContracts♂CompanyID"));
                            }
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_ExportContracts♂CompanyID"));
                            Response.Write(Html.Hidden("ExportContracts♂CompanyID"));
                        }
                    %>
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
                    <%= Html.TextBox("ExportContracts♂TotalSalesAmount", Html.Encode(Model.TotalSalesAmount), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    总包装数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TotalPackAmount", Html.Encode(Model.TotalPackAmount), new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文包装单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("ExportContracts♂TotalPackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model.TotalPackUnitEN)), "请选择")%>
                </td>
                <td align="right">
                    包装毛重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TotalPackGrossWeight", Html.Encode(Model.TotalPackGrossWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装净重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TotalPackNetWeight", Html.Encode(Model.TotalPackNetWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    包装体积(CBM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TotalPackBulk", Html.Encode(Model.TotalPackBulk), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品总数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TotalProductAmount", Html.Encode(Model.TotalProductAmount), new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    商品总单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TotalUnit",Html.Encode(Model.TotalUnit))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品总数量(不同单位)：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("ExportContracts♂TotalDifferentUnit", Html.Encode(Model.TotalDifferentUnit))%>
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
                    <%= Html.TextArea("ExportContracts♂Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
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
                    <%= Html.TextBox("ExportContracts♂CurrencyType", Html.Encode(Model.CurrencyType))%><a
                        href="#" onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                </td>
                <td align="right">
                    价格条款：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂PriceClause", Html.Encode(Model.PriceClause))%><a
                        href="#" onclick="LoadDictionaryPanel('价格条款',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    价格条款补充说明：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    付款方式：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("ExportContracts♂ClauseType", Html.Encode(Model.ClauseType))%><a
                        href="#" onclick="LoadDictionaryPanel('付款方式',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    付款方式补充说明：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂ClauseTypeNote", Html.Encode(Model.ClauseTypeNote), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    信用证交付期限：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂SubmitDate", Html.Encode(Model.SubmitDate), new { validate = "date:true", Class = "calendar" })%>
                </td>
                <td align="right">
                    投保险别：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂PolicyType", Html.Encode(Model.PolicyType))%>
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
                    <%= Html.TextBox("ExportContracts♂TansportCountry", Html.Encode(Model.TansportCountry))%><a
                        href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
                <td align="right">
                    起运港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂StartHaven", Html.Encode(Model.StartHaven))%><a
                        href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    转运港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TransferHaven", Html.Encode(Model.TransferHaven))%><a
                        href="#" onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
                <td align="right">
                    目的港口：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂EdnHaven", Html.Encode(Model.EdnHaven))%><a href="#"
                        onclick="LoadDictionaryPanel('港口',true,this)">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    运输方式：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂TransportMode", Html.Encode(Model.TransportMode))%><a
                        href="#" onclick="LoadDictionaryPanel('运输方式',true,this)">选择</a>
                </td>
                <td align="right">
                    出运日期：
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts♂ShipmentDate", Html.Encode(Model.ShipmentDate), new { validate = "date:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    允差（百分比）：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("ExportContracts♂ErrorValue", Html.Encode(Model.ErrorValue), new { validate = "digits:true,min:0,max:100" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    唛头：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂Mark", Html.Encode(Model.Mark), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装要求：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts♂PackRequire", Html.Encode(Model.PackRequire), new { style = "width:99%; height:40px;" })%>
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
                    <%= Html.TextArea("ExportContracts♂ComprehensiveConvention", Html.Encode(Model.ComprehensiveConvention), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <% 
                Model.ExportContractsPrice.Load();
                if (Model.ExportContractsPrice.Count > 0)
                {
                    for (int i = 0; i < Model.ExportContractsPrice.Count; i++)
                    {
                        Model.ExportContractsPrice.ElementAt(i).PriceReference.Load();
                    }
                }
            %>
            <!-- 报价单信息 -->
            <tr id="ExportContractsPrice♂" style="<%=Model.ExportContractsPrice.Count>0?"": "display: none"%>;
                text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        报价单信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='<%=  Model.ExportContractsPrice.Count %>' name="ExportContractsPrice♂regioncount"
                        id="ExportContractsPrice♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="ExportContractsPrice♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="ExportContractsPrice♂objectname" value="LZL.ForeignTrade.DataEntity.ExportContractsPrice,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="ExportContractsPrice♂fk" value='Price' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="ExportContractsPrice♂pfk" value='ExportContracts' />
                    <fieldset style="<%=Model.ExportContractsPrice.Count>0?"": "display: none"%>; width: 95%;">
                        <legend>报价单信息</legend>
                        <ul id="bjdxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.ExportContractsPrice.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('ExportContractsPrice♂','bjdxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Price♂ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.ExportContractsPrice.ElementAt(i).Price.ID.ToString() + "' />",
                                        Html.ActionLink(Model.ExportContractsPrice.ElementAt(i).Price.Name, "Details", "Price", new { id = Model.ExportContractsPrice.ElementAt(i).Price.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 报价单信息 -->
            <% 
                Model.ExportContractsProduct.Load();
                if (Model.ExportContractsProduct.Count > 0)
                {
                    for (int i = 0; i < Model.ExportContractsProduct.Count; i++)
                    {
                        Model.ExportContractsProduct.ElementAt(i).ProductReference.Load();
                    }
                }
            %>
            <!-- 商品信息 -->
            <tr id="ExportContractsProduct♂" style="<%=Model.ExportContractsProduct.Count>0?"": "display: none"%>;
                text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        商品信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='<%= Model.ExportContractsProduct.Count %>' name="ExportContractsProduct♂regioncount"
                        id="ExportContractsProduct♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="ExportContractsProduct♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="ExportContractsProduct♂objectname" value="LZL.ForeignTrade.DataEntity.ExportContractsProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="ExportContractsProduct♂fk" value='Product' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="ExportContractsProduct♂pfk" value='ExportContracts' />
                    <fieldset style="<%=Model.ExportContractsProduct.Count>0?"": "display: none"%>; width: 95%;">
                        <legend>商品信息</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.ExportContractsProduct.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('ExportContractsProduct♂','spxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Product♂ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.ExportContractsProduct.ElementAt(i).Product.ID.ToString() + "' />",
                                        Html.ActionLink(Model.ExportContractsProduct.ElementAt(i).Product.NameCode, "Details", "Product", new { id = Model.ExportContractsProduct.ElementAt(i).Product.ID.ToString() }, null)));
                                }
                            %>
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
    <li><a href="#" onclick="openbjd('ExportContractsPrice♂','Price♂ID','bjdxx','<%=Url.Action("Details","Price")%>');">
        关联报价信息</a></li>
    <li><a href="#" onclick="openspxx('ExportContractsProduct♂','Product♂ID','spxx','<%=Url.Action("Details","Product")%>');">
        关联商品信息</a></li>
</asp:Content>
