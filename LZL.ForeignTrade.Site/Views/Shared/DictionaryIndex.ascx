<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Dictionary>>" %>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.PrintArea.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).data("checkvalue", "");
        $(document).data("check", 0);
        $("#quyerCondition").bind("change", function() {
            if ($(this).val() != null && $(this).val() != "") {
                loadlistdata(this, $(this).val(), $(this).find("option:selected").text(), 1);
            }
            else {
                loadlistdata(this, "", "", 1);
            }
        });

        $("#Delete").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var data = $(document).data('checkvalue').split("��");
                var ids = "";
                $.each(data, function(i, o) {
                    ids += o.substr(0, o.indexOf("|")) + "��";
                });
                ids = $.trim(ids.substr(0, ids.length - 1));
                var State = confirm('��ȷ��Ҫɾ�� ' + ids + ' ��');
                if (State == true) {
                    window.location.href = '<%=Url.Action("Delete","Dictionary")%>' + '/' + ids;
                }
            }
        });

        $("#Edit").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var id = $(document).data('checkvalue').substr(0, $(document).data('checkvalue').indexOf("|"));
                window.location.href = '<%=Url.Action("Edit","Dictionary")%>' + '/' + id;
            }
        });

        $("#Refresh").live("click", function() {
            var q = '<%=Request["quyerCondition"] %>';
            var v = '<%=Server.UrlDecode(Request["queryvalue"]) %>';
            if (q == "" || q == null) {
                loadlistdata(this, "", "", 1);
            } else {
                loadlistdata(this, q, v, 1);
            }
        });

        $("#allselect").live("click", function() {
            $.each($('table > tbody > tr').find("input[type='checkbox']"), function(i, o) {
                if ($(o).attr("checked") != true) {
                    $(o).click();
                }
            })
        });

        $("#reverseselect").live("click", function() {
            $('table > tbody > tr').find("input[type='checkbox']").click();
        });

        $(".print").live("click", function() {
            $("table > tbody ").printArea("true");
        });
        
    });

    //��ѯ������Ϣ
    function loadlistdata(obj, name, value, p) {
        var tableobject = $(obj).closest("table");
        $.ajax({
            type: "get",
            dataType: "html",
            data: { quyerCondition: name, queryvalue: encodeURI(value), page: p },
            url: '<%=Url.Action("DictionaryIndex","Shared")%>',
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
</script>

<input type="hidden" name="simple" class="simple" value='<%=ViewData["simple"]==null?"":ViewData["simple"].ToString()%>' />
<table width="100%" style="vertical-align: middle; text-align: center;">
    <caption>
        �����ֶ���Ϣ</caption>
    <thead>
        <tr>
            <td colspan="2">
                <%=Html.DropDownList("quyerCondition", LZL.ForeignTrade.Controllers.DataHelper.GetAllDictionary(Server.UrlDecode(Request["queryvalue"])), "��ѡ��")%>
            </td>
            <td colspan="2" align="left">
                <div style="float: right;">
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
                ����
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
        <tr ondblclick="if($('.simple').val()==''){window.location.href ='<%=Url.Content("~/Dictionary/Details/"+Html.Encode(Model[i].ID)) %>';}">
            <td>
                <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString() + "|" + Html.Encode(Model[i].Name)) })%>
            </td>
            <td>
                <%= (beginenumber+i).ToString()%>
            </td>
            <td>
                <%= Html.Encode(Model[i].Type)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].Name)%>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="9" align="right">
                <a href="#" class="print">�� ӡ</a>|
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
                            Response.Write("��һҳ|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ")>��һҳ</a>");
                        }
                        else
                        {
                            Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ")>��һҳ</a>|��һҳ");
                        }
                    }
                    Response.Write("|��ǰҳ���� <span style='font-weight:bolder; color:Red;'>" + p + "</span> ҳ|��ҳ�룺<span style='font-weight:bolder; color:Red;'>" + count + "</span> ҳ");
                %>
            </td>
        </tr>
    </tfoot>
</table>
