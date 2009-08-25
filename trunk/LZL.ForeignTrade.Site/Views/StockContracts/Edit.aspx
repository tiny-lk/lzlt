<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StockContracts/StockContracts.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.StockContracts>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    编辑采购合同信息
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
    <table width="100%">
        <caption>
            采购合同信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                    采购合同简介
                </td>
                <%= Html.Hidden("StockContracts♂ID", Html.Encode(Model.ID.ToString()))%>
                <td align="right" style="width: 15%;">
                    采购合同号：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("StockContracts♂Name",Html.Encode( Model.Name), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    采购合同签约日期：
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("StockContracts♂Date", Html.Encode(Model.Date.ToShortDateString()), new { validate = "date:true,required:true", Class = "calendar" })%>
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
                                Response.Write(Html.TextBox("_StockContracts♂CustomerID", obj.NameCode));
                                Response.Write(Html.Hidden("StockContracts♂CustomerID", obj.ID.ToString()));
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_StockContracts♂CustomerID"));
                                Response.Write(Html.Hidden("StockContracts♂CustomerID"));
                            }
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_StockContracts♂CustomerID"));
                            Response.Write(Html.Hidden("StockContracts♂CustomerID"));
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
                                Response.Write(Html.TextBox("_StockContracts♂CompanyID", obj.Name));
                                Response.Write(Html.Hidden("StockContracts♂CompanyID", obj.ID.ToString()));
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_StockContracts♂CompanyID"));
                                Response.Write(Html.Hidden("StockContracts♂CompanyID"));
                            }
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_StockContracts♂CompanyID"));
                            Response.Write(Html.Hidden("StockContracts♂CompanyID"));
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    合同类别：
                </td>
                <td align="left" colspan="3">
                    <%= Html.DropDownList("StockContracts♂Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("采购合同类型", Html.Encode(Model.Type)), "请选择")%>
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
                    <%= Html.TextBox("StockContracts♂TotalSalesAmount", Html.Encode(Model.TotalSalesAmount), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    总包装数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂TotalPackAmount", Html.Encode(Model.TotalPackAmount), new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文包装单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("StockContracts♂TotalPackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("中文单位", Html.Encode(Model.TotalPackUnitCH)), "请选择")%>
                </td>
                <td align="right">
                    包装毛重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂TotalPackGrossWeight", Html.Encode(Model.TotalPackGrossWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装净重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂TotalPackNetWeight", Html.Encode(Model.TotalPackNetWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    包装体积(CBM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂TotalPackBulk", Html.Encode(Model.TotalPackBulk), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品总数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂TotalProductAmount", Html.Encode(Model.TotalProductAmount), new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    商品总单位：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂TotalUnit", Html.Encode(Model.TotalUnit))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品总数量(不同单位)：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("StockContracts♂TotalDifferentUnit", Html.Encode(Model.TotalDifferentUnit))%>
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
                    <%= Html.TextArea("StockContracts♂Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
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
                    <%= Html.TextBox("StockContracts♂CurrencyType", Html.Encode(Model.CurrencyType))%><a
                        href="#" onclick="LoadDictionaryPanel('货币类型',true,this)">选择</a>
                </td>
                <td align="right">
                    付款日期：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂SubmitDate", Html.Encode(Model.SubmitDate), new { validate = "date:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    付款方式补充说明：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts♂PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:40px;" })%>
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
                    <%= Html.TextBox("StockContracts♂ConsignmentDate", Html.Encode(Model.ConsignmentDate), new { validate = "date:true", Class = "calendar" })%>
                </td>
                <td align="right">
                    交货地点：
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts♂ConsignmentAddress", Html.Encode(Model.ConsignmentAddress))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    唛头：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts♂Mark", Html.Encode(Model.Mark), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装要求：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts♂PackRequire", Html.Encode(Model.PackRequire), new { style = "width:99%; height:40px;" })%>
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
                    <%= Html.TextArea("StockContracts♂ComprehensiveConvention", Html.Encode(Model.ComprehensiveConvention), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <% 
                Model.StockContractsExportContracts.Load();
                if (Model.StockContractsExportContracts.Count > 0)
                {
                    for (int i = 0; i < Model.StockContractsExportContracts.Count; i++)
                    {
                        Model.StockContractsExportContracts.ElementAt(i).ExportContractsReference.Load();
                    }
                }
            %>
            <!-- 出口合同信息 -->
            <tr id="StockContractsExportContracts♂" style="<%=Model.StockContractsExportContracts.Count>0?"": "display: none"%>;
                text-align: left;">
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
                    <fieldset style="<%=Model.StockContractsExportContracts.Count>0?"": "display: none"%>;
                        width: 95%;">
                        <legend>出口合同信息</legend>
                        <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.StockContractsExportContracts.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('StockContractsExportContracts♂','bjdxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='ExportContracts♂ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.StockContractsExportContracts.ElementAt(i).ExportContracts.ID.ToString() + "' />",
                                        Html.ActionLink(Model.StockContractsExportContracts.ElementAt(i).ExportContracts.Name, "Details", "ExportContracts", new { id = Model.StockContractsExportContracts.ElementAt(i).ExportContracts.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 出口合同信息 -->
            <% 
                Model.StockContractsProduct.Load();
                if (Model.StockContractsProduct.Count > 0)
                {
                    for (int i = 0; i < Model.StockContractsProduct.Count; i++)
                    {
                        Model.StockContractsProduct.ElementAt(i).ProductReference.Load();
                    }
                }
            %>
            <!-- 商品信息 -->
            <tr id="StockContractsProduct♂" style="<%=Model.StockContractsProduct.Count>0?"": "display: none"%>;
                text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        商品信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='0' name="StockContractsProduct♂regioncount" id="StockContractsProduct♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="StockContractsProduct♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="StockContractsProduct♂objectname" value="LZL.ForeignTrade.DataEntity.StockContractsProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="StockContractsProduct♂fk" value='Product' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="StockContractsProduct♂pfk" value='StockContracts' />
                    <fieldset style="<%=Model.StockContractsProduct.Count>0?"": "display: none"%>; width: 95%;">
                        <legend>商品信息</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.StockContractsProduct.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('StockContractsProduct♂','spxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Product♂ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.StockContractsProduct.ElementAt(i).Product.ID.ToString() + "' />",
                                        Html.ActionLink(Model.StockContractsProduct.ElementAt(i).Product.NameCode, "Details", "Product", new { id = Model.StockContractsProduct.ElementAt(i).Product.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 商品信息 -->
            <!-- 商品包装信息 -->
            <tr id="ProductPack♂" style="display: none;">
                <td colspan="5">
                    <%
                        Model.ProductPack.Load();
                        if (Model.ProductPack.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductPack.Count);
                            viewdictionary2.Add("FK", "StockContracts");//报价单信息
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
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openckht('StockContractsExportContracts♂','ExportContracts♂ID','ckhtxx','<%=Url.Action("Details","ExportContracts")%>');"
        class="button">出口合同</a> <a href="#" onclick="openspxx('StockContractsProduct♂','Product♂ID','spxx','<%=Url.Action("Details","Product")%>');"
            class="button">商品信息</a> <a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack♂',1,'StockContracts')"
                class="button">商品包装</a>
</asp:Content>
