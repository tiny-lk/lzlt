<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӿͻ���Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <h2>
        ��ӿͻ���Ϣ</h2>
    <% using (Html.BeginForm())
       { %>
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:history.back(1);" />
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="7" align="center" valign="middle">
                    �ͻ�������Ϣ
                </td>
                <td align="right">
                    �ͻ����루��ƣ���
                </td>
                <td align="left">
                    <%= Html.TextBox("khdmjc")%>
                </td>
                <td align="right">
                    �������ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("zwmc")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("ywmc")%>
                </td>
                <td align="right">
                    Ӣ�ĵ�ַ��
                </td>
                <td align="left">
                    <%= Html.TextBox("ywdz")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ң�
                </td>
                <td align="left">
                    <%= Html.TextBox("gj")%>
                </td>
                <td align="right">
                    ʡ�ݣ��ݣ���
                </td>
                <td align="left">
                    <%= Html.TextBox("sf")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���У�
                </td>
                <td align="left">
                    <%= Html.TextBox("cs")%>
                </td>
                <td align="right">
                    ���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("yzbm")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �绰���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("dhhm")%>
                </td>
                <td align="right">
                    ������룺
                </td>
                <td align="left">
                    <%= Html.TextBox("czhm")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��վ��
                </td>
                <td align="left">
                    <%= Html.TextBox("wzdz")%>
                </td>
                <td align="right">
                    �ͻ����
                </td>
                <td align="left">
                    <%= Html.TextBox("khlb")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("bz", new { style = "width:99%; height:80px;" })%>
                </td>
            </tr>
            <tr>
                <td align="center" valign="middle">
                    ������Ϣ
                </td>
                <td align="right">
                    �������У�
                </td>
                <td align="left">
                    <%= Html.TextBox("kfhy")%>
                </td>
                <td align="right">
                    ��&nbsp;&nbsp;&nbsp;&nbsp;����
                </td>
                <td align="left">
                    <%= Html.TextBox("yhzh")%>
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <tr id="lxr��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ��ϵ������ -->
            <!-- ����¼���� -->
            <tr id="bwl��" style="display: none;">
                <td colspan="5">
                </td>
            </tr>
            <!-- ����¼���� -->
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:history.back(1);" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="addcontrol(this,'LinkManControl','lxr��')">�����ϵ����Ϣ</a></li>
    <li><a href="#" onclick="addcontrol(this,'MemorandumControl','bwl��')">����¼</a></li>
</asp:Content>
