<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ColorWarehouseSale>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="ColorWarehouseSale��regioncount"
        id="ColorWarehouseSale��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="ColorWarehouseSale��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="ColorWarehouseSale��objectname" value="LZL.ForeignTrade.DataEntity.ColorWarehouseSale,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="ColorWarehouseSale��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "WarehouseSale" :ViewData["FK"] %>' />
    <%= Html.Hidden("ColorWarehouseSale��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("ColorWarehouseSale��iseditdate", "EditDate")%>
    <center>
        <h3>
            �����������</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#ColorWarehouseSale��').css("display", "");
            var details = '<%=ViewData["Details"]%>';
            if (details == "" || details == null) {
                autocompletedictionary("ColorWarehouseSale��Color", "������ɫ");

                $("input[name='_ColorWarehouseSale��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    selectFirst: false,
                    scrollHeight: 300,
                    dataType: 'json',
                    autoFill: false,
                    extraParams: { t: "Customer", f: "NameCode" },
                    parse: function(data) {
                        var rows = [];
                        $.each(data, function(i, o) {
                            rows[rows.length] = { data: o, value: i, result: o
                            };
                        }); return rows;
                    },
                    formatItem: function(row, i, n) {
                        return row;
                    }
                });

                $("input[name='_ColorWarehouseSale��CustomerID']").result(function(event, data, formatted) {
                    if (formatted != "" && formatted != null) {
                        $("input[name='ColorWarehouseSale��CustomerID']").val(formatted);
                    }
                });

                $("input[name='_ColorWarehouseSale��CustomerID']").bind("blur", function() {
                    if ($(this).val() == "" || $(this).val() == null) {
                        $("input[name='ColorWarehouseSale��CustomerID']").val("");
                    }
                });
            }
        });

    </script>

</div>
<%
    string type = ZhouBo.Core.BasicOperate.GetString(ViewData["type"], true);
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    { 
%>
<div id="regioncontent">
    <table class="dynamictable">
        <%
            if (Model == null)
            {
                Response.Write(Html.Hidden("ColorWarehouseSale��ID"));
            }
            else
            {
                Response.Write(Html.Hidden("ColorWarehouseSale��ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" rowspan="4" style="width: 10%;">
                �������
            </td>
            <td align="right" style="width: 15%;">
                ��ţ�
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��ActualStyleID", "", new { validate = "required:true" }));
                        if (type == "1")
                        {
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('ԭ��������',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('��������',true,this)>ѡ��</a>");
                        }
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��ActualStyleID", Html.Encode(Model[i].ActualStyleID), new { validate = "required:true" }));
                            if (type == "1")
                            {
                                Response.Write("<a href=# onclick=LoadDictionaryPanel('ԭ��������',true,this)>ѡ��</a>");
                            }
                            else
                            {
                                Response.Write("<a href=# onclick=LoadDictionaryPanel('��������',true,this)>ѡ��</a>");
                            }
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].ActualStyleID));
                        }
                    }
                %>
            </td>
            <td align="right" style="width: 15%;">
                ��ɫ��
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��ActualColor"));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('������ɫ',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��ActualColor", Html.Encode(Model[i].ActualColor)));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('������ɫ',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].ActualColor));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���룺
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��ActualSize", "", new { validate = "number:true" }));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('����',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��ActualSize", Html.Encode(Model[i].ActualSize), new { validate = "number:true" }));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('����',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].ActualSize));
                        }
                    }
                %>
            </td>
            <td align="right">
                �̳ģ�
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��ActualHotlining"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��ActualHotlining", Html.Encode(Model[i].ActualHotlining)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].ActualHotlining));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ȣ�
            </td>
            <td align="left" colspan="4">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��ActualRatio"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��ActualRatio", Html.Encode(Model[i].ActualRatio)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].ActualRatio));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ע��Ϣ��
            </td>
            <td align="left" colspan="4">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextArea("ColorWarehouseSale��ActualNote", new { style = "width:99%; height:40px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("ColorWarehouseSale��ActualNote", Html.Encode(Model[i].ActualNote), new { style = "width:99%; height:40px;" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].ActualNote));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="center" rowspan="4" style="width: 10%;">
                ʵ�����
            </td>
            <td align="right" style="width: 15%;">
                ��ţ�
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��OrderStyleID", "", new { validate = "required:true" }));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('ԭ��������',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��OrderStyleID", Html.Encode(Model[i].OrderStyleID), new { validate = "required:true" }));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('ԭ��������',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].OrderStyleID));
                        }
                    }
                %>
            </td>
            <td align="right" style="width: 15%;">
                ��ɫ��
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��OrderColor"));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('������ɫ',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��OrderColor", Html.Encode(Model[i].OrderColor)));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('������ɫ',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].OrderColor));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���룺
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��OrderSize", "", new { validate = "number:true" }));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('����',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��OrderSize", Html.Encode(Model[i].OrderSize), new { validate = "number:true" }));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('����',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].OrderSize));
                        }
                    }
                %>
            </td>
            <td align="right">
                �̳ģ�
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��OrderHotlining"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��OrderHotlining", Html.Encode(Model[i].OrderHotlining)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].OrderHotlining));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ȣ�
            </td>
            <td align="left" colspan="4">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ColorWarehouseSale��OrderRatio"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ColorWarehouseSale��OrderRatio", Html.Encode(Model[i].OrderRatio)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].OrderRatio));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ע��Ϣ��
            </td>
            <td align="left" colspan="4">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextArea("ColorWarehouseSale��OrderNote", new { style = "width:99%; height:40px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("ColorWarehouseSale��OrderNote", Html.Encode(Model[i].OrderNote), new { style = "width:99%; height:40px;" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].OrderNote));
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
