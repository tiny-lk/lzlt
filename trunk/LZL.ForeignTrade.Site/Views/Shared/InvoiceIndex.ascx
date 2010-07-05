<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Invoice>>" %>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).data("checkvalue", "");
        $(document).data("check", 0);
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

        //查询
        $("#OK").live("click", function() {
            loadlistdata(this, $("#quyerCondition").val(), $("#queryvalue").val(), 1);
            $(document).data("checkvalue", "");
            $(document).data("check", 0);
        });

        $("#Delete").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var data = $(document).data('checkvalue').split("♂");
                var ids = "";
                $.each(data, function(i, o) {
                    ids += o.substr(0, o.indexOf("|")) + "♂";
                });
                ids = $.trim(ids.substr(0, ids.length - 1));
                var State = confirm('你确认要删除 ' + ids + ' 吗？');
                if (State == true) {
                    window.location.href = '<%=Url.Action("Delete","Invoice")%>' + '/' + ids;
                }
            }
        });

        $("#Edit").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var id = $(document).data('checkvalue').substr(0, $(document).data('checkvalue').indexOf("|"));
                window.location.href = '<%=Url.Action("Edit","Invoice")%>' + '/' + id;
            }
        });

        $("#BusinessInvoice").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var id = $(document).data('checkvalue').substr(0, $(document).data('checkvalue').indexOf("|"));

                window.open('<%=Url.Action("BusinessInvoice","Invoice")%>' + '/' + id);
            }
        });

        $("#PackingList").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var id = $(document).data('checkvalue').substr(0, $(document).data('checkvalue').indexOf("|"));
                window.open('<%=Url.Action("PackingList","Invoice")%>' + '/' + id);
            }
        });
        
        $("#Declaration").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var id = $(document).data('checkvalue').substr(0, $(document).data('checkvalue').indexOf("|"));
                window.open('<%=Url.Action("Declaration","Invoice")%>' + '/' + id);
            }
        });

        $("#Ckhwmxd").live("click", function() {
            if ($(document).data('checkvalue') != null && $(document).data('checkvalue') != "") {
                var id = $(document).data('checkvalue').substr(0, $(document).data('checkvalue').indexOf("|"));
                window.open('<%=Url.Action("Ckhwmxd","Invoice")%>' + '/' + id);
            }
        });
        
        $("#Refresh").live("click", function() {
            loadlistdata(this, "", "", 1);
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


    //查询数据信息
    function loadlistdata(obj, name, value, p) {
        var tableobject = $(obj).closest("table");
        $.ajax({
            type: "get",
            dataType: "html",
            data: { quyerCondition: name, queryvalue: encodeURI(value), page: p },
            url: '<%=Url.Action("InvoiceIndex","Shared")%>',
            success: function(data) {
                $(tableobject).find("tfoot").html("");
                $(tableobject).find("tfoot").append($(data).find("tfoot").html());
                $(tableobject).find("tbody").html("");
                $(tableobject).find("tbody").append($(data).find("tbody").html());
            },
            error: function(err) {
                alert("列表数据错误！");
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
                    extraParams: { t: "Invoice", f: f },
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

<input type="hidden" name="simple" class="simple" value='<%=ViewData["simple"]==null?"":ViewData["simple"].ToString()%>' />
<table width="100%" id="productindex" class="list">
    <caption>
        发票信息</caption>
    <thead>
        <tr>
            <td colspan="2">
                <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="发票号", Value ="Name"},
                            new SelectListItem(){Text="出口合同号", Value ="ExportContractsName"},
                             new SelectListItem(){Text="撤销单号", Value ="RevocationNo"}
                        }, "Value", "Text", "Name"))%>
            </td>
            <td colspan="6" align="left">
                <%= Html.TextBox("queryvalue", "", new {style="width:330px;" })%>
                <input type="button" class="button" id="OK" value="查 询" disabled="disabled" />
                <input type="button" class="button" id="Refresh" value="刷 新" />
                <% if (ViewData["simple"] == null)
                   {
                %>
                <input type="button" class="button" id="Edit" value="编 辑" disabled="disabled" check="1" />
                <input type="button" class="button" id="Delete" value="删 除" disabled="disabled" check="n" />
                <br />
                <input type="button" id="PackingList" value="装箱单输出" class="button4" disabled="disabled"
                    check="1" />
                <input type="button" class="button4" id="BusinessInvoice" value="商业发票输出" disabled="disabled"
                    check="1" />
                <input type="button" class="button4" id="Declaration" value="报关单输出" disabled="disabled"
                    check="1" />
                <input type="button" class="button4" id="Ckhwmxd" value="出口货物明细" disabled="disabled"
                    check="1" />
                <%
                    }
                %>
            </td>
        </tr>
    </thead>
    <tbody listmouse="listmouseovercss">
        <tr>
            <td>
                <a href="#" id="allselect">全选</a>/<a href="#" id="reverseselect">反选</a>
            </td>
            <td>
                序号
            </td>
            <td>
                发票号
            </td>
            <td>
                发票日期
            </td>
            <td>
                出口合同号
            </td>
            <td>
                撤销单号
            </td>
            <td>
                发票类型
            </td>
        </tr>
        <%
            int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
            int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
            for (int i = 0; i < Model.Count; i++)
            {
        %>
        <tr ondblclick="if($('.simple').val()==''){window.location.href ='<%=Url.Content("~/Invoice/Details/"+Html.Encode(Model[i].ID)) %>';}">
            <td>
                <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString() + "|" + Html.Encode(Model[i].Name)) })%>
            </td>
            <td>
                <%= (beginenumber+i).ToString()%>
            </td>
            <td>
                <%= Html.Encode(Model[i].Name)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].Date.ToShortDateString())%>
            </td>
            <td>
                <%= Html.Encode(Model[i].ExportContractsName)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].RevocationNo)%>
            </td>
            <td>
                <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName( Html.Encode(Model[i].Type))%>
            </td>
        </tr>
        <%
            }
            
        %>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="9" align="right">
                <a href="#" class="print">打 印</a>|
                <%
                    int count = int.Parse(ViewData["pagecount"].ToString());
                    int p = Request["page"] == null ? 1 : int.Parse(Request["page"]);
                    if (p >= count && count <= 1)
                    {
                        Response.Write("上一页|下一页");
                    }
                    else
                    {
                        if (p < count)
                        {
                            if (p == 1)
                            {
                                Response.Write("上一页|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ")>下一页</a>");
                            }
                            else
                            {
                                Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ")>上一页</a>|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ")>下一页</a>");
                            }
                        }
                        else
                        {
                            Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ")>上一页</a>|下一页");
                        }
                    }
                    Response.Write("|当前页：第 <span style='font-weight:bolder; color:Red;'>" + p + "</span> 页|总页码：<span style='font-weight:bolder; color:Red;'>" + count + "</span> 页");
                %>
            </td>
        </tr>
    </tfoot>
</table>
