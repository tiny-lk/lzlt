<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Attachment/Attachment.Master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.TableAttachment>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    资源管理
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
                if ($("#queryvalue").val() != "") {
                    $('form').submit();
                }
            });

            $("#Add").bind("click", function() {
                AddAttachment();
            });

            $("#Delete").bind("click", function() {
                var State = confirm('你确认要删除' + $(document).data('checkvalue') + '吗？');
                if (State == true) {
                    window.location.href = '<%=Url.Content("~/Attachment/DeleteAttachment/") %>' + $(document).data('checkvalue');
                }
            });

            $("#Refresh").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Attachment/AttachmentManager") %>';
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

        function AddAttachment() {
            $("#imagemodedialog").remove();
            $("body").append("<div id='imagemodedialog'></div>");
            $.ajax({
                type: "get",
                dataType: "html",
                url: '<%=Url.Action("AttachmentUpload","Attachment")%>',
                success: function(data) {
                    $("#imagemodedialog").dialog({
                        bgiframe: true,
                        height: 140,
                        modal: true,
                        width: 700,
                        height: 'auto',
                        position: 'center',
                        resizable: true,
                        draggable: true,
                        closeOnEscape: true
                    });
                    $("#imagemodedialog").append(data);
                    $("#imagemodedialog").dialog();
                    $("#imagemodedialog").dialog('open');
                },
                error: function() {
                    alert("添加资源失败！");
                }
            });
        }

    </script>

    <% using (Html.BeginForm())
       { %>
    <table width="100%"  class="list">
        <caption>
            资源管理</caption>
        <thead>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" class="button" id="OK" value="查 询" disabled="disabled" />
                    <input type="button" class="button" id="Add" value="添加" />
                    <input type="button" class="button" id="Delete" value="删 除" disabled="disabled" check="n" />
                    <input type="button" class="button" id="Refresh" value="刷 新" />
                </td>
            </tr>
        </thead>
        <tbody listmouse="listmouseovercss">
            <tr>
                <td>
                    <a href="#" id="allselect">全选</a>/<a href="#" id="reverseselect">反选</a>
                </td>
                <td>
                    编号
                </td>
                <td>
                    资源名称
                </td>
                <td>
                    文件名
                </td>
                <td>
                    文件类型
                </td>
                <td>
                    备注
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
            %>
            <tr ondblclick="javascript:window.location.href ='<%=Url.Content("~/Attachment/ViewAttachment/"+Html.Encode(Model[i].id)) %>'"
                title="双击查看详细信息">
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].id.ToString())})%>
                </td>
                <td>
                    <%= (beginenumber+i).ToString()%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].KeyName)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].FileName)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].FileExt)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].Notes)%>
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
                                Response.Write("上一页|" + Html.ActionLink("下一页", "AttachmentManager", "Attachment", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("上一页", "AttachmentManager", "Attachment", new { page = p - 1 }, null) + "|下一页");
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
