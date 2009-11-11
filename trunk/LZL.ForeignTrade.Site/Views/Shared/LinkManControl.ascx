<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Linkman>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="Linkman��regioncount"
        id="Linkman��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Linkman��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Linkman��objectname" value="LZL.ForeignTrade.DataEntity.Linkman,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="Linkman��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
    <%= Html.Hidden("Linkman��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Linkman��iseditdate", "EditDate")%>
    <center>
        <h3>
            ��ϵ�˶�̬����</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#Linkman��').css("display", "");
        });

    </script>

</div>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<div id="regioncontent">
    <table class="dynamictable">
        <%
            if (Model == null)
            {
                Response.Write(Html.Hidden("Linkman��ID"));
            }
            else
            {
                Response.Write(Html.Hidden("Linkman��ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" valign="middle" rowspan="4" style="width: 10%;">
                ��ϵ����Ϣ
            </td>
            <td align="right" style="width: 15%;">
                ��ϵ�ˣ�
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman��Name", "", new { validate = "required:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman��Name", Html.Encode(Model[i].Name), new { validate = "required:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Name));
                        }
                    }
                %>
            </td>
            <td align="right" style="width: 15%;">
                ְλ��
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman��Job"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman��Job", Html.Encode(Model[i].Job)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Job));
                        }
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
                        Response.Write(Html.TextBox("Linkman��Phone"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman��Phone", Html.Encode(Model[i].Phone)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Phone));
                        }
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
                        Response.Write(Html.TextBox("Linkman��Fax"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman��Fax", Html.Encode(Model[i].Fax)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Fax));
                        }
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
                        Response.Write(Html.TextBox("Linkman��MobilePhone"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman��MobilePhone", Html.Encode(Model[i].MobilePhone)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].MobilePhone));
                        }
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
                        Response.Write(Html.TextBox("Linkman��Email", "", new { validate = "email:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman��Email", Html.Encode(Model[i].Email), new { validate = "email:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Email));
                        }
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
                        Response.Write(Html.TextArea("Linkman��Note", new { style = "width: 99%; height: 80px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("Linkman��Note", Html.Encode(Model[i].Note), new { style = "width: 99%; height: 80px;" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Note));
                        }
                    }
                %>
            </td>
        </tr>
        <%
            if (ViewData["Details"] == null)
            {
        %>
        <tr>
            <td colspan="5" align="right">
                <input type="button" class="button" value="�� ��" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="ɾ ��" onclick="deleteregion(this);" />
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%  
    }
%>
