<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Price/Price.master" Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Price>>" %>

<asp:Content ID="TitlePrice" ContentPlaceHolderID="TitleContent" runat="server">
    ���۵���Ϣ
</asp:Content>
<asp:Content ID="MainPrice" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ���۵���Ϣ</h2>
    <table width="100%" style="vertical-align: middle; text-align: center;">
        <thead>
            <tr>
                <td colspan="2">
                    <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="���۵���", Value ="Name"}
                        }, "Value", "Text", "Name"))%>
                </td>
                <td colspan="6" align="left">
                    <%= Html.TextBox("queryvalue", "", new {style="width:330px;" })%>
                    <div style="float: right;">
                        <input type="button" id="OK" value="�� ѯ" disabled="disabled" />
                        <input type="button" id="Edit" value="�� ��" disabled="disabled" check="1" />
                        <input type="button" id="Delete" value="ɾ ��" disabled="disabled" check="n" />
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
                    ���۵���
                </td>
                <td>
                    ��������
                </td>
                <td>
                    �ͻ�����
                </td>
                <td>
                    ���۵�����
                </td>
                <td>
                    ��˾����
                </td>
            </tr>
            <%
                int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
                for (int i = 0; i < Model.Count; i++)
                {
            %>
            <tr ondblclick="javascript:window.location.href ='<%=Url.Content("~/Product/Details/"+Html.Encode(Model[i].ID)) %>'"
                title="˫���鿴��ϸ��Ϣ">
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
                                Response.Write("��һҳ|" + Html.ActionLink("��һҳ", "Index", "Product", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("��һҳ", "Index", "Product", new { page = p - 1 }, null) + "|��һҳ");
                            }
                        }
                        Response.Write("|��ǰҳ���� <span style='font-weight:bolder; color:Red;'>" + p + "</span> ҳ|��ҳ�룺<span style='font-weight:bolder; color:Red;'>" + count + "</span> ҳ");
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="ChildContent" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
