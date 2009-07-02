<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    �ͻ���Ϣ
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="../../Scripts/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.PrintArea.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletevalue($("#quyerCondition").val());
            $("#quyerCondition").bind("change", function() {
                $("#queryvalue").unbind(".autocomplete");
                $("#queryvalue").val("");
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
                    $('form').submit();
                }
            });
        });

        function checked(obj) {
            alert(obj);
        }
        function print() {
            $("table > tbody").printArea(" <table width='100%' style='vertical-align: middle; text-align: center;'></table>");
        }

        function autocompletevalue(f) {
            $("#queryvalue").autocomplete('<%=Url.Action("GetAutocompleteValue","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    scrollHeight: 300,
                    dataType:
                'json',
                    extraParams: { t: "Customer", f: f },
                    parse: function(data) {
                        var rows = [];
                        for (var i = 0; i < data.length; i++) {
                            rows[rows.length] = { data: data[i],
                                value: data[i], result: data[i]
                            };
                        } return rows;
                    }, formatItem: function(row, i,
                n) { return row; }
                });
        } </script>

    <% using (Html.BeginForm())
       { %>
    <h2>
        �ͻ���Ϣ</h2>
    <table width="100%" style="vertical-align: middle; text-align: center;">
        <thead>
            <tr>
                <td colspan="2">
                    <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="�ͻ�����", Value ="NameCode"},
                            new SelectListItem(){Text="�ͻ���������", Value ="NameCn"},
                             new SelectListItem(){Text="�ͻ�Ӣ������", Value ="NameEn"},
                             new SelectListItem(){ Text="���ĵ�ַ", Value ="Address"},
                             new SelectListItem(){ Text ="Ӣ�ĵ�ַ", Value ="AddressEn"}
                        }, "Value", "Text", "NameCode"))%>
                </td>
                <td colspan="4">
                    <%= Html.TextBox("queryvalue", "", new { style = "width:95%;" })%>
                </td>
                <td colspan="3">
                    <input type="button" id="OK" value="�� ѯ" disabled="disabled" />
                    <input type="button" id="Edit" value="�� ��" disabled="disabled" />
                    <input type="button" id="Delet" value="ɾ ��" disabled="disabled" />
                    <input type="button" value="ˢ ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Index") %>'" />
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    ѡ��
                </td>
                <td>
                    ���
                </td>
                <td>
                    �ͻ�����
                </td>
                <td>
                    �ͻ���������
                </td>
                <td>
                    �ͻ�Ӣ������
                </td>
                <td>
                    �绰
                </td>
                <td>
                    �ͻ�����
                </td>
                <td>
                    �Ƿ���
                </td>
                <td>
                    ����
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
                
            %>
            <tr ondblclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Details/"+Html.Encode(Model[i].ID)) %>'"
                title="˫���鿴��ϸ��Ϣ">
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString()), onclick="checked(this);" })%>
                </td>
                <td>
                    <%= (beginenumber+i).ToString()%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].NameCode)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].NameCn)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].NameEn)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].Phone)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].TypeCode)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].IsShare ? "��" : "��")%>
                </td>
                <td>
                    <%= Html.ActionLink("ɾ��", "Delete", new { id = Html.Encode(Model[i].ID) })%>
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
                        if (p == count && count <= 1)
                        {
                            Response.Write("��һҳ|��һҳ");
                        }
                        else
                        {
                            if (p < count)
                            {
                                Response.Write("��һҳ|" + Html.ActionLink("��һҳ", "Index", "Costomer", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("��һҳ", "Index", "Costomer", new { page = p - 1 }, null) + "|��һҳ");
                            }
                        }
                        Response.Write("|��ǰҳ���� <span style='font-weight:bolder; color:Red;'>" + p + "</span> ҳ|��ҳ�룺<span style='font-weight:bolder; color:Red;'>" + count + "</span> ҳ");
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        }
    %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
