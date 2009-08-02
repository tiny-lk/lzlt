<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StockContracts/StockContracts.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    ��Ӳɹ���ͬ��Ϣ
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
                <td align="right" style="width: 15%;">
                    �ɹ���ͬ�ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��Name", "", new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    �ɹ���ͬǩԼ���ڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��Date", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ѡ��ͻ���
                </td>
                <td align="left">
                    <%= Html.TextBox("_StockContracts��CustomerID")%><!-- "-"��ʾ���������ֵ -->
                    <%=Html.Hidden("StockContracts��CustomerID")%>
                </td>
                <td align="right">
                    ��˾��ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("_StockContracts��CompanyID")%><!-- "-"��ʾ���������ֵ -->
                    <%= Html.Hidden("StockContracts��CompanyID")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ͬ���
                </td>
                <td align="left" colspan="3">
                    <%= Html.DropDownList("StockContracts��Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("�ɹ���ͬ����"), "��ѡ��")%>
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
                    <%= Html.TextBox("StockContracts��TotalSalesAmount", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �ܰ�װ������
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackAmount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("StockContracts��TotalPackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ"), "��ѡ��")%>
                </td>
                <td align="right">
                    ��װë��(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackGrossWeight", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ����(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackNetWeight", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��װ���(CBM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalPackBulk", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ��������
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalProductAmount", "", new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    ��Ʒ�ܵ�λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��TotalUnit")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ������(��ͬ��λ)��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("StockContracts��TotalDifferentUnit")%>
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
                    <%= Html.TextArea("StockContracts��Note", new { style = "width:99%; height:60px;" })%>
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
                    <%= Html.TextBox("StockContracts��CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('��������',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �������ڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��SubmitDate", "", new { validate = "date:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ʽ����˵����
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��PriceClauseNote", new { style = "width:99%; height:40px;" })%>
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
                    <%= Html.TextBox("StockContracts��ConsignmentDate", "", new { validate = "date:true", Class = "calendar" })%>
                </td>
                <td align="right">
                    �����ص㣺
                </td>
                <td align="left">
                    <%= Html.TextBox("StockContracts��ConsignmentAddress")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ͷ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��Mark", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װҪ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("StockContracts��PackRequire", new { style = "width:99%; height:40px;" })%>
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
                    <%= Html.TextArea("StockContracts��ComprehensiveConvention", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <!-- ���ں�ͬ��Ϣ -->
            <tr id="StockContractsExportContracts��" style="display: none; text-align: left;">
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
                    <fieldset style="display: none; width: 95%;">
                        <legend>���ں�ͬ��Ϣ</legend>
                        <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- ���ں�ͬ��Ϣ -->
            <!-- ��Ʒ��Ϣ -->
            <tr id="StockContractsProduct��" style="display: none; text-align: left;">
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
                    <fieldset style="display: none; width: 95%;">
                        <legend>��Ʒ��Ϣ</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- ��Ʒ��Ϣ -->
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
    <li><a href="#" onclick="openckht('StockContractsExportContracts��','ExportContracts��ID','ckhtxx','<%=Url.Action("Details","ExportContracts")%>');">
        �������ں�ͬ��Ϣ</a></li>
    <li><a href="#" onclick="openspxx('StockContractsProduct��','Product��ID','spxx','<%=Url.Action("Details","Product")%>');">
        ������Ʒ��Ϣ</a></li>
</asp:Content>
