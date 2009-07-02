<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    客户信息
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
        客户信息</h2>
    <table width="100%" style="vertical-align: middle; text-align: center;">
        <thead>
            <tr>
                <td colspan="2">
                    <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="客户代码", Value ="NameCode"},
                            new SelectListItem(){Text="客户中文名称", Value ="NameCn"},
                             new SelectListItem(){Text="客户英文名称", Value ="NameEn"},
                             new SelectListItem(){ Text="中文地址", Value ="Address"},
                             new SelectListItem(){ Text ="英文地址", Value ="AddressEn"}
                        }, "Value", "Text", "NameCode"))%>
                </td>
                <td colspan="4">
                    <%= Html.TextBox("queryvalue", "", new { style = "width:95%;" })%>
                </td>
                <td colspan="3">
                    <input type="button" id="OK" value="查 询" disabled="disabled" />
                    <input type="button" id="Edit" value="编 辑" disabled="disabled" />
                    <input type="button" id="Delet" value="删 除" disabled="disabled" />
                    <input type="button" value="刷 新" onclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Index") %>'" />
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    选择
                </td>
                <td>
                    序号
                </td>
                <td>
                    客户代码
                </td>
                <td>
                    客户中文名称
                </td>
                <td>
                    客户英文名称
                </td>
                <td>
                    电话
                </td>
                <td>
                    客户类型
                </td>
                <td>
                    是否共享
                </td>
                <td>
                    操作
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
                
            %>
            <tr ondblclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Details/"+Html.Encode(Model[i].ID)) %>'"
                title="双击查看详细信息">
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
                    <%= Html.Encode(Model[i].IsShare ? "是" : "否")%>
                </td>
                <td>
                    <%= Html.ActionLink("删除", "Delete", new { id = Html.Encode(Model[i].ID) })%>
                </td>
            </tr>
            <%
                }
            
            %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="9" align="right">
                    <a href="#" onclick="print();">打 印</a>|
                    <%
                        int count = int.Parse(ViewData["pagecount"].ToString());
                        int p = Request["page"] == null ? 1 : int.Parse(Request["page"]);
                        if (p == count && count <= 1)
                        {
                            Response.Write("上一页|下一页");
                        }
                        else
                        {
                            if (p < count)
                            {
                                Response.Write("上一页|" + Html.ActionLink("下一页", "Index", "Costomer", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("上一页", "Index", "Costomer", new { page = p - 1 }, null) + "|下一页");
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
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
