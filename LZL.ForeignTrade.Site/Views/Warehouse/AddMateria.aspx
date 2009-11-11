<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���ԭ����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ���ԭ����</h2>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("MaterialBuy��YclType", "�������");
            autocompletedictionary("MaterialBuy��BColor", "������ɫ");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="MaterialBuy��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="MaterialBuy��objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%"  class="list">
        <thead>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="4" style="width: 10%;">
                    ԭ����
                </td>
                <td align="right" style="width: 15%;">
                    ��ţ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("MaterialBuy��YclNo", "", new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    ���
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("MaterialBuy��YclType")%><a href="#" onclick="LoadDictionaryPanel('�������',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ɷ֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��YclCf")%>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BWeight", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BColor")%><a href="#" onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��Bgh")%>
                </td>
            </tr>
            <!-- ������������ -->
            <tr id="SubMaterialBuy��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ������������ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ContentPlaceHolderID="ChildActionContent" ID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'OtherMaterialBuy','SubMaterialBuy��',1,'MaterialBuy')"
        class="button">����ԭ��</a>
</asp:Content>
