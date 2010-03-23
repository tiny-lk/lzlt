<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/Customer.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӿͻ���Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("Customer��Province", "ʡ��");
            autocompletedictionary("Customer��City", "����");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Customer��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Customer��objectname" value="LZL.ForeignTrade.DataEntity.Customer,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Customer��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Customer��iseditdate", "EditDate")%>
    <table width="100%"  class="list">
        <caption>
            ��ӿͻ���Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="8" align="center" valign="middle" style="width: 10%;">
                    �ͻ�������Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    �ͻ����루��ƣ���
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Customer��NameCode", "", new { validate = "required:true"})%>
                </td>
                <td align="right" style="width: 15%;">
                    �������ƣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Customer��NameCn")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��NameEn")%>
                </td>
                <td align="right">
                    �� ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Address")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��AddressEn")%>
                </td>
                <td align="right">
                    �ǹ������ݣ�
                </td>
                <td align="left">
                    <% =Html.CheckBox("Customer��IsShare")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ң�
                </td>
                <td align="left">
                    <%= Html.DropDownList("Customer��Country", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("����"), "��ѡ��")%>
                </td>
                <td align="right">
                    ʡ�ݣ��ݣ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Province")%><a href="#" onclick="LoadDictionaryPanel('ʡ��',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���У�
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��City")%><a href="#" id="test" onclick="LoadDictionaryPanel('����',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��DakCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �绰���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Phone")%>
                </td>
                <td align="right">
                    ������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Fax")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��վ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Internet", "", new { validate = "url:true" })%>
                </td>
                <td align="right">
                    �ͻ����
                </td>
                <td align="left">
                    <%= Html.DropDownList("Customer��TypeCode", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("�ͻ�����"), new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Customer��Note", new { style = "width:99%; height:80px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" valign="middle" rowspan="2">
                    ������Ϣ
                </td>
                <td align="right">
                    �������У�
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Bank")%>
                </td>
                <td align="right">
                    ��&nbsp;&nbsp;&nbsp;&nbsp;����
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��BankCode", "", new { validate = "creditcard:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������е�ַ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Customer��BankAddress")%>
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <tr id="Linkman��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <!-- ����¼���� -->
            <tr id="Memorandum��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ����¼���� -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'LinkmanControl','Linkman��',1,'Customer')" class="button4">
        �����ϵ��</a> <a href="#" onclick="addcontrol(this,'MemorandumControl','Memorandum��',1,'Customer')"
            class="button4">��ӱ���¼</a>
</asp:Content>
