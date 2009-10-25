<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.AccessoriesBuy>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    辅料采购
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
                var State = confirm('你确认要删除' + $(document).data('checkvalue') + '吗？');
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

        //查询数据信息
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
            辅料采购</caption>
        <thead>
            <tr>
                <td colspan="2">
                    <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="编 号", Value ="AccessoriesNo"},
                            new SelectListItem(){ Text="名 称", Value ="Zbmc"}
                        }, "Value", "Text", "AccessoriesNo"))%>
                </td>
                <td colspan="8" align="left">
                    <%= Html.TextBox("queryvalue", "", new { style = "width:50%;" })%>
                    <input type="button" id="OK" value="查 询" disabled="disabled" />
                    <input type="button" id="AddSale" value="生产信息" disabled="disabled" check="1" />
                    <input type="button" id="Add" value="添加" />
                    <input type="button" id="Edit" value="编 辑" disabled="disabled" check="1" />
                    <input type="button" id="Delete" value="删 除" disabled="disabled" check="n" />
                    <input type="button" id="Refresh" value="刷 新" />
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
                    编号
                </td>
                <td>
                    主标名称
                </td>
                <td>
                    主标颜色
                </td>
                <td>
                    主标数量
                </td>
                <td>
                    主标尺码
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
            %>
            <tr ondblclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/DetailsAccessories/"+Html.Encode(Model[i].ID)) %>'"
                title="双击查看详细信息">
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
                    <a href="#" onclick="print();">打 印</a>|
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
                                Response.Write("上一页|" + Html.ActionLink("下一页", "AccessoriesBuy", "Warehouse", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("上一页", "AccessoriesBuy", "Warehouse", new { page = p - 1 }, null) + "|下一页");
                            }
                        }
                        Response.Write("|当前页：第 <span style='font-weight:bolder; color:Red;'>" + p + "</span> 页|总页码：<span style='font-weight:bolder; color:Red;'>" + count + "</span> 页");
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        }
    %>
</asp:Content>
