<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.autocomplete.js")%>"></script>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.PrintArea.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).removeData("checkvalue");
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
            loadlistdata(this, $("#quyerCondition").val(), $("#queryvalue").val(), 1, '<%=Request["type"] %>');
        });

        $("#Delete").bind("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var data = $(document).data('checkvalue').split("��");
                var ids = "";
                $.each(data, function(i, o) {
                    ids += o.substr(0, o.indexOf("|")) + "��";
                });
                ids = $.trim(ids.substr(0, ids.length - 1));
                var State = confirm('��ȷ��Ҫɾ�� ' + ids + ' ��');
                if (State == true) {
                    window.location.href = '<%=Url.Action("Delete","Customer")%>' + '/' + ids;
                }
            }
        });

        $("#Edit").bind("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var id = $(document).data('checkvalue').substr(0, $(document).data('checkvalue').indexOf("|"));
                window.location.href = '<%=Url.Action("Edit","Customer")%>' + '/' + id;
            }
        });

        $("#Refresh").bind("click", function() {
            loadlistdata(this, "", "", 1, '<%=Request["type"]%>');
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

    //��ѯ������Ϣ
    function loadlistdata(obj, name, value, p, t) {
        var tableobject = $(obj).closest("table");
        $.ajax({
            type: "get",
            dataType: "html",
            data: { quyerCondition: name, queryvalue: encodeURI(value), page: p, type: t },
            url: '<%=Url.Action("CustomerIndex","Shared")%>',
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

    function print() {
        var queryobject = this;
        $(queryobject).closest("table > tbody ").printArea(" <table width='100%' style='vertical-align: middle; text-align: center;'></table>");
    }

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

<input type="hidden" name="simple" value='<% =ViewData["simple"]%>' />
<table width="100%" style="vertical-align: middle; text-align: center;">
    <caption>
        �ͻ���Ϣ</caption>
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
            <td colspan="6" align="left">
                <%= Html.TextBox("queryvalue", "", new {style="width:330px;" })%>
                <div style="float: right;">
                    <input type="button" id="OK" value="�� ѯ" disabled="disabled" />
                    <% if (ViewData["simple"] == null)
                       {
                    %>
                    <input type="button" id="Edit" value="�� ��" disabled="disabled" check="1" />
                    <input type="button" id="Delete" value="ɾ ��" disabled="disabled" check="n" />
                    <%
                        }
                    %>
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
        </tr>
        <%
            int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
            int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
            for (int i = 0; i < Model.Count; i++)
            {
        %>
        <tr ondblclick="if($('#simple').val()==''){window.location.href ='<%=Url.Content("~/Customer/Details/"+Html.Encode(Model[i].ID)) %>';}">
            <td>
                <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString() + "|" + Html.Encode(Model[i].NameCode)) })%>
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
                            Response.Write("��һҳ|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ",'" + Request["type"] + "')>��һҳ</a>");
                        }
                        else
                        {
                            Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ",'" + Request["type"] + "')>��һҳ</a>|��һҳ");
                        }
                    }
                    Response.Write("|��ǰҳ���� <span style='font-weight:bolder; color:Red;'>" + p + "</span> ҳ|��ҳ�룺<span style='font-weight:bolder; color:Red;'>" + count + "</span> ҳ");
                %>
            </td>
        </tr>
    </tfoot>
</table>
