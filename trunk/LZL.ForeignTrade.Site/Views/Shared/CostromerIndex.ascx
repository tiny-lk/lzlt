<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).removeData("checkvalue");
        $("#allselect").bind("click", function() {
            $.each($('table > tbody > tr').find("input[type='checkbox']"), function(i, o) {
                if ($(o).attr("checked") != true) {
                    $(o).click();
                }
            })
        });
        autocompletevalue($("#quyerCondition").val());
        $("#quyerCondition").bind("change", function() {
            $("#queryvalue").unbind(".autocomplete");
            $("#queryvalue").val("");
            autocompletevalue($(this).val());
        });

        $("#queryvalue").bind("blur", function() {
            if ($("#queryvalue").val() == "") {
                $("#query").attr("disabled", "disabled");
            }
            else {
                $("#query").attr("disabled", "");
            }
        });

        $("#reverseselect").bind("click", function() {
            $('table > tbody > tr').find("input[type='checkbox']").click();
        });

        //��ѯ
        $("#query").bind("click", function() {
            var queryobject = this;
            $.ajax({
                type: "get",
                dataType: "html",
                data: { quyerCondition: $("#quyerCondition").val(), queryvalue: $("#queryvalue").val(), page: 1 },
                url: '<%=Url.Action("CostromerIndex","Shared")%>',
                success: function(data) {
                    $(queryobject).closest("table").find("tbody[listmouse='listmouseovercss']").html("");
                    $(queryobject).closest("table").append($(data).find("tbody[listmouse='listmouseovercss']").html());
                },
                error: function(err) {
                    alert("��ѯ����");
                }
            });
        });
        //
    });

    function autocompletevalue(f) {
        $("#queryvalue").autocomplete('<%=Url.Action("GetAutocompleteValue","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    scrollHeight: 300,
                    dataType: 'json',
                    extraParams: { t: "Customer", f: f },
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

<table width="100%" id="custromerindex">
    <thead>
        <tr>
            <td colspan="2">
                <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="�ͻ�����", Value ="NameCode"},
                            new SelectListItem(){Text="�ͻ���������", Value ="NameCn"},
                         new SelectListItem(){Text="�ͻ�Ӣ������", Value ="NameEn"},
                        }, "Value", "Text", "NameCode"))%>
            </td>
            <td colspan="2">
                <%= Html.TextBox("queryvalue", "", new {style="width:330px;" })%>
                <div style="float: right;">
                    <input type="button" value="�� ѯ" id="query" disabled="disabled" />
                </div>
            </td>
        </tr>
        <tr align="center">
            <td>
                <a href="#" id="allselect">ȫѡ</a>/<a href="#" id="reverseselect">��ѡ</a>
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
        </tr>
    </thead>
    <tbody listmouse='listmouseovercss'>
        <%         
            for (int i = 0; i < Model.Count; i++)
            {
        %>
        <tr align="center">
            <td>
                <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString() + "|"+ Html.Encode(Model[i].NameCode)) })%>
            </td>
            <td>
                <%=Html.Encode(Model[i].NameCode) %>
            </td>
            <td>
                <%=Html.Encode(Model[i].NameCn ) %>
            </td>
            <td>
                <%=Html.Encode(Model[i].NameEn ) %>
            </td>
        </tr>
        <%
            } 
        %>
    </tbody>
</table>
