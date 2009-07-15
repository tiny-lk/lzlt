<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="TitlePrice" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӱ��۵�
</asp:Content>
<asp:Content ID="MainPrice" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/ui/ui.draggable.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.bgiframe.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/ui/ui.dialog.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

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

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Price��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Price��objectname" value="LZL.ForeignTrade.DataEntity.Price,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            ��Ʒ��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle">
                    ���۵�������Ϣ
                </td>
                <td align="right" style="width: 20%;">
                    ���۵��ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��Name")%>
                </td>
                <td align="right" style="width: 20%;">
                    ���۵����ڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��Date")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���۱��֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��CurrencyType")%>
                </td>
                <td align="right">
                    �۸����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��PriceClause")%>
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
                    <%= Html.TextBox("Price��ClauseType")%>
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
                    <%= Html.TextBox("Price��TansportCountry")%>
                </td>
                <td align="right">
                    ���˸ۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��StartHaven")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ת�˸ۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��EdnHaven")%>
                </td>
                <td align="right">
                    Ŀ�ĸۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��TransportMode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���䷽ʽ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Price��TransportMode")%>
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
                    <%= Html.TextBox("Price��PriceType")%>
                </td>
                <td align="right">
                    �ܱ��۽�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseQuote")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ܰ�װ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClausePackNumber")%>
                </td>
                <td align="right">
                    ��װ��λ��Ӣ�ģ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseUnitEN")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ë�أ�KG����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseWeight")%>
                </td>
                <td align="right">
                    �ܾ��أ�KG����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseNetWeight")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������CBM����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseBulk")%>
                </td>
                <td align="right">
                    ��Ʒ��������
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseNumber")%>
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
                </td>
                <td align="right">
                    ��˾��ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("_Price��CompanyID")%><!-- "-"��ʾ���������ֵ -->
                    <%= Html.Hidden("Price��CompanyID")%>
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
            <!-- ��Ʒ��Ϣ -->
            <tr id="PriceProduct��" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        �����ͻ���Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='0' name="PriceProduct��regioncount" id="PriceProduct��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="PriceProduct��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="PriceProduct��objectname" value="LZL.ForeignTrade.DataEntity.PriceProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="PriceProduct��fk" value='Product' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="PriceProduct��pfk" value='Price' />
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
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Price/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        } %>
</asp:Content>
<asp:Content ID="ChildContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="opengys('PriceProduct��','Product��ID','01','spxx','<%=Url.Action("Details","Product")%>');">
        ������Ʒ��Ϣ</a></li>
</asp:Content>
