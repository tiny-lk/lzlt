<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��Ӹ���
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("AccessoriesBuy��ZbColor", "������ɫ");
            autocompletedictionary("AccessoriesBuy��ZbSize", "����");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="AccessoriesBuy��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="AccessoriesBuy��objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption>
            ������Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                    <%= Html.Hidden("AccessoriesBuy��iscreatedate", "CreateDate")%>
                    <%= Html.Hidden("AccessoriesBuy��iseditdate", "EditDate")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ţ�
                </td>
                <td align="left" colspan="5">
                    <%= Html.TextBox("AccessoriesBuy��AccessoriesNo", "", new { validate = "required:true", style = "width: 500px" })%>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    �� ��
                </td>
                <td align="right">
                    ���ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy��Zbmc")%>
                </td>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy��ZbColor")%><a href="#" onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy��ZbCount", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy��ZbSize")%><a href="#" onclick="LoadDictionaryPanel('����',true,this)">ѡ��</a>
                </td>
                <td>
                </td>
            </tr>
            <!-- ������������ -->
            <tr id="AccessoriesChildBuy��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ������������ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ContentPlaceHolderID="ChildActionContent" ID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'OtherAccessories','AccessoriesChildBuy��',1,'AccessoriesBuy')"
        class="button">��������</a>
</asp:Content>
