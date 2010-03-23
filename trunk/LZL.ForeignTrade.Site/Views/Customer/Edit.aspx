<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/Customer.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭�ͻ�������Ϣ
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

    <h2>
        �༭�ͻ���Ϣ</h2>
    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Customer��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Customer��objectname" value="LZL.ForeignTrade.DataEntity.Customer,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("Customer��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Customer��iseditdate", "EditDate")%>
    <table width="100%" class="list">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" class="button" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Customer/Index") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Customer��ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td rowspan="8" align="center" valign="middle" style="width: 10%;">
                    �ͻ�������Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    �ͻ����루��ƣ���
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Customer��NameCode", Html.Encode(Model.NameCode), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    �������ƣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Customer��NameCn", Html.Encode(Model.NameCn))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��NameEn", Model.NameEn)%>
                </td>
                <td align="right">
                    �� ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Address", Html.Encode(Model.Address))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��AddressEn", Model.AddressEn)%>
                </td>
                <td align="right">
                    �ǹ������ݣ�
                </td>
                <td align="left">
                    <% =Html.CheckBox("Customer��IsShare",Model.IsShare) %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ң�
                </td>
                <td align="left">
                    <%= Html.DropDownList("Customer��Country", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("����", Html.Encode(Model.Country)), "��ѡ��")%>
                </td>
                <td align="right">
                    ʡ�ݣ��ݣ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Province", Html.Encode(Model.Province))%><a href="#" onclick="LoadDictionaryPanel('ʡ��',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���У�
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��City", Html.Encode(Model.City))%><a href="#" id="test"
                        onclick="LoadDictionaryPanel('����',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    �������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��DakCode", Html.Encode(Model.DakCode))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �绰���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Phone", Html.Encode(Model.Phone))%>
                </td>
                <td align="right">
                    ������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Fax", Html.Encode(Model.Fax))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��վ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��Internet", Html.Encode(Model.Internet), new { validate = "url:true" })%>
                </td>
                <td align="right">
                    �ͻ����
                </td>
                <td align="left">
                    <%= Html.DropDownList("Customer��TypeCode", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("�ͻ�����", Html.Encode(Model.TypeCode)), new { validate = "required:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Customer��Note", Html.Encode(Model.Note), new { style = "width:99%; height:80px;" })%>
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
                    <%= Html.TextBox("Customer��Bank", Html.Encode(Model.Bank))%>
                </td>
                <td align="right">
                    ��&nbsp;&nbsp;&nbsp;&nbsp;����
                </td>
                <td align="left">
                    <%= Html.TextBox("Customer��BankCode", Html.Encode(Model.BankCode), new { validate = "creditcard:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �������е�ַ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Customer��BankAddress", Html.Encode(Model.BankAddress))%>
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <tr id="Linkman��" style="display: none;">
                <td colspan="5">
                    <%
                        Model.Linkman.Load();
                        if (Model.Linkman.Count > 0)
                        {
                            ViewDataDictionary viewdictionary = new ViewDataDictionary();
                            viewdictionary.Add("number", Model.Linkman.Count);
                            Html.RenderPartial("LinkmanControl", Model.Linkman.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <!-- ����¼���� -->
            <tr id="Memorandum��" style="display: none;">
                <td colspan="5">
                    <%
                        Model.Memorandum.Load();
                        if (Model.Memorandum.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.Memorandum.Count);
                            Html.RenderPartial("MemorandumControl", Model.Memorandum.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
        </thead>
        <!-- ����¼���� -->
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
