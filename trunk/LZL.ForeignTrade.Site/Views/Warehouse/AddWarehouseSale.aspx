<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <% using (Html.BeginForm())
       { %>
    <div id="region">
        <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
        <input type="hidden" name="region" value="WarehouseSale��" />
        <!-- ��ʶ�ӱ�ʵ������� -->
        <input type="hidden" name="WarehouseSale��objectname" value="LZL.ForeignTrade.DataEntity.WarehouseSale,LZL.ForeignTrade.DataEntity" />
        <%= Html.Hidden("WarehouseSale��iscreatedate", "CreateDate")%>
        <%= Html.Hidden("WarehouseSale��iseditdate", "EditDate")%>
    </div>
    <%
        Response.Write(Html.Hidden("WarehouseSale��propertyobject", ViewData["FK"]));
        Response.Write(Html.Hidden("WarehouseSale��propertyobjectvalue", ViewData["id"]));
    %>
    <table class="list" width="100%">
        <caption>
            ������Ϣ</caption>
        <tr>
            <td align="center" rowspan="3" style="width: 10%;">
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
        <!-- ����������� -->
        <tr id="ColorWarehouseSale��" style="display: none;">
            <td colspan="5">
            </td>
        </tr>
        <!-- ����������� -->
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
    <a href="#" onclick="addcontrol(this,'ColorWarehouseSale','ColorWarehouseSale��',1,'WarehouseSale','type=<%=Request["type"]%>')"
        class="button4">
        <% 
            if (Request["type"] == "1")
            {
                Response.Write("����ԭ����");
            }
            else
            {
                Response.Write("��������");
            }             
        %></a>
</asp:Content>
