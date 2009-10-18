<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.SubMaterialBuy>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="SubMaterialBuy��regioncount"
        id="SubMaterialBuy��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="SubMaterialBuy��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="SubMaterialBuy��objectname" value="LZL.ForeignTrade.DataEntity.SubMaterialBuy,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="SubMaterialBuy��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "MaterialBuy" :ViewData["FK"] %>' />
    <%= Html.Hidden("SubMaterialBuy��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("SubMaterialBuy��iseditdate", "EditDate")%>
    <center>
        <h3>
            ԭ����������̬����</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#SubMaterialBuy��').css("display", "");
            var details = '<%=ViewData["Details"]%>';
            if (details=="" || details == null) {
                autocompletedictionary("SubMaterialBuy��Name", "ԭ��������");
                autocompletedictionary("SubMaterialBuy��Color", "������ɫ");

                $("input[name='_SubMaterialBuy��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

                $("input[name='_SubMaterialBuy��CustomerID']").result(function(event, data, formatted) {
                    if (formatted != "" && formatted != null) {
                        $("input[name='SubMaterialBuy��CustomerID']").val(formatted);
                    }
                });

                $("input[name='_SubMaterialBuy��CustomerID']").bind("blur", function() {
                    if ($(this).val() == "" || $(this).val() == null) {
                        $("input[name='SubMaterialBuy��CustomerID']").val("");
                    }
                });
            }
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
                Response.Write(Html.Hidden("SubMaterialBuy��ID"));
            }
            else
            {
                Response.Write(Html.Hidden("SubMaterialBuy��ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" valign="middle" rowspan="5" style="width: 10%;">
                ������Ϣ
            </td>
            <td align="right" style="width: 15%;">
                ���ƣ�
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("SubMaterialBuy��Name", "", new { validate = "required:true" }));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('ԭ��������',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("SubMaterialBuy��Name", Html.Encode(Model[i].Name), new { validate = "required:true" }));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('ԭ��������',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Name));
                        }
                    }
                %>
            </td>
            <td align="right" style="width: 15%;">
                ������
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("SubMaterialBuy��Weight", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("SubMaterialBuy��Weight", Html.Encode(Model[i].Weight), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Weight));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ɫ��
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("SubMaterialBuy��Color"));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('������ɫ',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("SubMaterialBuy��Color", Html.Encode(Model[i].Color)));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('������ɫ',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Color));
                        }
                    }
                %>
            </td>
            <td align="right">
                ������
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("SubMaterialBuy��Count", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("SubMaterialBuy��Count", Html.Encode(Model[i].Count), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Count));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���ۣ�
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("SubMaterialBuy��Price", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("SubMaterialBuy��Price", Html.Encode(Model[i].Price), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Price));
                        }
                    }
                %>
            </td>
            <td align="right">
                �׿ڣ�
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("SubMaterialBuy��Gangkou"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("SubMaterialBuy��Gangkou", Html.Encode(Model[i].Gangkou)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Gangkou));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                �ͻ���Ϣ��
            </td>
            <td align="left" colspan="3">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("_SubMaterialBuy��CustomerID"));
                        Response.Write(Html.Hidden("SubMaterialBuy��CustomerID"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            if (Model[i].CustomerID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model[i].CustomerID);
                                if (obj != null)
                                {
                                    Response.Write(Html.TextBox("_SubMaterialBuy��CustomerID", obj.NameCode));
                                    Response.Write(Html.Hidden("SubMaterialBuy��CustomerID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_SubMaterialBuy��CustomerID"));
                                    Response.Write(Html.Hidden("SubMaterialBuy��CustomerID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_SubMaterialBuy��CustomerID"));
                                Response.Write(Html.Hidden("SubMaterialBuy��CustomerID"));
                            }
                        }
                        else
                        {
                            if (Model[i].CustomerID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model[i].CustomerID);
                                if (obj != null)
                                {
                                    Response.Write(Html.Encode(obj.NameCode));
                                }
                            }
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
                        Response.Write(Html.TextArea("SubMaterialBuy��Note", new { style = "width:99%; height:40px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("SubMaterialBuy��Note", Html.Encode(Model[i].Note), new { style = "width:99%; height:40px;" }));
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
