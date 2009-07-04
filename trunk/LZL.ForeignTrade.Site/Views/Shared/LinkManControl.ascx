<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Linkman>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="LinkMan��regioncount"
        id="LinkMan��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="LinkMan��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="LinkMan��objectname" value="LZL.ForeignTrade.DataEntity.Linkman,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="LinkMan��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
    <center>
        <h3>
            ��ϵ�˶�̬����</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#LinkMan��').css("display", "");
        });
    </script>

</div>
<div id="regioncontent">
    <%
        for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
        {
    %>
    <table class="dynamictable">
        <%
            if (Model == null)
            {
                Response.Write(Html.Hidden("LinkMan��ID"));
            }
            else
            {
                Response.Write(Html.Hidden("LinkMan��ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" valign="middle" rowspan="4" style="width: 20%;">
                ��ϵ����Ϣ
            </td>
            <td align="right" style="width: 20%;">
                ��ϵ�ˣ�
            </td>
            <td align="left" style="width: 20%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("LinkMan��Name"));
                    }
                    else
                    {
                        Response.Write(Html.TextBox("LinkMan��Name", Html.Encode(Model[i].Name)));
                    }
                %>
            </td>
            <td align="right" style="width: 20%;">
                ְλ��
            </td>
            <td align="left" style="width: 20%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("LinkMan��Job"));
                    }
                    else
                    {
                        Response.Write(Html.TextBox("LinkMan��Job", Html.Encode(Model[i].Job)));
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                �绰��
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("LinkMan��Phone"));
                    }
                    else
                    {
                        Response.Write(Html.TextBox("LinkMan��Phone", Html.Encode(Model[i].Phone)));
                    }
                %>
            </td>
            <td align="right">
                ���棺
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("LinkMan��Fax"));
                    }
                    else
                    {
                        Response.Write(Html.TextBox("LinkMan��Fax", Html.Encode(Model[i].Fax)));
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                �ƶ��绰��
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("LinkMan��MobilePhone"));
                    }
                    else
                    {
                        Response.Write(Html.TextBox("LinkMan��MobilePhone", Html.Encode(Model[i].MobilePhone)));
                    }
                %>
            </td>
            <td align="right">
                �����ʼ���
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("LinkMan��Email"));
                    }
                    else
                    {
                        Response.Write(Html.TextBox("LinkMan��Email", Html.Encode(Model[i].Email)));
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ϵ�˱�ע��
            </td>
            <td align="left" colspan="3">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextArea("LinkMan��Note", new { style = "width: 99%; height: 80px;" }));
                    }
                    else
                    {
                        Response.Write(Html.TextArea("LinkMan��Note", Html.Encode(Model[i].Note), new { style = "width: 99%; height: 80px;" }));
                    }
                %>
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
</div>
