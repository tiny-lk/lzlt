<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <div id="region">
        <!-- ��ʶ�ӱ�������� -->
        <input type="hidden" value='1' name="WarehouseSale��regioncount" id="WarehouseSale��regioncount" />
        <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
        <input type="hidden" name="region" value="WarehouseSale��" />
        <!-- ��ʶ�ӱ�ʵ������� -->
        <input type="hidden" name="WarehouseSale��objectname" value="LZL.ForeignTrade.DataEntity.WarehouseSale,LZL.ForeignTrade.DataEntity" />
        <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
        <input type="hidden" name="WarehouseSale��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "AccessoriesBuy" :ViewData["FK"] %>' />
        <%= Html.Hidden("WarehouseSale��iscreatedate", "CreateDate")%>
        <%= Html.Hidden("WarehouseSale��iseditdate", "EditDate")%>
    </div>
    <input type="hidden" name="AccessoriesBuy��objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesBuy,LZL.ForeignTrade.DataEntity" />
    <%
        Response.Write(Html.Hidden("region", ViewData["FK"] + "��"));
        Response.Write(Html.Hidden(ViewData["FK"] + "��objectname", "LZL.ForeignTrade.DataEntity." + ViewData["FK"] + ",LZL.ForeignTrade.DataEntity"));
        Response.Write(Html.Hidden(ViewData["FK"] + "��ID", ViewData["id"]));
    %>
    <table class="dynamictable">
        <caption>
            ������Ϣ</caption>
        <tr>
            <td align="center" valign="middle" rowspan="4" style="width: 10%;">
                ������Ϣ
            </td>
            <td align="right" style="width: 15%;">
                �������ڣ�
            </td>
            <td align="left" style="width: 30%;">
                <%=Html.TextBox("WarehouseSale��SaleDate", "", new { validate = "required:true,date:true", Class = "calendar" })%>
            </td>
            <td align="right" style="width: 15%;">
                ����������
            </td>
            <td align="left" style="width: 30%;">
                <%=Html.TextBox("WarehouseSale��SaleCount", "", new { validate = "number:true" })%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���۵��ۣ�
            </td>
            <td align="left">
                <%=Html.TextBox("WarehouseSale��SalePrice", "", new { validate = "number:true" })%>
            </td>
            <td align="right">
                ����������
            </td>
            <td align="left">
                <%=Html.TextBox("WarehouseSale��SaleWeight", "", new { validate = "number:true" })%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��������ţ�
            </td>
            <td align="left" colspan="3">
                <%=Html.TextBox("WarehouseSale��SaleNo")%>
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/WarehouseSale") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
