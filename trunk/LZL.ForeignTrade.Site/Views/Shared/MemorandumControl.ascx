<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        ����¼��̬����</h3>
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="Memorandum��regioncount" id="Memorandum��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Memorandum��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Memorandum��objectname" value="LZL.ForeignTrade.DataEntity.Memorandum,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="LinkMan��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
</center>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<table class="dynamictable">
    <tr>
        <td align="center" valign="middle" rowspan="2" style="width: 20%;">
            ����¼��Ϣ
        </td>
        <td style="width: 20%;" align="right">
            ���ڣ�
        </td>
        <td style="width: 20%;" align="right">
            <input type="text" name="Memorandum��rq" />
        </td>
        <td style="width: 20%;" align="right">
            ���⣺
        </td>
        <td style="width: 20%;" align="right">
            <input type="text" name="Memorandum��zt" />
        </td>
    </tr>
    <tr>
        <td align="right">
            �������ݣ�
        </td>
        <td align="left" colspan="3">
            <textarea name="Memorandum��nr" style="width: 99%; height: 80px;" cols="5"></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="5" align="right">
            <input type="button" value="�� ��" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="ɾ ��" onclick="deleteregion(this);" />
        </td>
    </tr>
</table>
<%
    }
%>