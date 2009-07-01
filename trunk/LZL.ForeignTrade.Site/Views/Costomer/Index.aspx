<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    �ͻ���Ϣ
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="../../Scripts/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../../Scripts/jquery.autocomplete.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletevalue($("#quyerCondition").val());
            $("#quyerCondition").bind("change", function() {
                $("#queryvalue").unbind(".autocomplete");
                $("#queryvalue").val("");
                autocompletevalue($(this).val());
            });
        });

        function autocompletevalue(f) {
            $("#queryvalue").autocomplete('<%=Url.Action("GetAutocompleteValue","Shared")%>',
            {
                max: 20,
                highlight: false,
                multiple: false,
                scroll: true,
                scrollHeight: 300,
                dataType: 'json',
                extraParams: { t: "Customer", f: f },
                parse: function(data) {
                    var rows = [];
                    for (var i = 0; i < data.length; i++) {
                        rows[rows.length] = {
                            data: data[i],
                            value: data[i],
                            result: data[i]
                        };
                    }
                    return rows;
                },
                formatItem: function(row, i, n) {
                    return row;
                }
            });
        }
    </script>

    <div id="loading">
        �������ڲ�ѯ��...</div>
    <% using (Ajax.BeginForm("Costomer", new AjaxOptions()
       {
           LoadingElementId = "loading",
           UpdateTargetId = "tbodyajax",
           HttpMethod = "Post",
           InsertionMode = InsertionMode.InsertBefore
       }))
       { %>
    <h2>
        �ͻ���Ϣ</h2>
    <table width="97%" style="vertical-align: middle; text-align: center;">
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
                <td colspan="6">
                    <%= Html.TextBox("queryvalue", "", new { style = "width:95%;" })%>
                </td>
                <td>
                    <input type="submit" value="�� ѯ" />
                </td>
            </tr>
        </thead>
        <tbody id="tbodyajax">
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
                for (int i = 0; i < Model.Count; i++)
                {
                
            %>
            <tr>
                <td>
                    <%= Html.CheckBox("select", false)%>
                </td>
                <td>
                    <%= ((i + 1) * page).ToString()%>
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
                    <%= Html.ActionLink("��ϸ", "", new { id = Html.Encode(Model[i].ID) })%>|
                    <%= Html.ActionLink("ɾ��", "", new { id = Html.Encode(Model[i].ID) })%>
                </td>
            </tr>
            <%
                }
            
            %>
        </tbody>
    </table>
    <%
        }
    %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
