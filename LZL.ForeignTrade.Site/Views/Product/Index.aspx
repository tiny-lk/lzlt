<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Product>>" %>

<asp:Content ID="ProductTitle" ContentPlaceHolderID="TitleContent" runat="server">
    ��Ʒ��Ϣ
</asp:Content>
<asp:Content ID="ProductMain" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.PrintArea.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#queryvalue").val("");
            autocompletevalue($("#quyerCondition").val());
            $("#quyerCondition").bind("change", function() {
                $("#queryvalue").unbind(".autocomplete");
                $("#queryvalue").val("");
                $("#OK").attr("disabled", "disabled");
                autocompletevalue($(this).val());
            });

            $("#queryvalue").bind("blur", function() {
                if ($("#queryvalue").val() == "") {
                    $("#OK").attr("disabled", "disabled");
                }
                else {
                    $("#OK").attr("disabled", "");
                }
            });

            $("#OK").bind("click", function() {
                if ($("#queryvalue").val() != "") {
                    var url = '<%=Url.Action("Index","Product")%>' + "?quyerCondition=" + $("#quyerCondition").val();
                    url += "&queryvalue=" + encodeURI($("#queryvalue").val());
                    window.location.href = url;
                }
            });

            $("#Delete").bind("click", function() {
                var State = confirm('��ȷ��Ҫɾ��' + $(document).data('checkvalue') + '��');
                if (State == true) {
                    window.location.href = '<%=Url.Action("Delete","Product")%>' + $(document).data('checkvalue');
                }
            });

            $("#Edit").bind("click", function() {
                window.location.href = '<%=Url.Action("Edit","Product")%>' + $(document).data('checkvalue');
            });

            $("#Refresh").bind("click", function() {
                window.location.href = '<%=Url.Action("Index","Product")%>';
            });

            $("#allselect").bind("click", function() {
                $.each($('table > tbody > tr').find("input[type='checkbox']"), function(i, o) {
                    if ($(o).attr("checked") != true) {
                        $(o).click();
                    }
                })
            });

            $("#reverseselect").bind("click", function() {
                $('table > tbody > tr').find("input[type='checkbox']").click();
            });

        });

        function print() {
            $("table > tbody").printArea(" <table width='100%' style='vertical-align: middle; text-align: center;'></table>");
        }

        function selecthandler() {
            $('table > tbody > tr').find("input[type='checkbox']").click();
        }

        function autocompletevalue(f) {
            $("#queryvalue").autocomplete('<%=Url.Action("GetAutocompleteValue","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    scrollHeight: 300,
                    dataType: 'json',
                    extraParams: { t: "Product", f: f },
                    parse: function(data) {
                        var rows = [];
                        for (var i = 0; i < data.length; i++) {
                            rows[rows.length] = { data: data[i],
                                value: data[i], result: data[i]
                            };
                        } return rows;
                    },
                    formatItem: function(row, i, n) { return row; }
                });
        } 
    </script>

    <h2>
        ��Ʒ��Ϣ</h2>
    <table width="100%" style="vertical-align: middle; text-align: center;">
        <thead>
            <tr>
                <td colspan="2">
                    <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="�ͻ�����", Value ="NameCode"},
                            new SelectListItem(){Text="�ͻ���������", Value ="NameCH"},
                             new SelectListItem(){Text="�ͻ�Ӣ������", Value ="NameEH"},
                             new SelectListItem(){ Text="��Ʒ����", Value ="CustomsCode"},
                             new SelectListItem(){ Text ="�ͻ�����", Value ="TypeCode"}
                        }, "Value", "Text", "NameCode"))%>
                </td>
                <td colspan="6" align="left">
                    <%= Html.TextBox("queryvalue", "", new {style="width:330px;" })%>
                    <div style="float: right;">
                        <input type="button" id="OK" value="�� ѯ" disabled="disabled" />
                        <input type="button" id="Edit" value="�� ��" disabled="disabled" check="1" />
                        <input type="button" id="Delete" value="ɾ ��" disabled="disabled" check="n" />
                        <input type="button" id="Refresh" value="ˢ ��" />
                    </div>
                </td>
            </tr>
        </thead>
        <tbody listmouse="listmouseovercss">
            <tr>
                <td>
                    <a href="#" id="allselect">ȫѡ</a>/<a href="#" id="reverseselect">��ѡ</a>
                </td>
                <td>
                    ���
                </td>
                <td>
                    �ͻ�����
                </td>
                <td>
                    ��������
                </td>
                <td>
                    Ӣ������
                </td>
                <td>
                    ��Ʒ����
                </td>
                <td>
                    �ͻ�����
                </td>
                <td>
                    �Ƿ���
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
            %>
            <tr>
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString())})%>
                </td>
                <td>
                    <%= (beginenumber+i).ToString()%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].NameCode)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].NameCH)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].NameEH)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].CustomsCode)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].TypeCode)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].IsShare ? "��" : "��")%>
                </td>
            </tr>
            <%
                }
            
            %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="9" align="right">
                    <a href="#" onclick="print();">�� ӡ</a>|
                    <%
                        int count = int.Parse(ViewData["pagecount"].ToString());
                        int p = Request["page"] == null ? 1 : int.Parse(Request["page"]);
                        if (p >= count && count <= 1)
                        {
                            Response.Write("��һҳ|��һҳ");
                        }
                        else
                        {
                            if (p < count)
                            {
                                Response.Write("��һҳ|" + Html.ActionLink("��һҳ", "Index", "Product", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("��һҳ", "Index", "Product", new { page = p - 1 }, null) + "|��һҳ");
                            }
                        }
                        Response.Write("|��ǰҳ���� <span style='font-weight:bolder; color:Red;'>" + p + "</span> ҳ|��ҳ�룺<span style='font-weight:bolder; color:Red;'>" + count + "</span> ҳ");
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="ProductChildAction" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
