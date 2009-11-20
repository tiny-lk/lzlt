<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.AccessoriesChildBuy>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="AccessoriesChildBuy��regioncount"
        id="AccessoriesChildBuy��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="AccessoriesChildBuy��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="AccessoriesChildBuy��objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesChildBuy,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="AccessoriesChildBuy��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "AccessoriesBuy" :ViewData["FK"] %>' />
    <%= Html.Hidden("AccessoriesChildBuy��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("AccessoriesChildBuy��iseditdate", "EditDate")%>
    <center>
        <h3>
            ����������̬����</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#AccessoriesChildBuy��').css("display", "");
            var details = '<%=ViewData["Details"]%>';
            if (details == "" || details == null) {
                $("input[name='_AccessoriesChildBuy��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
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

                $("input[name='_AccessoriesChildBuy��CustomerID']").result(function(event, data, formatted) {
                    if (formatted != "" && formatted != null) {
                        $("input[name='AccessoriesChildBuy��CustomerID']").val(formatted);
                    }
                });

                $("input[name='_AccessoriesChildBuy��CustomerID']").bind("blur", function() {
                    if ($(this).val() == "" || $(this).val() == null) {
                        $("input[name='AccessoriesChildBuy��CustomerID']").val("");
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
                Response.Write(Html.Hidden("AccessoriesChildBuy��ID"));
            }
            else
            {
                Response.Write(Html.Hidden("AccessoriesChildBuy��ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" rowspan="4" style="width: 10%;">
                ����������Ϣ
            </td>
            <td align="right" style="width: 15%;">
                ���ͣ�
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy��AccessoriesType", "", new { validate = "required:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy��AccessoriesType", Html.Encode(Model[i].AccessoriesType), new { validate = "required:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].AccessoriesType));
                        }
                    }
                %>
            </td>
            <td align="right" style="width: 15%;">
                ���ƣ�
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy��AccessoriesName", "", new { validate = "required:true" }));
                        Response.Write("<a href=# onclick=LoadDictionaryPanel('��������',true,this)>ѡ��</a>");
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy��AccessoriesName", Html.Encode(Model[i].AccessoriesName), new { validate = "required:true" }));
                            Response.Write("<a href=# onclick=LoadDictionaryPanel('��������',true,this)>ѡ��</a>");
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].AccessoriesName));
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
                        Response.Write(Html.TextBox("AccessoriesChildBuy��Price", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy��Price", Html.Encode(Model[i].Price), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Price));
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
                        Response.Write(Html.TextBox("AccessoriesChildBuy��Count", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy��Count", Html.Encode(Model[i].Count), new { validate = "number:true" }));
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
                ������
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy��Weight", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy��Weight", Html.Encode(Model[i].Weight), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Weight));
                        }
                    }
                %>
            </td>
            <td align="right">
                �ͻ���Ϣ��
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("_AccessoriesChildBuy��CustomerID"));
                        Response.Write(Html.Hidden("AccessoriesChildBuy��CustomerID","", new { copyvalue=true }));
                        Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>ѡ��</a>");
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
                                    Response.Write(Html.TextBox("_AccessoriesChildBuy��CustomerID", obj.NameCode));
                                    Response.Write(Html.Hidden("AccessoriesChildBuy��CustomerID", obj.ID.ToString(), new { copyvalue = true }));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_AccessoriesChildBuy��CustomerID"));
                                    Response.Write(Html.Hidden("AccessoriesChildBuy��CustomerID","", new { copyvalue=true }));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_AccessoriesChildBuy��CustomerID"));
                                Response.Write(Html.Hidden("AccessoriesChildBuy��CustomerID", "", new { copyvalue = true }));
                            }
                            Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>ѡ��</a>");
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
                        Response.Write(Html.TextArea("AccessoriesChildBuy��Note", new { style = "width:99%; height:40px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("AccessoriesChildBuy��Note", Html.Encode(Model[i].Note), new { style = "width:99%; height:40px;" }));
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
