<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.MaterialBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ԭ������Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("MaterialBuy��YclType", "�������");
            autocompletedictionary("MaterialBuy��BColor", "������ɫ");
            autocompletedictionary("MaterialBuy��LwColor", "������ɫ");
            autocompletedictionary("MaterialBuy��SpColor", "������ɫ");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="MaterialBuy��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="MaterialBuy��objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("MaterialBuy��ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%">
    <caption>ԭ������Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MateriaBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    ԭ<br />
                    ��<br />
                    ��
                </td>
                <td align="right">
                    ��ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��YclNo", Html.Encode(Model.YclNo), new { validate = "required:true" })%>
                </td>
                <td align="right">
                    ���
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��YclType", Html.Encode(Model.YclType))%><a href="#"
                        onclick="LoadDictionaryPanel('�������',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �ɷ֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��YclCf", Html.Encode(Model.YclCf))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BWeight", Html.Encode(Model.BWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BColor", Html.Encode(Model.BColor))%><a href="#" onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BCount", Html.Encode(Model.BCount), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BPrice", Html.Encode(Model.BPrice), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��Bgh", Html.Encode(Model.Bgh))%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right" rowspan="2">
                    ��<br />
                    ��
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��LwWeight", Html.Encode(Model.LwWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��LwColor", Html.Encode(Model.LwColor))%><a href="#"
                        onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��LwCount", Html.Encode(Model.LwCount), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��LwPrice", Html.Encode(Model.LwPrice), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��LwGh", Html.Encode(Model.LwGh))%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right" rowspan="2">
                    ��<br />
                    Ƭ
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��SpWeight", Html.Encode(Model.SpWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��SpColor", Html.Encode(Model.SpColor))%><a href="#"
                        onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��SpCount", Html.Encode(Model.SpCount), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��SpPrice", Html.Encode(Model.SpPrice), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��SpGh", Html.Encode(Model.SpGh))%>
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
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MateriaBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
