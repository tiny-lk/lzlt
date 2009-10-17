<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    主页
</asp:Content>
<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    编号
                </td>
                <td>
                    合同号
                </td>
                <td>
                    客户订单号
                </td>
                <td>
                    客户名称
                </td>
                <td>
                    合同时间
                </td>
                <td>
                    详细
                </td>
            </tr>
            <tbody listmouse="listmouseovercss">
                <%
                    List<LZL.ForeignTrade.DataEntity.ExportContracts> exportsContracts = (List<LZL.ForeignTrade.DataEntity.ExportContracts>)ViewData["pcxx"];
                    for (int i = 0; i < exportsContracts.Count; i++)
                    {
                %>
                <tr>
                    <td>
                        <%= i+1 %>
                    </td>
                    <td>
                        <%= Html.Encode(exportsContracts[i].Name)%>
                    </td>
                    <td>
                        <%= Html.Encode(exportsContracts[i].CustomerNo)%>
                    </td>
                    <td>
                        <%
                            if (exportsContracts[i].CompanyID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(exportsContracts[i].CompanyID);
                                if (obj != null)
                                {
                                    Response.Write(Html.Encode(obj.NameCode));
                                }
                            }
                        %>
                    </td>
                    <td>
                        <%= Html.Encode(exportsContracts[i].Date.ToShortDateString())%>
                    </td>
                    <td>
                        <%=Html.ActionLink("详 细","Details","ExportContracts",new{ID=exportsContracts[i].ID },null) %>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</asp:Content>
