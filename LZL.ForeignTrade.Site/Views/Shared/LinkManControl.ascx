<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        ��ϵ�˶�̬����</h3>
    <input type="hidden" value="1" name="lxr��regioncount" id="lxr��regioncount" /><!-- ��ʶ�ӱ�������� -->
    <input type="hidden" name="region" value="lxr��" /><!-- ��ʶ�ӱ��������� -->
    <input type="hidden" name="lxr��objectname" value="LZL.ForeignTrade.DataEntity,LZL.ForeignTrade.DataEntity.Linkman" /><!-- ��ʶ�ӱ�������� -->
</center>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<table class="dynamictable">
    <tr>
        <td align="center" valign="middle" rowspan="4" style="width: 20%;">
            ��ϵ����Ϣ
        </td>
        <td align="right" style="width: 20%;">
            ��ϵ�ˣ�
        </td>
        <td align="left" style="width: 20%;">
            <input type="text" name="lxr��name" />
        </td>
        <td align="right" style="width: 20%;">
            ְλ��
        </td>
        <td align="left" style="width: 20%;">
            <input type="text" name="lxr��zw" />
        </td>
    </tr>
    <tr>
        <td align="right">
            �绰��
        </td>
        <td align="left">
            <input type="text" name="lxr��dh" />
        </td>
        <td align="right">
            ���棺
        </td>
        <td align="left">
            <input type="text" name="lxr��cz" />
        </td>
    </tr>
    <tr>
        <td align="right">
            �ƶ��绰��
        </td>
        <td align="left">
            <input type="text" name="lxr��yddh" />
        </td>
        <td align="right">
            �����ʼ���
        </td>
        <td align="left">
            <input type="text" name="lxr��dzyj" />
        </td>
    </tr>
    <tr>
        <td align="right">
            ��ϵ�˱�ע��
        </td>
        <td align="left" colspan="3">
            <textarea name="lxr��bz" style="width: 99%; height: 80px;" cols="5"></textarea>
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