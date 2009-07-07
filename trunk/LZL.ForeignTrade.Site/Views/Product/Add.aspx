<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �����Ʒ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �����Ʒ��Ϣ</h2>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Product��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Product��objectname" value="LZL.ForeignTrade.DataEntity.Product,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Costomer/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle">
                    ��Ʒ������Ϣ
                </td>
                <td align="right">
                    ��Ʒ���루��ƣ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��NameCode")%>
                </td>
                <td align="right">
                    �������ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��NameCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��NameEH")%>
                </td>
                <td align="right">
                    ���Ĺ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��SpecCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�Ĺ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��SpecEN")%>
                </td>
                <td align="right">
                    ���ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��UnitCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��UnitEN")%>
                </td>
                <td align="right">
                    ���ش��룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��CustomsCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ���룺
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Product��BarCode")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="6" valign="middle">
                    ��Ʒ��װ
                </td>
                <td align="right">
                    ��װ��Ʒ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackAmount")%>
                </td>
                <td align="right">
                    ���İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackUnitCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackUnitEN")%>
                </td>
                <td align="right">
                    ��װ����(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackLength")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackWidth")%>
                </td>
                <td align="right">
                    ��װ�߶�(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackHeight")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CBM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackBulk")%>
                </td>
                <td align="right">
                    ��װë��(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackGrossWeight")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ����(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackNetWeight")%>
                </td>
                <td align="right">
                    �ں���Ʒ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��BoxAmount")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ں����ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��BoxUnitCH")%>
                </td>
                <td align="right">
                    �ں�Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��BoxUnitEN")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="4" valign="middle">
                    ������Ϣ
                </td>
                <td align="right">
                    ��Ʒ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��TypeCode")%>
                </td>
                <td align="right">
                    �Ƿ���
                </td>
                <td align="left">
                    <%= Html.CheckBox("Product��IsShare",false)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ����������
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��DescriptionCH", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ƷӢ��������
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��DescriptionEN", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��Ϣ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��Note", new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <tr id="Linkman��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ��ϵ������ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Product/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li>��Ӧ����Ϣ</li>
    <li>�ͻ���Ʒ��Ϣ</li>
    <li>��ƷͼƬ</li>
</asp:Content>
