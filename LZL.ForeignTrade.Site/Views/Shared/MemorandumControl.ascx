<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Memorandum>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="Memorandum��regioncount"
        id="Memorandum��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Memorandum��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Memorandum��objectname" value="LZL.ForeignTrade.DataEntity.Memorandum,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="Memorandum��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
    <center>
        <h3>
            ����¼��̬����</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#Memorandum��').css("display", "");
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
                Response.Write(Html.Hidden("Memorandum��ID"));
            }
            else
            {
                Response.Write(Html.Hidden("Memorandum��ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" valign="middle" rowspan="2" style="width: 10%;">
                ����¼��Ϣ
            </td>
            <td style="width: 20%;" align="right">
                ���ڣ�
            </td>
            <td style="width: 25%;" align="right">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Memorandum��Date", "", new { validate = "date:true", Class = "calendar" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Memorandum��Date", Html.Encode(Model[i].Date), new { validate = "date:true", Class = "calendar" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Date));
                        }
                    }
                %>
            </td>
            <td style="width: 20%;" align="right">
                ���⣺
            </td>
            <td style="width: 25%;" align="right">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Memorandum��Subject", "", new { validate = "required:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Memorandum��Subject", Html.Encode(Model[i].Subject), new { validate = "required:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Subject));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                �������ݣ�
            </td>
            <td align="left" colspan="3">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextArea("Memorandum��Note", new { style = "width: 99%; height: 80px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("Memorandum��Note", Model[i].Note, new { style = "width: 99%; height: 80px;" }));
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
                <input type="button" value="�� ��" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="ɾ ��" onclick="deleteregion(this);" />
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
