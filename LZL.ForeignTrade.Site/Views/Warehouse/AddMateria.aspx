<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���ԭ����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ���ԭ����</h2>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Materia��YclType", "�������");
            autocompletedictionary("Materia��BColor", "������ɫ");
            autocompletedictionary("Materia��LwColor", "������ɫ");
            autocompletedictionary("Materia��SpColor", "������ɫ");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Materia��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Materia��objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    ԭ����
                </td>
                <td align="right">
                    ��ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��YclNo", "", new { validate = "required:true" })%>
                </td>
                <td align="right">
                    ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��YclType")%><a href="#" onclick="LoadDictionaryPanel('�������',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �ɷ֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��YclCf")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��BWeight", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��BColor")%><a href="#" onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��BCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��BPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��Bgh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    ��
                    ��
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��LwWeight", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��LwColor")%><a href="#" onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��LwCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��LwPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��LwGh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    ��
                    Ƭ
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��SpWeight", "", new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��SpColor")%><a href="#" onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��SpCount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��SpPrice", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Materia��SpGh")%>
                </td>
                <td colspan="2">
                </td>
            </tr>
        </thead>
        <!-- ����¼���� -->
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
