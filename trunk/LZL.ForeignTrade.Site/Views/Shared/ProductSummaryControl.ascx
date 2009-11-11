<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ProductSummary>>" %>
<div id="region">
    <!-- 标识子表添加总数 -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="ProductSummary♂regioncount"
        id="ProductSummary♂regioncount" />
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="ProductSummary♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="ProductSummary♂objectname" value="LZL.ForeignTrade.DataEntity.ProductSummary,LZL.ForeignTrade.DataEntity" />
    <!-- 标识子表外键实体对象名称、外键字段名称 -->
    <input type="hidden" name="ProductSummary♂fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Invoice" :ViewData["FK"] %>' />
    <%= Html.Hidden("ProductSummary♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("ProductSummary♂iseditdate", "EditDate")%>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#ProductSummary♂').css("display", "");
        });
        function toggle(obj) {
            if ($(obj).val() == "折 叠") {
                $(obj).val("展 开");
            } else {
                $(obj).val("折 叠");
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
                    Response.Write(Html.Hidden("ProductSummary♂ID"));
                }
                else
                {
                    Response.Write(Html.Hidden("ProductSummary♂ID", Model[i].ID.ToString()));
                }
            %>
            <tr>
                <td align="center" valign="middle" rowspan="1" style="width: 10%;">
                    基本信息
                </td>
                <td align="right" style="width: 15%;">
                    商品款号：
                    <%
                        Response.Write(Html.Hidden("ProductSummary♂propertyobject", "Product", new { copyvalue = true }));
                    %>
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("_ProductSummary♂ProductID"));
                            Response.Write(Html.Hidden("ProductSummary♂propertyobjectvalue", "", new { copyvalue = true }));
                            Response.Write("<a href='#'onclick=LoadControlList(this,'ProductIndex')>选择</a>");
                        }
                        else
                        {
                            Model[i].ProductReference.Load();
                            if (ViewData["Details"] == null)
                            {
                                if (Model[i].Product != null)
                                {
                                    Response.Write(Html.TextBox("_ProductSummary♂ProductID", Model[i].Product.NameCode));
                                    Response.Write(Html.Hidden("ProductSummary♂propertyobjectvalue", Model[i].Product.ID, new { copyvalue = true }));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_ProductSummary♂ProductID"));
                                    Response.Write(Html.Hidden("ProductSummary♂propertyobjectvalue", "", new { copyvalue = true }));
                                }
                                Response.Write("<a href='#'onclick=LoadControlList(this,'ProductIndex')>选择</a>");
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
                    商品信息
                </td>
                <td align="right" style="width: 15%;">
                    海关代码：
                </td>
                <td align="left" style="width: 30%;">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂CustomsCode"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂CustomsCode", Html.Encode(Model[i].CustomsCode)));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].CustomsCode));
                            }
                        }
                    %>
                </td>
                <td align="right" style="width: 15%;">
                    商品数量：
                </td>
                <td align="left" style="width: 30%;">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂Amount", "", new { validate = "digits:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂Amount", Html.Encode(Model[i].Amount), new { validate = "digits:true" }));
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
                    商品单位（英文）：
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductSummary♂UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位"), "请选择"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductSummary♂UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model[i].UnitEN)), "请选择"));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].UnitEN)));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    商品外销单价：
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂ExportPrice", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂ExportPrice", Html.Encode(Model[i].ExportPrice), new { validate = "number:true" }));
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
                    商品外销金额：
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂ExportAmount", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂ExportAmount", Html.Encode(Model[i].ExportAmount), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ExportAmount));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    商品描述（英文）：
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary♂DescriptionEN", new { style = "width: 99%; height: 40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductSummary♂DescriptionEN", Html.Encode(Model[i].DescriptionEN), new { style = "width: 99%; height: 40px;" }));
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
                    备注：
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary♂Note", new { style = "width: 99%; height: 40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductSummary♂Note", Html.Encode(Model[i].Note), new { style = "width: 99%; height: 40px;" }));
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
                    <input type="button" class="button" value="添 加" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="删 除" onclick="deleteregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="折 叠" onclick="toggle(this)" />
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
