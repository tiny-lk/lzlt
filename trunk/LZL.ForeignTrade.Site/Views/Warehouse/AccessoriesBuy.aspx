<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.AccessoriesBuy>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���ϲɹ�
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.PrintArea.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
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
                loadlistdata(this, $("#quyerCondition").val(), $("#queryvalue").val(), 1);
                $(document).data("checkvalue", "");
                $(document).data("check", 0);
            });

            $("#Add").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Warehouse/AddAccessories/") %>';
            });

            $("#Delete").bind("click", function() {
                var State = confirm('��ȷ��Ҫɾ��' + $(document).data('checkvalue') + '��');
                if (State == true) {
                    window.location.href = '<%=Url.Content("~/Warehouse/DeleteAccessories/") %>' + $(document).data('checkvalue');
                }
            });

            $("#Edit").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Warehouse/EditAccessories/") %>' + $(document).data('checkvalue');
            });

            $("#AddSale").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Warehouse/AddWarehouseSale/") %>' + $(document).data('checkvalue') + "?type=0";
            });

            $("#Refresh").bind("click", function() {
                loadlistdata(this, "", "", 1);
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

        //��ѯ������Ϣ
        function loadlistdata(obj, name, value, p) {
            var tableobject = $(obj).closest("table");
            $.ajax({
                type: "get",
                dataType: "html",
                data: { quyerCondition: name, queryvalue: encodeURI(value), page: p },
                url: '<%=Url.Action("AccessoriesBuy","Warehouse")%>',
                success: function(data) {
                    $(tableobject).find("tfoot").html("");
                    $(tableobject).find("tfoot").append($(data).find("tfoot").html());
                    $(tableobject).find("tbody").html("");
                    $(tableobject).find("tbody").append($(data).find("tbody").html());
                },
                error: function(err) {
                    alert("�б����ݴ���");
                }
            });
        }

        function autocompletevalue(f) {
            $("#queryvalue").autocomplete('<%=Url.Action("GetAutocompleteValue","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    scrollHeight: 300,
                    dataType: 'json',
                    extraParams: { t: "AccessoriesBuy", f: f },
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

    <% using (Html.BeginForm())
       { %>
    <table width="100%" class="list">
        <caption>
            ���ϲɹ�</caption>
        <thead>
            <tr>
                <td colspan="2">
                    <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="�� ��", Value ="AccessoriesNo"},
                            new SelectListItem(){ Text="�� ��", Value ="Zbmc"}
                        }, "Value", "Text", "AccessoriesNo"))%>
                </td>
                <td colspan="8" align="left">
                    <%= Html.TextBox("queryvalue", "", new { style = "width:50%;" })%>
                    <input type="button" id="OK" value="�� ѯ" disabled="disabled" />
                    <input type="button" id="AddSale" value="������Ϣ" disabled="disabled" check="1" />
                    <input type="button" id="Add" value="���" />
                    <input type="button" id="Edit" value="�� ��" disabled="disabled" check="1" />
                    <input type="button" id="Delete" value="ɾ ��" disabled="disabled" check="n" />
                    <input type="button" id="Refresh" value="ˢ ��" />
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
                    ���
                </td>
                <td>
                    ��������
                </td>
                <td>
                    ������ɫ
                </td>
                <td>
                    ��������
                </td>
                <td>
                    �������
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
            %>
            <tr ondblclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/DetailsAccessories/"+Html.Encode(Model[i].ID)) %>'"
                title="˫���鿴��ϸ��Ϣ">
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString())})%>
                </td>
                <td>
                    <%= (beginenumber+i).ToString()%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].AccessoriesNo)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].Zbmc)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].ZbColor)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].ZbCount)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].ZbSize)%>
                </td>
            </tr>
            <% 
                }
            %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
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
                                Response.Write("��һҳ|" + Html.ActionLink("��һҳ", "AccessoriesBuy", "Warehouse", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("��һҳ", "AccessoriesBuy", "Warehouse", new { page = p - 1 }, null) + "|��һҳ");
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
