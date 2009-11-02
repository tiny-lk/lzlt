<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ProductSummary>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="ProductSummary��regioncount"
        id="ProductSummary��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="ProductSummary��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="ProductSummary��objectname" value="LZL.ForeignTrade.DataEntity.ProductSummary,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="ProductSummary��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Invoice" :ViewData["FK"] %>' />
    <%= Html.Hidden("ProductSummary��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("ProductSummary��iseditdate", "EditDate")%>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#ProductSummary��').css("display", "");
        });
        function toggle(obj) {
            if ($(obj).val() == "�� ��") {
                $(obj).val("չ ��");
            } else {
                $(obj).val("�� ��");
            }
            $(obj).closest("table").find("tbody").toggle("slow");
        }
    </script>

</div>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<div id="regioncontent">
    <table class="dynamictable">
        <tbody>
            <%
                if (Model == null)
                {
                    Response.Write(Html.Hidden("ProductSummary��ID"));
                }
                else
                {
                    Response.Write(Html.Hidden("ProductSummary��ID", Model[i].ID.ToString()));
                }
            %>
            <tr>
                <td align="center" valign="middle" rowspan="1" style="width: 10%;">
                    ������Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    ��Ʒ���룺
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("_ProductSummary��ProductID"));
                            Response.Write(Html.Hidden("ProductSummary��propertyobjectvalue"));
                            Response.Write(Html.Hidden("ProductSummary��propertyobject", "LZL.ForeignTrade.DataEntity.Product", new { novalue = true }));
                            Response.Write("<a href='#'onclick=LoadControlList(this,'InvoiceIndex')>ѡ��</a>");
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                if (Model[i].Product != null)
                                {
                                    Response.Write(Html.TextBox("_ProductSummary��ProductID", Model[i].Product.NameCode));
                                    Response.Write(Html.Hidden("ProductSummary��propertyobjectvalue", Model[i].Product.ID));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_ProductSummary��ProductID"));
                                    Response.Write(Html.Hidden("ProductSummary��propertyobjectvalue"));
                                }
                                Response.Write(Html.Hidden("ProductSummary��propertyobject", "LZL.ForeignTrade.DataEntity.Product", new { novalue = true }));
                                Response.Write("<a href='#'onclick=LoadControlList(this,'InvoiceIndex')>ѡ��</a>");
                            }
                            else
                            {
                                if (Model[i].Product != null)
                                {
                                    Response.Write(Html.Encode(Model[i].Product.NameCode));
                                }
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="center" valign="middle" rowspan="4" style="width: 10%;">
                    ��Ʒ��Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    ���ش��룺
                </td>
                <td align="left" style="width: 30%;">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary��CustomsCode"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary��CustomsCode", Html.Encode(Model[i].CustomsCode)));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].CustomsCode));
                            }
                        }
                    %>
                </td>
                <td align="right" style="width: 15%;">
                    ��Ʒ������
                </td>
                <td align="left" style="width: 30%;">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary��Amount", "", new { validate = "digits:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary��Amount", Html.Encode(Model[i].Amount), new { validate = "digits:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].Amount));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ��λ��Ӣ�ģ���
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary��UnitEN"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary��UnitEN", Html.Encode(Model[i].UnitEN)));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].UnitEN));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    ��Ʒ�������ۣ�
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary��ExportPrice", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary��ExportPrice", Html.Encode(Model[i].ExportPrice), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ExportPrice));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ������
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary��ExportAmount", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary��ExportAmount", Html.Encode(Model[i].ExportAmount), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ExportAmount));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    ��Ʒ������Ӣ�ģ���
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary��DescriptionEN", new { style = "width: 99%; height: 40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductSummary��DescriptionEN", Html.Encode(Model[i].DescriptionEN), new { style = "width: 99%; height: 40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].DescriptionEN));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ������
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary��ExportAmount", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary��ExportAmount", Html.Encode(Model[i].ExportAmount), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ExportAmount));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    ��ע��
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary��Note", new { style = "width: 99%; height: 40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductSummary��Note", Html.Encode(Model[i].Note), new { style = "width: 99%; height: 40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].Note));
                            }
                        }
                    %>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <%
                if (ViewData["Details"] == null)
                {
            %>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ��" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="ɾ ��" onclick="deleteregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="�� ��" onclick="toggle(this)" />
                </td>
            </tr>
            <%
                }
            %>
        </tfoot>
    </table>
</div>
<%  
    }
%>
