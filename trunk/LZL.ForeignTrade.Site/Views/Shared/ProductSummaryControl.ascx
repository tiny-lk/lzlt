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
    <link href="<%= Url.Content("~/Content/blue/blue.css")%>" type="text/css" rel="stylesheet">

    <script src="<%= Url.Content("~/Scripts/jquery.tablesorter.js")%>" type="text/javascript"></script>

    <script src="<%= Url.Content("~/Scripts/jquery.tableEditor.js")%>" type="text/javascript"></script>

    <script src="<%= Url.Content("~/Scripts/common.js")%>" type="text/javascript"></script>

    <script type="text/javascript">
        $().ready(function() {
            $("#editableTable").tableSorter().tableEditor({
                EDIT_HTML: '�༭',
                SAVE_HTML: '',
                COL_APPLYCLASS: true,
                COLUMN_NOEDIT: 'edit'
            });
        });     
    </script>

    <script type="text/javascript">
        function addRow(regionname) {
            var obj = $(regionname).closest("table").siblings("div[id='region']");
            var regionvalue = $(obj).find("input[name='region']").val();
            if (regionvalue != null) {
                var regioncountobj = $(obj).find("#" + regionvalue + "regioncount");
                $(regioncountobj).val(Number($(regioncountobj).val()) + 1);
            }
            var copyobj = $($("#editableTable tr")[$("#editableTable tr").length - 1])
            var copyhtml = $(copyobj).clone(true);
            $.each($(copyhtml).find("input[type='hidden']"), function(i, o) {
                var copyvalue = $(o).attr("copyvalue");
                if (copyvalue == null || copyvalue == "") {
                    $(o).val("");
                }
            });
            $(copyhtml).find("input[type='text']").removeAttr("id");
            $(copyhtml).find('.' + $.datepicker.markerClassName).removeClass($.datepicker.markerClassName)
            $(copyobj).parent().append(copyhtml);
            init();
        }
        function removeRow(regionname) {
            var obj = $(regionname).closest("table").siblings("div[id='region']");
            var regionvalue = $(obj).find("input[name='region']").val();
            if (regionvalue != null) {
                var regioncountobj = $(obj).find("#" + regionvalue + "regioncount");
                $(regioncountobj).val(Number($(regioncountobj).val()) - 1);
            }
            var objTemp = $(regionname);
            $(objTemp.parent().parent()).remove();
        }
    </script>

</div>
<table id="editableTable" class="dynamictable" cellspacing="0" cellpadding="0" border="0"
    width="100%">
    <thead class="header">
        <tr>
            <th>
                ����
            </th>
            <th>
                ��Ʒ���
            </th>
            <th>
                ���ش���
            </th>
            <th>
                ��Ʒ����
            </th>
            <th>
                ��Ʒ��λ��Ӣ�ģ�
            </th>
            <th>
                ��Ʒ��������
            </th>
            <th>
                ��Ʒ��������
            </th>
            <th>
                ��Ʒ�������
            </th>
            <th>
                ��Ʒ������Ӣ�ģ�
            </th>
            <th>
                ��ע
            </th>
        </tr>
    </thead>
    <tbody id="tbdMain">
        <% 
            for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
            {                   
        %>
        <tr>
            <% if (Model == null)
               {
                   Response.Write(Html.Hidden("ProductSummary��ID"));
               }
               else
               {
                   Response.Write(Html.Hidden("ProductSummary��ID", Model[i].ID.ToString()));
               }
               Response.Write(Html.Hidden("ProductSummary��propertyobject", "Product", new { copyvalue = true }));
            %>
            <td align="center" width="8%">
                <key></key>
                <a class="tsEditLink" href="#">�༭</a>&nbsp;<a href="#" onclick="removeRow(this)">ɾ��</a>
            </td>
            <td width="14%">
                <%                   
               
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("_ProductSummary��ProductID", "", new { style = "width:60%;" }));
                        Response.Write(Html.Hidden("ProductSummary��propertyobjectvalue", "", new { copyvalue = true }));
                        Response.Write("<a href='#'onclick=LoadControlList(this,'ProductIndex')>ѡ��</a>");
                    }
                    else
                    {
                        Model[i].ProductReference.Load();
                        if (ViewData["Details"] == null)
                        {
                            if (Model[i].Product != null)
                            {
                                Response.Write(Html.TextBox("_ProductSummary��ProductID", Model[i].Product.NameCode, new { style = "width:60%;" }));
                                Response.Write(Html.Hidden("ProductSummary��propertyobjectvalue", Model[i].Product.ID, new { copyvalue = true }));
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_ProductSummary��ProductID", "", new { style = "width:60%;" }));
                                Response.Write(Html.Hidden("ProductSummary��propertyobjectvalue", "", new { copyvalue = true }));
                            }
                            Response.Write("<a href='#'onclick=LoadControlList(this,'ProductIndex')>ѡ��</a>");
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
            <td width="8%">
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
            <td width="10%">
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
            <td width="8%">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.DropDownList("ProductSummary��UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.DropDownList("ProductSummary��UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model[i].UnitEN)), "��ѡ��"));
                        }
                        else
                        {
                            Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].UnitEN)));
                        }
                    }
                %>
            </td>
            <td width="10%">
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
            <td width="10%">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("ProductSummary��PurchasePrice", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary��PurchasePrice", Html.Encode(Model[i].PurchasePrice), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].PurchasePrice));
                        }
                    }
                %>
            </td>
            <td width="10%">
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
            <td width="10%">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextArea("ProductSummary��DescriptionEN", new { style = "width: 95%; height: 40px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary��DescriptionEN", Html.Encode(Model[i].DescriptionEN), new { style = "width: 95%; height: 40px;" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].DescriptionEN));
                        }
                    }
                %>
            </td>
            <td width="12%">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextArea("ProductSummary��Note", new { style = "width: 95%; height: 40px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary��Note", Html.Encode(Model[i].Note), new { style = "width: 95%; height: 40px;" }));
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
            }
        %>
    </tbody>
</table>
<%
    if (ViewData["Details"] == null)
    {
%>
<table id="Table1" class="dynamictable" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <td colspan="11" align="right">
            <input type="button" id="btnInsert" value="���" onclick="addRow(this)" class="button" />
        </td>
    </tr>
</table>
<%
    }
%>

<script>
    function setreadonly() {
        $("#editableTable").find('input, select,textarea').attr("readonly", "true");
        $("#editableTable").addClass("dynamictablereadonly");
    }
    setreadonly();
</script>

