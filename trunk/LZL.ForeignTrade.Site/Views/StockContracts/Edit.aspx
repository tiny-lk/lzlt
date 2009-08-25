<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StockContracts/StockContracts.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.StockContracts>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    �༭�ɹ���ͬ��Ϣ
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
                    alert("��ӱ�����ʧ�ܣ�");
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
                    alert("��ӱ�����ʧ�ܣ�");
                }
            });
        }
        
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_StockContracts��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_StockContracts��CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='StockContracts��CustomerID']").val(formatted);
                }
            });

            $("input[name='_StockContracts��CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='StockContracts��CustomerID']").val("");
                }
            });

            $("input[name='_StockContracts��CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_StockContracts��CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='StockContracts��CompanyID']").val(formatted);
                }
            });

            $("input[name='_StockContracts��CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='StockContracts��CompanyID']").val("");
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("StockContracts��CurrencyType", "��������");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="StockContracts��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="StockContracts��objectname" value="LZL.ForeignTrade.DataEntity.StockContracts,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption>
            �ɹ���ͬ��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                    �ɹ���ͬ���
                </td>
                <%= Html.Hidden("StockContracts��ID", Html.Encode(Model.ID.ToString()))%>
                <td align="right" style="width: 15%;">
                    �ɹ���ͬ�ţ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("StockContracts��Name",Html.Encode( Model.Name), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    �ɹ���ͬǩԼ���ڣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("StockContracts��Date", Html.Encode(Model.Date.ToShortDateString()), new { validate = "date:true,required:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ѡ��ͻ���
                </td>
                <td align="left">
                    <%
                        if (Model.CustomerID != null)
                        {
                            var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model.CustomerID);
                            if (obj != null)
                            {
                                Response.Write(Html.TextBox("_StockContracts��CustomerID", obj.NameCode));
                                Response.Write(Html.Hidden("StockContracts��CustomerID", obj.ID.ToString()));
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_StockContracts��CustomerID"));
                                Response.Write(Html.Hidden("StockContracts��CustomerID"));
                            }
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_StockContracts��CustomerID"));
                            Response.Write(Html.Hidden("StockContracts��CustomerID"));
                        }
                    %>
                </td>
                <td align="right">
                    ��˾��ƣ�
                </td>
                <td align="left">
                    <%
                        if (Model.CompanyID != null)
                        {
                            var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCompany(Model.CompanyID);
                            if (obj != null)
                            {
                                Response.Write(Html.TextBox("_StockContracts��CompanyID", obj.Name));
                                Response.Write(Html.Hidden("StockContracts��CompanyID", obj.ID.ToString()));
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_StockContracts��CompanyID"));
                                Response.Write(Html.Hidden("StockContracts��CompanyID"));
                            }
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_StockContracts��CompanyID"));
                            Response.Write(Html.Hidden("StockContracts��CompanyID"));
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ͬ���
                </td>
                <td align="left" colspan="3">
                    <%= Html.DropDownList("StockContracts��Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("�ɹ���ͬ����", Html.Encode(Model.Type)), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="5" valign="middle">
                    ��Ʒ��Ϣ����
                </td>
                <td align="right">
                    �����۽�
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalSalesAmount", Html.Encode(Model.TotalSalesAmount), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �ܰ�װ������
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackAmount", Html.Encode(Model.TotalPackAmount), new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("StockContracts��TotalPackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ", Html.Encode(Model.TotalPackUnitCH)), "��ѡ��")%>
                </td>
                <td align="right">
                    ��װë��(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackGrossWeight", Html.Encode(Model.TotalPackGrossWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ����(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackNetWeight", Html.Encode(Model.TotalPackNetWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��װ���(CBM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackBulk", Html.Encode(Model.TotalPackBulk), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ��������
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalProductAmount", Html.Encode(Model.TotalProductAmount), new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    ��Ʒ�ܵ�λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalUnit", Html.Encode(Model.TotalUnit))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ������(��ͬ��λ)��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("StockContracts��TotalDifferentUnit", Html.Encode(Model.TotalDifferentUnit))%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="1" valign="middle">
                    ������Ϣ
                </td>
                <td align="right">
                    ��ע��Ϣ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="2" valign="middle">
                    ����������
                </td>
                <td align="right">
                    ��ͬ���֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��CurrencyType", Html.Encode(Model.CurrencyType))%><a
                        href="#" onclick="LoadDictionaryPanel('��������',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �������ڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��SubmitDate", Html.Encode(Model.SubmitDate), new { validate = "date:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ʽ����˵����
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="3" valign="middle">
                    ����������
                </td>
                <td align="right">
                    �������ڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��ConsignmentDate", Html.Encode(Model.ConsignmentDate), new { validate = "date:true", Class = "calendar" })%>
                </td>
                <td align="right">
                    �����ص㣺
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��ConsignmentAddress", Html.Encode(Model.ConsignmentAddress))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ͷ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��Mark", Html.Encode(Model.Mark), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װҪ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��PackRequire", Html.Encode(Model.PackRequire), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="1" valign="middle">
                    ��������
                </td>
                <td align="right">
                    ��ͬ�ۺ����
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��ComprehensiveConvention", Html.Encode(Model.ComprehensiveConvention), new { style = "width:99%; height:40px;" })%>
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
            <!-- ���ں�ͬ��Ϣ -->
            <tr id="StockContractsExportContracts��" style="<%=Model.StockContractsExportContracts.Count>0?"": "display: none"%>;
                text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        ���ں�ͬ��Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='0' name="StockContractsExportContracts��regioncount" id="StockContractsExportContracts��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="StockContractsExportContracts��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="StockContractsExportContracts��objectname" value="LZL.ForeignTrade.DataEntity.StockContractsExportContracts,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="StockContractsExportContracts��fk" value='ExportContracts' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="StockContractsExportContracts��pfk" value='StockContracts' />
                    <fieldset style="<%=Model.StockContractsExportContracts.Count>0?"": "display: none"%>;
                        width: 95%;">
                        <legend>���ں�ͬ��Ϣ</legend>
                        <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.StockContractsExportContracts.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('StockContractsExportContracts��','bjdxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='ExportContracts��ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.StockContractsExportContracts.ElementAt(i).ExportContracts.ID.ToString() + "' />",
                                        Html.ActionLink(Model.StockContractsExportContracts.ElementAt(i).ExportContracts.Name, "Details", "ExportContracts", new { id = Model.StockContractsExportContracts.ElementAt(i).ExportContracts.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- ���ں�ͬ��Ϣ -->
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
            <!-- ��Ʒ��Ϣ -->
            <tr id="StockContractsProduct��" style="<%=Model.StockContractsProduct.Count>0?"": "display: none"%>;
                text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        ��Ʒ��Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='0' name="StockContractsProduct��regioncount" id="StockContractsProduct��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="StockContractsProduct��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="StockContractsProduct��objectname" value="LZL.ForeignTrade.DataEntity.StockContractsProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="StockContractsProduct��fk" value='Product' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="StockContractsProduct��pfk" value='StockContracts' />
                    <fieldset style="<%=Model.StockContractsProduct.Count>0?"": "display: none"%>; width: 95%;">
                        <legend>��Ʒ��Ϣ</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.StockContractsProduct.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('StockContractsProduct��','spxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Product��ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.StockContractsProduct.ElementAt(i).Product.ID.ToString() + "' />",
                                        Html.ActionLink(Model.StockContractsProduct.ElementAt(i).Product.NameCode, "Details", "Product", new { id = Model.StockContractsProduct.ElementAt(i).Product.ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- ��Ʒ��Ϣ -->
            <!-- ��Ʒ��װ��Ϣ -->
            <tr id="ProductPack��" style="display: none;">
                <td colspan="5">
                    <%
                        Model.ProductPack.Load();
                        if (Model.ProductPack.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductPack.Count);
                            viewdictionary2.Add("FK", "StockContracts");//���۵���Ϣ
                            Html.RenderPartial("ProductPackControl", Model.ProductPack.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- ��Ʒ��װ��Ϣ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/StockContracts/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openckht('StockContractsExportContracts��','ExportContracts��ID','ckhtxx','<%=Url.Action("Details","ExportContracts")%>');"
        class="button">���ں�ͬ</a> <a href="#" onclick="openspxx('StockContractsProduct��','Product��ID','spxx','<%=Url.Action("Details","Product")%>');"
            class="button">��Ʒ��Ϣ</a> <a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack��',1,'StockContracts')"
                class="button">��Ʒ��װ</a>
</asp:Content>
