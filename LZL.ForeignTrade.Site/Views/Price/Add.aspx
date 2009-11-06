<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitlePrice" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӱ��۵�
</asp:Content>
<asp:Content ID="MainPrice" ContentPlaceHolderID="MainContent" runat="server">

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
                    alert("��ӱ�����ʧ�ܣ�");
                }
            });
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_Price��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_Price��CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Price��CustomerID']").val(formatted);
                }
            });

            $("input[name='_Price��CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Price��CustomerID']").val("");
                }
            });

            $("input[name='_Price��CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

            $("input[name='_Price��CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='Price��CompanyID']").val(formatted);
                }
            });

            $("input[name='_Price��CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='Price��CompanyID']").val("");
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Price��CurrencyType", "��������");
            autocompletedictionary("Price��PriceClause", "�۸�����");
            autocompletedictionary("Price��ClauseType", "���ʽ");
            autocompletedictionary("Price��TansportCountry", "�ۿ�");
            autocompletedictionary("Price��StartHaven", "�ۿ�");
            autocompletedictionary("Price��TransferHaven", "�ۿ�");
            autocompletedictionary("Price��EdnHaven", "�ۿ�");
            autocompletedictionary("Price��TransportMode", "���䷽ʽ");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Price��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Price��objectname" value="LZL.ForeignTrade.DataEntity.Price,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Price��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Price��iseditdate", "EditDate")%>
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">���۵���Ϣ</a></li>
            <li><a href="#tabs-2">��Ʒ��Ϣ</a></li>
            <li><a href="#tabs-3">��Ʒ��װ��Ϣ</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption>
                ���۵���Ϣ</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="�� ��" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                        ���۵�������Ϣ
                    </td>
                    <td align="right" style="width: 15%;">
                        ���۵��ţ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Price��Name", "", new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ���۵����ڣ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("Price��Date", "", new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���۱��֣�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��CurrencyType")%><a href="#" onclick="LoadDictionaryPanel('��������',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �۸����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��PriceClause")%><a href="#" onclick="LoadDictionaryPanel('�۸�����',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �۸������˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price��PriceClauseNote", new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Price��ClauseType")%><a href="#" onclick="LoadDictionaryPanel('���ʽ',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ����˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price��ClauseTypeNote", new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" valign="middle">
                        �������
                    </td>
                    <td align="right">
                        �˵ֹ���
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��TansportCountry")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        ���˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��StartHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ת�˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��TransferHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        Ŀ�ĸۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��EdnHaven")%><a href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���䷽ʽ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("Price��TransportMode")%>
                        <a href="#" onclick="LoadDictionaryPanel('���䷽ʽ',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        ��Ʒ��Ϣͳ�ƻ���
                    </td>
                    <td align="right">
                        ���۵����ͣ�
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Price��PriceType", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���۵�����"), "��ѡ��")%>
                    </td>
                    <td align="right">
                        �ܱ��۽�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClauseQuote", "", new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ܰ�װ������
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClausePackNumber", "", new { validate = "digits:true" })%>
                    </td>
                    <td align="right">
                        ��װ��λ��Ӣ�ģ���
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("Price��ClauseUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ë�أ�KG����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClauseWeight", "", new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        �ܾ��أ�KG����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClauseNetWeight", "", new { validate = "number:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �������CBM����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClauseBulk", "", new { validate = "number:true" })%>
                    </td>
                    <td align="right">
                        ��Ʒ��������
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClauseNumber", "", new { validate = "digits:true" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʒ�ܵ�λ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClauseUnit")%>
                    </td>
                    <td align="right">
                        ��Ʒ������<br />
                        ����ͬ��λ����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("Price��ClauseNotUnit")%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="2" valign="middle">
                        ������Ϣ
                    </td>
                    <td align="right">
                        ѡ��ͻ���
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Price��CustomerID")%><!-- "-"��ʾ���������ֵ -->
                        <%=Html.Hidden("Price��CustomerID")%>
                        <% Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>ѡ��</a>");%>
                    </td>
                    <td align="right">
                        ��˾��ƣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("_Price��CompanyID")%><!-- "-"��ʾ���������ֵ -->
                        <%= Html.Hidden("Price��CompanyID")%>
                          <%Response.Write("<a href='#'onclick=LoadControlList(this,'CompanyIndex')>ѡ��</a>"); %>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ע��Ϣ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("Price��Note", new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="�� ��" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table width="100%" class="list" id="tabs-2">
            <caption>
                ��Ʒ��Ϣ��̬����
            </caption>
            <!-- ��Ʒ��Ϣ -->
            <tr id="ProductSummary��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ��Ʒ��Ϣ -->
        </table>
        <table width="100%" class="list" id="tabs-3">
            <caption>
                ��Ʒ��װ��Ϣ��̬����
            </caption>
            <!-- ��Ʒ��װ��Ϣ -->
            <tr id="ProductPack��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ��Ʒ��װ��Ϣ -->
        </table>
    </div>
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary��',1,'Price')"
        class="button">��Ʒ��Ϣ</a><a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack��',1,'Price')"
            class="button">��Ʒ��װ</a>
</asp:Content>
