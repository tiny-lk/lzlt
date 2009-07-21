<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Price>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/ui/ui.draggable.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.bgiframe.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/ui/ui.dialog.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js")%>"></script>

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
            $.validator.setDefaults();

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

            $($("form")).validate({
                rules: {
                    Price��Name: {
                        required: true
                    }
                },
                messages: {
                    Price��Name: {
                        required: "���۵��Ų���Ϊ�գ�"
                    }
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
        <caption>
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
                <%= Html.Hidden("Price��ID", Html.Encode(Model.ID.ToString()))%>
                <td rowspan="5" align="center" valign="middle">
                    ���۵�������Ϣ
                </td>
                <td align="right" style="width: 20%;">
                    ���۵��ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��Name",Html.Encode( Model.Name))%>
                </td>
                <td align="right" style="width: 20%;">
                    ���۵����ڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��Date",Html.Encode(Model.Date))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���۱��֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��CurrencyType", Html.Encode(Model.CurrencyType))%>
                </td>
                <td align="right">
                    �۸����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��PriceClause", Html.Encode(Model.PriceClause))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �۸������˵����
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Price��PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ʽ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Price��ClauseType", Html.Encode(Model.ClauseType))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ʽ����˵����
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Price��ClauseTypeNote", Html.Encode(Model.ClauseTypeNote), new { style = "width:99%; height:40px;" })%>
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
                    <%= Html.TextBox("Price��TansportCountry", Html.Encode(Model.TansportCountry))%>
                </td>
                <td align="right">
                    ���˸ۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��StartHaven", Html.Encode(Model.StartHaven))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ת�˸ۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��TransferHaven", Html.Encode(Model.TransferHaven))%>
                </td>
                <td align="right">
                    Ŀ�ĸۿڣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��EdnHaven", Html.Encode(Model.EdnHaven))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���䷽ʽ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Price��TransportMode", Html.Encode(Model.TransportMode))%>
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
                    <%= Html.TextBox("Price��PriceType", Html.Encode(Model.PriceType))%>
                </td>
                <td align="right">
                    �ܱ��۽�
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseQuote", Html.Encode(Model.ClauseQuote))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ܰ�װ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClausePackNumber", Html.Encode(Model.ClausePackNumber))%>
                </td>
                <td align="right">
                    ��װ��λ��Ӣ�ģ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseUnitEN", Html.Encode(Model.ClauseUnitEN))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ë�أ�KG����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseWeight", Html.Encode(Model.ClauseWeight))%>
                </td>
                <td align="right">
                    �ܾ��أ�KG����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseNetWeight", Html.Encode(Model.ClauseNetWeight))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������CBM����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseBulk", Html.Encode(Model.ClauseBulk))%>
                </td>
                <td align="right">
                    ��Ʒ��������
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseNumber", Html.Encode(Model.ClauseNumber))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ�ܵ�λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseUnit", Html.Encode(Model.ClauseUnit))%>
                </td>
                <td align="right">
                    ��Ʒ������<br />
                    ����ͬ��λ����
                </td>
                <td align="left">
                    <%= Html.TextBox("Price��ClauseNotUnit", Html.Encode(Model.ClauseNotUnit))%>
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
                    <%
                        if (Model.CustomerID != null)
                        {
                            var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model.CustomerID);
                            Response.Write(Html.TextBox("_Price��CustomerID", obj.NameCode));
                            Response.Write(Html.Hidden("Price��CustomerID", obj.ID.ToString()));
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_Price��CustomerID"));
                            Response.Write(Html.Hidden("Price��CustomerID"));
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
                            Response.Write(Html.TextBox("_Price��CompanyID", obj.Name));
                            Response.Write(Html.Hidden("Price��CompanyID", obj.ID.ToString()));
                        }
                        else
                        {
                            Response.Write(Html.TextBox("_Price��CompanyID"));
                            Response.Write(Html.Hidden("Price��CompanyID"));
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��Ϣ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Price��Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
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
            <!-- ��Ʒ��Ϣ -->
            <tr id="PriceProduct��" style="text-align: left; <%=Model.PriceProduct.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        �����ͻ���Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='<%= Model.PriceProduct.Count %>' name="PriceProduct��regioncount" id="PriceProduct��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="PriceProduct��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="PriceProduct��objectname" value="LZL.ForeignTrade.DataEntity.PriceProduct,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="PriceProduct��fk" value='Product' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="PriceProduct��pfk" value='Price' />
                    <fieldset style="width: 95%; <%=Model.PriceProduct.Count>0?"": "display: none"%>;">
                        <legend>��Ʒ��Ϣ</legend>
                        <ul id="spxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < Model.PriceProduct.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('PriceProduct��','spxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Product��ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.PriceProduct.ElementAt(i).Product.ID.ToString() + "' />",
                                        Html.ActionLink(Model.PriceProduct.ElementAt(i).Product.NameCode, "Details", "Product", new { id = Model.PriceProduct.ElementAt(i).Product.ID.ToString() }, null)));
                                }
                            %>
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
        }
    %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="opengys('PriceProduct��','Product��ID','01','spxx','<%=Url.Action("Details","Product")%>');">
        ������Ʒ��Ϣ</a></li>
</asp:Content>
