<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        ����¼��̬����</h3>
    <input type="hidden" value="1" name="bwl��regioncount" id="bwl��regioncount" /><!-- ��ʶ�ӱ�������� -->
    <input type="hidden" name="region" value="bwl��" /><!-- ��ʶ�ӱ��������� -->
    <input type="hidden" name="bwl��objectname" value="LZL.ForeignTrade.DataEntity,LZL.ForeignTrade.DataEntity.Memorandum" /><!-- ��ʶ�ӱ����� -->
    
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
            <input type="text" name="bwl��rq" />
        </td>
        <td style="width: 20%;" align="right">
            ���⣺
        </td>
        <td style="width: 20%;" align="right">
            <input type="text" name="bwl��zt" />
        </td>
    </tr>
    <tr>
        <td align="right">
            �������ݣ�
        </td>
        <td align="left" colspan="3">
            <textarea name="bwl��nr" style="width: 99%; height: 80px;" cols="5"></textarea>
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