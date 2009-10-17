<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ExportContracts/ExportContracts.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӳ��ں�ͬ��Ϣ
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
            $("input[name='_ExportContracts��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_ExportContracts��CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='ExportContracts��CustomerID']").val(formatted);
                }
            });

            $("input[name='_ExportContracts��CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='ExportContracts��CustomerID']").val("");
                }
            });

            $("input[name='_ExportContracts��CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_ExportContracts��CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='ExportContracts��CompanyID']").val(formatted);
                }
            });

            $("input[name='_ExportContracts��CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='ExportContracts��CompanyID']").val("");
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("ExportContracts��CurrencyType", "��������");
            autocompletedictionary("ExportContracts��PriceClause", "�۸�����");
            autocompletedictionary("ExportContracts��ClauseType", "���ʽ");
            autocompletedictionary("ExportContracts��TansportCountry", "�ۿ�");
            autocompletedictionary("ExportContracts��StartHaven", "�ۿ�");
            autocompletedictionary("ExportContracts��EdnHaven", "�ۿ�");
            autocompletedictionary("ExportContracts��TransferHaven", "�ۿ�");
            autocompletedictionary("ExportContracts��TransportMode", "���䷽ʽ");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="ExportContracts��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="ExportContracts��objectname" value="LZL.ForeignTrade.DataEntity.ExportContracts,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("ExportContracts��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("ExportContracts��iseditdate", "EditDate")%>
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            ���ں�ͬ��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                    ���ں�ͬ���
                </td>
                <td align="right" style="width: 15%;">
                    ���ں�ͬ�ţ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("ExportContracts��Name", "", new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    ���ں�ͬǩԼ���ڣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("ExportContracts��Date", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ͻ������ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��CustomerNo")%>
                </td>
                <td align="right">
                    ��ͬ���
                </td>
                <td align="left">
                    <%= Html.DropDownList("ExportContracts��Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ں�ͬ����"), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ѡ��ͻ���
                </td>
                <td align="left">
                    <%= Html.TextBox("_ExportContracts��CustomerID")%><!-- "-"��ʾ���������ֵ -->
                    <%=Html.Hidden("ExportContracts��CustomerID")%>
                </td>
                <td align="right">
                    ��˾��ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("_ExportContracts��CompanyID")%><!-- "-"��ʾ���������ֵ -->
                    <%= Html.Hidden("ExportContracts��CompanyID")%>
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
                    <%= Html.TextArea("ExportContracts��Note", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="5" valign="middle">
                    ����������
                </td>
                <td align="right">
                    ��ͬ���֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('��������',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �۸����
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��PriceClause")%><a href="#" onclick="LoadDictionaryPanel('�۸�����',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �۸������˵����
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts��PriceClauseNote", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ʽ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("ExportContracts��ClauseType")%><a href="#" onclick="LoadDictionaryPanel('���ʽ',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ʽ����˵����
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts��ClauseTypeNote", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ����֤�������ޣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��SubmitDate", "", new { validate = "date:true", Class = "calendar" })%>
                </td>
                <td align="right">
                    Ͷ���ձ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��PolicyType")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="6" valign="middle">
                    ����������
                </td>
                <td align="right">
                    �˵ֹ���
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��TansportCountry")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ���˸ۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��StartHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ת�˸ۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��TransferHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    Ŀ�ĸۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��EdnHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���䷽ʽ��
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��TransportMode")%><a href="#" onclick="LoadDictionaryPanel('���䷽ʽ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �������ڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ExportContracts��ShipmentDate", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ʲ�ٷֱȣ���
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("ExportContracts��ErrorValue", "", new { validate = "digits:true,min:0,max:100" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ͷ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts��Mark", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װҪ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("ExportContracts��PackRequire", new { style = "width:99%; height:40px;" })%>
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
                    <%= Html.TextArea("ExportContracts��ComprehensiveConvention", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <!-- ��Ʒ��װ��Ϣ -->
            <tr id="ProductPack��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ��Ʒ��װ��Ϣ -->
            
            <!-- ���۵���Ϣ -->
            <tr id="ExportContractsPrice��" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        ���۵���Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='0' name="ExportContractsPrice��regioncount" id="ExportContractsPrice��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="ExportContractsPrice��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="ExportContractsPrice��objectname" value="LZL.ForeignTrade.DataEntity.ExportContractsPrice,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="ExportContractsPrice��fk" value='Price' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="ExportContractsPrice��pfk" value='ExportContracts' />
                    <fieldset style="display: none; width: 95%;">
                        <legend>���۵���Ϣ</legend>
                        <ul id="bjdxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- ���۵���Ϣ -->
            <!-- ��Ʒ��Ϣ -->
            <tr id="ExportContractsProduct��" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        ��Ʒ��Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='0' name="ExportContractsProduct��regioncount" id="ExportContractsProduct��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="ExportContractsProduct��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="ExportContractsProduct��objectname" value="LZL.ForeignTrade.DataEntity.ExportContractsProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="ExportContractsProduct��fk" value='Product' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="ExportContractsProduct��pfk" value='ExportContracts' />
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
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openbjd('ExportContractsPrice��','Price��ID','bjdxx','<%=Url.Action("Details","Price")%>');"
        class='button'>������Ϣ</a> <a href="#" onclick="openspxx('ExportContractsProduct��','Product��ID','spxx','<%=Url.Action("Details","Product")%>');"
            class='button'>��Ʒ��Ϣ</a> <a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack��',1,'ExportContracts')"
                class="button">��Ʒ��װ</a>
</asp:Content>
