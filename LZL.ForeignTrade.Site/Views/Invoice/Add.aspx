<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Invoice/Invoice.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӵ�����Ϣ
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

        function submitInfo() {
            $("#btnTj").click();
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_Invoice��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_Invoice��CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Invoice��CustomerID']").val(formatted);
                }
            });

            $("input[name='_Invoice��CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Invoice��CustomerID']").val("");
                }
            });

            $("input[name='_Invoice��CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_Invoice��CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Invoice��CompanyID']").val(formatted);
                }
            });

            $("input[name='_Invoice��CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Invoice��CompanyID']").val("");
                }
            });

            //��ȡ��������
            $("#Invoice��Shipper").attr("title", "˫���Զ���ȡ����ֵ"); //������
            $("#Invoice��Consignee").attr("title", "˫���Զ���ȡ����ֵ"); //�ջ���
            $("#Invoice��OceanFreightPayment").attr("title", "˫���Զ���ȡ����ֵ"); //�˷�֧��
            $("#Invoice��OceanTansportCountry").attr("title", "˫���Զ���ȡ����ֵ"); //�˵ֹ�
            $("#Invoice��OceanStartHaven").attr("title", "˫���Զ���ȡ����ֵ"); //���˸�
            $("#Invoice��OceanTransferHaven").attr("title", "˫���Զ���ȡ����ֵ"); //ת�˸�
            $("#Invoice��OceanEdnHaven").attr("title", "˫���Զ���ȡ����ֵ"); //Ŀ�ĸ�

            $("#Invoice��Shipper").bind("dblclick", function(thisObj) {
                $("#Invoice��Shipper").val($("#_Invoice��CompanyID").val());
            }); //������

            $("#Invoice��Consignee").bind("dblclick", function(thisObj) {
                $("#Invoice��Consignee").val($("#_Invoice��CustomerID").val());
            }); //�ջ���

            $("#Invoice��OceanFreightPayment").bind("dblclick", function(thisObj) {
                $("#Invoice��OceanFreightPayment").val($("#Invoice��FreightPayment").val());
            }); //�˷�֧��

            $("#Invoice��OceanTansportCountry").bind("dblclick", function(thisObj) {
                $("#Invoice��OceanTansportCountry").val($("#Invoice��TansportCountry").val());
            }); //�˵ֹ�

            $("#Invoice��OceanStartHaven").bind("dblclick", function(thisObj) {
                $("#Invoice��OceanStartHaven").val($("#Invoice��StartHaven").val());
            }); //���˸�

            $("#Invoice��OceanTransferHaven").bind("dblclick", function(thisObj) {
                $("#Invoice��OceanTransferHaven").val($("#Invoice��TransferHaven").val());
            }); //ת�˸�

            $("#Invoice��OceanEdnHaven").bind("dblclick", function(thisObj) {
                $("#Invoice��OceanEdnHaven").val($("#Invoice��EdnHaven").val());
            }); //Ŀ�ĸ�

            //��ʼ������¼�
            $("#hrSpxx").click();
            $("#hrSpbz").click();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Invoice��CurrencyType", "��������");
            autocompletedictionary("Invoice��PriceClause", "�۸�����");
            autocompletedictionary("Invoice��ClauseType", "���ʽ");
            autocompletedictionary("Invoice��Trade", "ó�׷�ʽ");
            autocompletedictionary("Invoice��TansportCountry", "�ۿ�");
            autocompletedictionary("Invoice��StartHaven", "�ۿ�");
            autocompletedictionary("Invoice��TransferHaven", "�ۿ�");
            autocompletedictionary("Invoice��EdnHaven", "�ۿ�");
            autocompletedictionary("Invoice��TransportMode", "���䷽ʽ");
            autocompletedictionary("Invoice��FreightPayment", "�˷�֧��");
            autocompletedictionary("Invoice��OceanFreightPayment", "���䷽ʽ");
            autocompletedictionary("Invoice��OceanTansportCountry", "�ۿ�");
            autocompletedictionary("Invoice��OceanStartHaven", "�ۿ�");
            autocompletedictionary("Invoice��OceanEdnHaven", "�ۿ�");
            autocompletedictionary("Invoice��OceanTransferHaven", "�ۿ�");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Invoice��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Invoice��objectname" value="LZL.ForeignTrade.DataEntity.Invoice,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Invoice��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Invoice��iseditdate", "EditDate")%>
    <table cellpadding="0" cellspacing="0" border="0" align="center" width="60%">
        <tr>
            <td align="center" style="font-size: 14px">
                <span id="addnews" style="font-weight: bold; color: blue">1. ��ӵ�֤��Ϣ </span>��������
                2. �Ķ�(�޸�)��֤��Ϣ
            </td>
        </tr>
    </table>
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">��Ʊ��Ϣ</a></li>
            <li><a href="#tabs-2">��Ʒ��Ϣ</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
                ��Ʊ�����ݣ���Ϣ</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="7" align="center" valign="middle" style="width: 10%;">
                        ��Ʊ���
                    </td>
                    <td align="right" style="width: 15%;">
                        ��Ʊ�ţ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice��Name", "", new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ��Ʊ���ڣ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice��Date", "", new { validate = "date:true,required:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ں�ͬ�ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ExportContractsName")%>
                        <% Response.Write("<a href='#'onclick=LoadControlList(this,'ExportContractsIndex')>ѡ��</a>");%>
                    </td>
                    <td align="right">
                        �������ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��RevocationNo")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʊ���֣�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('��������',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �۸����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��PriceClause")%><a href="#" onclick="LoadDictionaryPanel('�۸�����',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �۸������˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��PriceClauseNote", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ClauseType")%><a href="#" onclick="LoadDictionaryPanel('���ʽ',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        ó�׷�ʽ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��Trade")%><a href="#" onclick="LoadDictionaryPanel('ó�׷�ʽ',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ����˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��ClauseTypeNote", new { style = "width:99%; height:40px;" })%>
                    </td>
                    <%-- <td align="right">
                        ��Ʊ���ͣ�
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Invoice��Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("��Ʊ����"), "��ѡ��")%>
                    </td>--%>
                </tr>
                <tr>
                    <td align="right">
                        ѡ��ͻ���
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Invoice��CustomerID")%><!-- "-"��ʾ���������ֵ -->
                        <%=Html.Hidden("Invoice��CustomerID")%>
                        <% Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>ѡ��</a>");%>
                    </td>
                    <td align="right">
                        ��˾��ƣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Invoice��CompanyID")%><!-- "-"��ʾ���������ֵ -->
                        <%= Html.Hidden("Invoice��CompanyID")%>
                        <%Response.Write("<a href='#'onclick=LoadControlList(this,'CompanyIndex')>ѡ��</a>"); %>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" valign="middle">
                        ����֤��Ϣ
                    </td>
                    <td align="right">
                        ����֤�ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��CreditCardNo")%>
                    </td>
                    <td align="right">
                        ��֤���У�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��AccountBank")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��֤���ڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��AccountDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        װ�����ޣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ShipmentDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ч���ޣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ValidDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        ����֤��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��CreditAmount", "", new { validate = "number:true" })%>��Ԫ
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        ������Ϣ
                    </td>
                    <td align="right">
                        �˵ֹ���
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TansportCountry")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        ���˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��StartHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ת�˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TransferHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        Ŀ�ĸۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��EdnHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���䷽ʽ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TransportMode")%><a href="#" onclick="LoadDictionaryPanel('���䷽ʽ',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �˷�֧����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��FreightPayment")%><a href="#" onclick="LoadDictionaryPanel('�˷�֧��',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ������
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice��IsBatches",false)%>
                    </td>
                    <td align="right">
                        ת�ˣ�
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice��IsTransfer",false)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ͷ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��Mark", new { style = "width:99%; height:40px;" })%>
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
                        <%= Html.TextArea("Invoice��Note", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="center">
                        ��֤����
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        ��Ʊ
                    </td>
                    <td align="right">
                        ��Ʊ���
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��InvoiceItem", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        װ�䵥
                    </td>
                    <td align="right">
                        װ�䵥���
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��BoxItem", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="9" valign="middle">
                        �����ᵥ
                    </td>
                    <td align="right">
                        �ᵥ���룺
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanNo")%>
                    </td>
                    <td align="right">
                        �ᵥ���ڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanDate", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        �����ˣ�
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice��Shipper")%>
                    </td>
                    <td align="right" style="font-weight: bold;">
                        �ջ��ˣ�
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice��Consignee")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ֪ͨ�ˣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��CircularizeMan")%>
                    </td>
                    <td align="right">
                        �ջ���ַ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ReceivingAddress")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��FlightNo")%>
                    </td>
                    <td align="right">
                        �ᵥ������
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanCount", "", new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        �˷�֧����
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice��OceanFreightPayment")%><a href="#" onclick="LoadDictionaryPanel('�˷�֧��',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �˷ѽ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��FreightAmount", "", new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        һ�̴�����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OneProcessName")%>
                    </td>
                    <td align="right">
                        ���̴�����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TwoProcessName")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanDeputy")%>
                    </td>
                    <td align="right" style="font-weight: bold;">
                        �˵ֹ���
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice��OceanTansportCountry")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        ���˸ۣ�
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice��OceanStartHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right" style="font-weight: bold;">
                        ת�˸ۣ�
                    </td>
                    <td align="left" style="background-color: Silver">
                        <%= Html.TextBox("Invoice��OceanEdnHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold;">
                        Ŀ�ĸۣ�
                    </td>
                    <td align="left" colspan="4" style="background-color: Silver">
                        <%= Html.TextBox("Invoice��OceanTransferHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ᵥ��ע��
                    </td>
                    <td align="left" colspan="4">
                        <%= Html.TextArea("Invoice��OceanNote", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <!-- ���۵���Ϣ -->
                <tr id="InvoiceExportContracts��" style="display: none; text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            ���ں�ͬ��Ϣ</center>
                        <!-- ��ʶ�ӱ�������� -->
                        <input type="hidden" value='0' name="InvoiceExportContracts��regioncount" id="InvoiceExportContracts��regioncount" />
                        <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                        <input type="hidden" name="region" value="InvoiceExportContracts��" />
                        <!-- ��ʶ�ӱ�ʵ������� -->
                        <input type="hidden" name="InvoiceExportContracts��objectname" value="LZL.ForeignTrade.DataEntity.InvoiceExportContracts,LZL.ForeignTrade.DataEntity" />
                        <!-- ��Զ��ϵ�� -->
                        <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                        <input type="hidden" name="InvoiceExportContracts��fk" value='ExportContracts' />
                        <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                        <input type="hidden" name="InvoiceExportContracts��pfk" value='Invoice' />
                        <fieldset style="display: none; width: 95%;">
                            <legend>���ں�ͬ��Ϣ</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- ���۵���Ϣ -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" style="display: none" class="button" id="btnTj" value="�� ��" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table width="100%" id="tabs-2">
            <caption>
                ��Ʒ��Ϣ
            </caption>
            <!-- ��Ʒ��Ϣ -->
            <tr id="ProductSummary��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ��Ʒ��Ϣ -->
        </table>
    </div>
    <%
        }
    %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openckht('InvoiceExportContracts��','ExportContracts��ID','ckhtxx','<%=Url.Action("Details","Price")%>');"
        class="button4">�������ں�ͬ</a> <a href="#" id="hrSpxx" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary��',1,'Invoice')"
            class="button4" style="display: none">�����Ʒ��Ϣ</a><a href="#" id="hrSpbz" onclick="addcontrol(this,'ProductPackControl','ProductPack��',1,'Invoice')"
                class="button4" style="display: none">�����Ʒ��װ</a> <a href="#" onclick='submitInfo();'
                    class="button4">���������ύ</a>
</asp:Content>
