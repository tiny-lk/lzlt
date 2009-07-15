<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Price>>" %>

<asp:Content ID="TitlePrice" ContentPlaceHolderID="TitleContent" runat="server">
    报价单信息
</asp:Content>
<asp:Content ID="MainPrice" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        报价单信息</h2>
    <table width="100%" style="vertical-align: middle; text-align: center;">
        <thead>
            <tr>
                <td colspan="2">
                    <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="报价单号", Value ="Name"}
                        }, "Value", "Text", "Name"))%>
                </td>
                <td colspan="6" align="left">
                    <%= Html.TextBox("queryvalue", "", new {style="width:330px;" })%>
                    <div style="float: right;">
                        <input type="button" id="OK" value="查 询" disabled="disabled" />
                        <input type="button" id="Edit" value="编 辑" disabled="disabled" check="1" />
                        <input type="button" id="Delete" value="删 除" disabled="disabled" check="n" />
                        <input type="button" id="Refresh" value="刷 新" />
                    </div>
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
                    报价单号
                </td>
                <td>
                    报价日期
                </td>
                <td>
                    客户代码
                </td>
                <td>
                    报价单类型
                </td>
                <td>
                    公司名称
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
            %>
            <tr ondblclick="javascript:window.location.href ='<%=Url.Content("~/Product/Details/"+Html.Encode(Model[i].ID)) %>'"
                title="双击查看详细信息">
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString())})%>
                </td>
                <td>
                    <%= (beginenumber+i).ToString()%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].Name)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].Date)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].CustomerID)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].PriceType)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].CompanyID)%>
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
                        if (p >= count && count <= 1)
                        {
                            Response.Write("上一页|下一页");
                        }
                        else
                        {
                            if (p < count)
                            {
                                Response.Write("上一页|" + Html.ActionLink("下一页", "Index", "Product", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("上一页", "Index", "Product", new { page = p - 1 }, null) + "|下一页");
                            }
                        }
                        Response.Write("|当前页：第 <span style='font-weight:bolder; color:Red;'>" + p + "</span> 页|总页码：<span style='font-weight:bolder; color:Red;'>" + count + "</span> 页");
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="ChildContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
