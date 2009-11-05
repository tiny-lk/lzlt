<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Invoice/Invoice.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Invoice>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    �༭��Ʊ����֤����Ϣ
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
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">��Ʊ��Ϣ</a></li>
            <li><a href="#tabs-2">��Ʒ��Ϣ</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                ��Ʊ�����ݣ���Ϣ</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="�� ��" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="7" align="center" valign="middle" style="width: 10%;">
                        ��Ʊ���
                        <%= Html.Hidden("Invoice��ID", Html.Encode(Model.ID.ToString()))%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ��Ʊ�ţ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice��Name",Html.Encode( Model.Name), new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ��Ʊ���ڣ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Invoice��Date", Html.Encode(Model.Date.ToShortDateString()), new { validate = "date:true,required:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ں�ͬ�ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ExportContractsName", Html.Encode(Model.ExportContractsName))%>
                    </td>
                    <td align="right">
                        �������ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��RevocationNo", Html.Encode(Model.RevocationNo))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʊ���֣�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��CurrencyType", Html.Encode(Model.CurrencyType))%><a href="#"
                            onclick="LoadDictionaryPanel('��������',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �۸����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��PriceClause", Html.Encode(Model.PriceClause))%><a href="#"
                            onclick="LoadDictionaryPanel('�۸�����',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �۸������˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ClauseType", Html.Encode(Model.ClauseType))%><a href="#"
                            onclick="LoadDictionaryPanel('���ʽ',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        ó�׷�ʽ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��Trade", Html.Encode(Model.Trade))%><a href="#" onclick="LoadDictionaryPanel('ó�׷�ʽ',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ����˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��ClauseTypeNote", Html.Encode(Model.ClauseTypeNote), new { style = "width:99%; height:40px;" })%>
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
                                    Response.Write(Html.TextBox("_Invoice��CustomerID", obj.NameCode));
                                    Response.Write(Html.Hidden("Invoice��CustomerID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_Invoice��CustomerID"));
                                    Response.Write(Html.Hidden("Invoice��CustomerID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_Invoice��CustomerID"));
                                Response.Write(Html.Hidden("Invoice��CustomerID"));
                            }
                            Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>ѡ��</a>");
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
                                    Response.Write(Html.TextBox("_Invoice��CompanyID", obj.Name));
                                    Response.Write(Html.Hidden("Invoice��CompanyID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_Invoice��CompanyID"));
                                    Response.Write(Html.Hidden("Invoice��CompanyID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_Invoice��CompanyID"));
                                Response.Write(Html.Hidden("Invoice��CompanyID"));
                            }
                        %>
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
                        <%= Html.TextBox("Invoice��CreditCardNo", Html.Encode(Model.CreditCardNo))%>
                    </td>
                    <td align="right">
                        ��֤���У�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��AccountBank", Html.Encode(Model.AccountBank))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��֤���ڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��AccountDate", Html.Encode(Model.AccountDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        װ�����ޣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ShipmentDate", Html.Encode(Model.ShipmentDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ч���ޣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ValidDate", Html.Encode(Model.ValidDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        ��Ʊ���ͣ�
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Invoice��Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("��Ʊ����", Html.Encode(Model.Type)), "��ѡ��")%>
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
                        <%= Html.TextBox("Invoice��TansportCountry", Html.Encode(Model.TansportCountry))%><a
                            href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        ���˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��StartHaven", Html.Encode(Model.StartHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ת�˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TransferHaven", Html.Encode(Model.TransferHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        Ŀ�ĸۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��EdnHaven", Html.Encode(Model.EdnHaven))%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���䷽ʽ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TransportMode", Html.Encode(Model.TransportMode))%><a href="#"
                            onclick="LoadDictionaryPanel('���䷽ʽ',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �˷�֧����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��FreightPayment", Html.Encode(Model.FreightPayment))%><a
                            href="#" onclick="LoadDictionaryPanel('�˷�֧��',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ������
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice��IsBatches", Model.IsBatches)%>
                    </td>
                    <td align="right">
                        ת�ˣ�
                    </td>
                    <td align="left">
                        <%= Html.CheckBox("Invoice��IsTransfer", Model.IsTransfer)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ͷ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Invoice��Mark", Html.Encode(Model.Mark), new { style = "width:99%; height:40px;" })%>
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
                        <%= Html.TextBox("Invoice��TotalSalesAmount", Html.Encode(Model.TotalSalesAmount), new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        �ܰ�װ������
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TotalPackAmount", Html.Encode(Model.TotalPackAmount), new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Ӣ�İ�װ��λ��
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Invoice��TotalPackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model.TotalPackUnitEN)), "��ѡ��")%>
                    </td>
                    <td align="right">
                        ��װë��(KG)��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TotalPackGrossWeight", Html.Encode(Model.TotalPackGrossWeight), new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��װ����(KG)��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TotalPackNetWeight", Html.Encode(Model.TotalPackNetWeight), new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        ��װ���(CBM)��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TotalPackBulk", Html.Encode(Model.TotalPackBulk), new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʒ��������
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TotalProductAmount", Html.Encode(Model.TotalProductAmount), new { validate = "digits:true" })%>
                    </td>
                    <td align="right">
                        ��Ʒ�ܵ�λ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TotalUnit", Html.Encode(Model.TotalUnit))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʒ������(��ͬ��λ)��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Invoice��TotalDifferentUnit", Html.Encode(Model.TotalDifferentUnit))%>
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
                        <%= Html.TextArea("Invoice��Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
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
                        <%= Html.TextArea("Invoice��InvoiceItem", Html.Encode(Model.InvoiceItem), new { style = "width:99%; height:60px;" })%>
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
                        <%= Html.TextArea("Invoice��BoxItem", Html.Encode(Model.BoxItem), new { style = "width:99%; height:60px;" })%>
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
                        <%= Html.TextBox("Invoice��OceanNo", Html.Encode(Model.OceanNo))%>
                    </td>
                    <td align="right">
                        �ᵥ���ڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanDate", Html.Encode(Model.OceanDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �����ˣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��Shipper", Html.Encode(Model.Shipper))%>
                    </td>
                    <td align="right">
                        �ջ��ˣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��Consignee", Html.Encode(Model.Consignee))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ֪ͨ�ˣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��CircularizeMan", Html.Encode(Model.CircularizeMan))%>
                    </td>
                    <td align="right">
                        �ջ���ַ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��ReceivingAddress", Html.Encode(Model.ReceivingAddress))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��FlightNo", Html.Encode(Model.FlightNo))%>
                    </td>
                    <td align="right">
                        �ᵥ������
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanCount", Html.Encode(Model.OceanCount), new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �˷�֧����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanFreightPayment", Html.Encode(Model.OceanFreightPayment))%><a
                            href="#" onclick="LoadDictionaryPanel('�˷�֧��',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �˷ѽ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��FreightAmount", Html.Encode(Model.FreightAmount), new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        һ�̴�����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OneProcessName", Html.Encode(Model.OneProcessName))%>
                    </td>
                    <td align="right">
                        ���̴�����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��TwoProcessName", Html.Encode(Model.TwoProcessName))%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanDeputy", Html.Encode(Model.OceanDeputy))%>
                    </td>
                    <td align="right">
                        �˵ֹ���
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanTansportCountry", Html.Encode(Model.OceanTansportCountry))%><a
                            href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���˸ۣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanStartHaven", Html.Encode(Model.OceanStartHaven))%><a
                            href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        ת�˸ۣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Invoice��OceanEdnHaven", Html.Encode(Model.OceanEdnHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Ŀ�ĸۣ�
                    </td>
                    <td align="left" colspan="4">
                        <%= Html.TextBox("Invoice��OceanTransferHaven", Html.Encode(Model.OceanTransferHaven))%><a
                            href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ᵥ��ע��
                    </td>
                    <td align="left" colspan="4">
                        <%= Html.TextArea("Invoice��OceanNote", Html.Encode(Model.OceanNote), new { style = "width:99%; height:60px;" })%>
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
                <!-- ���۵���Ϣ -->
                <tr id="InvoiceExportContracts��" style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>;
                    text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            ���ں�ͬ��Ϣ</center>
                        <!-- ��ʶ�ӱ�������� -->
                        <input type="hidden" value='<%= Model.InvoiceExportContracts.Count %>' name="InvoiceExportContracts��regioncount"
                            id="InvoiceExportContracts��regioncount" />
                        <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                        <input type="hidden" name="region" value="InvoiceExportContracts��" />
                        <!-- ��ʶ�ӱ�ʵ������� -->
                        <input type="hidden" name="InvoiceExportContracts��objectname" value="LZL.ForeignTrade.DataEntity.InvoiceExportContracts,LZL.ForeignTrade.DataEntity" />
                        <!-- ��Զ��ϵ�� -->
                        <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                        <input type="hidden" name="InvoiceExportContracts��fk" value='ExportContracts' />
                        <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                        <input type="hidden" name="InvoiceExportContracts��pfk" value='Invoice' />
                        <fieldset style="<%=Model.InvoiceExportContracts.Count>0?"": "display: none"%>; width: 95%;">
                            <legend>���ں�ͬ��Ϣ</legend>
                            <ul id="ckhtxx" style="float: left; width: 100%; clear: both; position: relative;">
                                <%
                                    for (int i = 0; i < Model.InvoiceExportContracts.Count(); i++)
                                    {
                                        var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                        var script = @"$(this).parent().remove();display('InvoiceExportContracts��','ckhtxx')";
                                        Response.Write(string.Format(htmlstr,
                                            @"<input type='checkbox' name='ExportContracts��ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() + "' />",
                                            Html.ActionLink(Model.InvoiceExportContracts.ElementAt(i).ExportContracts.Name, "Details", "ExportContracts", new { id = Model.InvoiceExportContracts.ElementAt(i).ExportContracts.ID.ToString() }, null)));
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- ���۵���Ϣ -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="�� ��" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Invoice/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table class="list" width="100%" id="tabs-2">
            <caption>
                ��Ʒ��Ϣ��̬����
            </caption>
            <%
                Model.ProductSummary.Load();
            %>
            <!-- ��Ʒ��Ϣ -->
            <tr id="ProductSummary��" style="<%=Model.ProductSummary.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <%
                        if (Model.ProductSummary.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductSummary.Count);
                            viewdictionary2.Add("FK", "Invoice");//���۵���Ϣ
                            Html.RenderPartial("ProductSummaryControl", Model.ProductSummary.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- ��Ʒ��Ϣ -->
        </table>
    </div>
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openckht('InvoiceExportContracts��','ExportContracts��ID','ckhtxx','<%=Url.Action("Details","Price")%>');"
        class="button">���ں�ͬ</a> <a href="#" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary��',1,'Invoice')"
            class="button">��Ʒ��Ϣ</a>
</asp:Content>
