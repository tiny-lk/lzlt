<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        ��ϵ�˶�̬����</h3>
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="LinkMan��regioncount"
        id="LinkMan��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="LinkMan��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="LinkMan��objectname" value="LZL.ForeignTrade.DataEntity.Linkman,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="LinkMan��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
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
            <input type="text" name="LinkMan��Name" />
        </td>
        <td align="right" style="width: 20%;">
            ְλ��
        </td>
        <td align="left" style="width: 20%;">
            <input type="text" name="LinkMan��Job" />
        </td>
    </tr>
    <tr>
        <td align="right">
            �绰��
        </td>
        <td align="left">
            <input type="text" name="LinkMan��Phone" />
        </td>
        <td align="right">
            ���棺
        </td>
        <td align="left">
            <input type="text" name="LinkMan��Fax" />
        </td>
    </tr>
    <tr>
        <td align="right">
            �ƶ��绰��
        </td>
        <td align="left">
            <input type="text" name="LinkMan��MobilePhone" />
        </td>
        <td align="right">
            �����ʼ���
        </td>
        <td align="left">
            <input type="text" name="LinkMan��Email" />
        </td>
    </tr>
    <tr>
        <td align="right">
            ��ϵ�˱�ע��
        </td>
        <td align="left" colspan="3">
            <textarea name="LinkMan��Note" style="width: 99%; height: 80px;" cols="5"></textarea>
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