<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    客户信息
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
        数据正在查询中...</div>
    <% using (Ajax.BeginForm("Costomer", new AjaxOptions()
       {
           LoadingElementId = "loading",
           UpdateTargetId = "tbodyajax",
           HttpMethod = "Post",
           InsertionMode = InsertionMode.InsertBefore
       }))
       { %>
    <h2>
        客户信息</h2>
    <table width="97%" style="vertical-align: middle; text-align: center;">
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
                <td colspan="6">
                    <%= Html.TextBox("queryvalue", "", new { style = "width:95%;" })%>
                </td>
                <td>
                    <input type="submit" value="查 询" />
                </td>
            </tr>
        </thead>
        <tbody id="tbodyajax">
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
                    <%= Html.Encode(Model[i].IsShare ? "是" : "否")%>
                </td>
                <td>
                    <%= Html.ActionLink("详细", "", new { id = Html.Encode(Model[i].ID) })%>|
                    <%= Html.ActionLink("删除", "", new { id = Html.Encode(Model[i].ID) })%>
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
