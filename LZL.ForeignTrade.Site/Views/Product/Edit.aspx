<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑商品信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript">
        function opengys(regionname, childobject, khtype, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { type: khtype },
                url: '<%=Url.Action("CustomerIndex","Shared")%>',
                success: function(data) {
                    addRelationcontrol(regionname, childobject, data, addid, url);
                },
                error: function() {
                    alert("添加表单数据失败！");
                }
            });
        }
        function addImage(key) {
            $("#imagemodedialog").remove();
            $("body").append("<div id='imagemodedialog'></div>");
            $.ajax({
                type: "get",
                dataType: "html",
                data: { fid: key },
                url: '<%=Url.Action("ImageUserControl","Shared")%>',
                success: function(data) {
                    $("#imagemodedialog").dialog({
                        bgiframe: true,
                        height: 140,
                        modal: true,
                        width: 700,
                        height: 'auto',
                        position: 'center',
                        resizable: true,
                        draggable: true,
                        closeOnEscape: true
                    });
                    $("#imagemodedialog").append(data);
                    $("#imagemodedialog").dialog();
                    $("#imagemodedialog").dialog('open');
                },
                error: function() {
                    alert("添加表单数据失败！");
                }
            });
        }
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Product♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Product♂objectname" value="LZL.ForeignTrade.DataEntity.Product,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            编辑商品信息</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
                </td>
            </tr>
            <tr>
                <%= Html.Hidden("Product♂ID", Html.Encode(Model.ID.ToString()))%>
                <td rowspan="5" align="center" valign="middle">
                    商品介绍信息
                </td>
                <td align="right" style="width: 20%;">
                    商品代码（简称）：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂NameCode",Html.Encode( Model.NameCode), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 20%;">
                    中文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂NameCH", Html.Encode(Model.NameCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂NameEH", Html.Encode(Model.NameEH))%>
                </td>
                <td align="right">
                    中文规格：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂SpecCH", Html.Encode(Model.SpecCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文规格：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂SpecEN", Html.Encode(Model.SpecEN))%>
                </td>
                <td align="right">
                    中文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂UnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("中文单位", Html.Encode(Model.UnitCH)), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model.UnitEN)), "请选择")%>
                </td>
                <td align="right">
                    海关代码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂CustomsCode", Html.Encode(Model.CustomsCode))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品代码：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Product♂BarCode", Html.Encode(Model.BarCode))%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="6" valign="middle">
                    商品包装
                </td>
                <td align="right">
                    包装商品数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackAmount", Html.Encode(Model.PackAmount),new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    中文包装单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂PackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("中文单位", Html.Encode(Model.PackUnitCH)), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    英文包装单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model.PackUnitEN)), "请选择")%>
                </td>
                <td align="right">
                    包装长度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackLength", Html.Encode(Model.PackLength),new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装宽度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackWidth", Html.Encode(Model.PackWidth), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    包装高度(CM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackHeight", Html.Encode(Model.PackHeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装体积(CBM)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackBulk", Html.Encode(Model.PackBulk), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    包装毛重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackGrossWeight", Html.Encode(Model.PackGrossWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    包装净重(KG)：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂PackNetWeight", Html.Encode(Model.PackNetWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    内盒商品数量：
                </td>
                <td align="left">
                    <%= Html.TextBox("Product♂BoxAmount", Html.Encode(Model.BoxAmount), new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    内盒中文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂BoxUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("中文单位", Html.Encode(Model.BoxUnitCH)), "请选择")%>
                </td>
                <td align="right">
                    内盒英文单位：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂BoxUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model.BoxUnitEN)), "请选择")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="4" valign="middle">
                    其它信息
                </td>
                <td align="right">
                    商品类别：
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product♂TypeCode", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("商品类型", Html.Encode(Model.TypeCode)), "请选择")%>
                </td>
                <td align="right">
                    是否共享：
                </td>
                <td align="left">
                    <%= Html.CheckBox("Product♂IsShare", Model.IsShare)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品中文描述：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product♂DescriptionCH", Html.Encode(Model.DescriptionCH) ,new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品英文描述：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product♂DescriptionEN", Html.Encode(Model.DescriptionEN), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    备注信息：
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product♂Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <!-- 客户区域 -->
            <% 
                Model.ProductCustomer.Load();
                for (int i = 0; i < Model.ProductCustomer.Count; i++)
                {
                    Model.ProductCustomer.ElementAt(i).CustomerReference.Load();
                }
           
            %>
            <tr id="ProductCustomer♂" style="text-align: left; <%=Model.ProductCustomer.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        关联客户信息</center>
                    <!-- 标识子表添加总数 -->
                    <input type="hidden" value='<%= Model.ProductCustomer.Count %>' name="ProductCustomer♂regioncount"
                        id="ProductCustomer♂regioncount" />
                    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
                    <input type="hidden" name="region" value="ProductCustomer♂" />
                    <!-- 标识子表实体对象类 -->
                    <input type="hidden" name="ProductCustomer♂objectname" value="LZL.ForeignTrade.DataEntity.ProductCustomer,LZL.ForeignTrade.DataEntity" />
                    <!-- 多对多关系中 -->
                    <!-- 标识子表外键实体对象名称、外键字段名称 -->
                    <input type="hidden" name="ProductCustomer♂fk" value='Customer' />
                    <!-- 标识多对多关系表中（一） -->
                    <input type="hidden" name="ProductCustomer♂pfk" value='Product' />
                    <%
                        var customers = Model.ProductCustomer.Where(v => v.Customer != null && v.Customer.TypeCode.Equals("01")).Select(v => v.Customer);
                    %>
                    <fieldset style="width: 95%; <%=customers.Count()>0?"": "display: none"%>;">
                        <legend>供应商关系信息</legend>
                        <ul id="gysxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < customers.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('ProductCustomer♂','gysxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Customer♂ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Html.Encode(customers.ElementAt(i).ID.ToString()) + "' />",
                                        Html.ActionLink(customers.ElementAt(i).NameCode, "Details", "Customer", new { id = customers.ElementAt(i).ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                    <%
                        var customers2 = Model.ProductCustomer.Where(v => v.Customer != null && v.Customer.TypeCode.Equals("02")).Select(v => v.Customer);
                    %>
                    <fieldset style="width: 95%; <%=customers2.Count()>0?"": "display: none"%>;">
                        <legend>客户商品关系信息</legend>
                        <ul id="khspxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int s = 0; s < customers2.Count(); s++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('ProductCustomer♂','khspxx')";
                                    Response.Write(string.Format(htmlstr, "<input type='checkbox' name='Customer♂ID' checked='true'onclick=" + Html.Encode(script) + " value='" + Html.Encode(customers2.ElementAt(s).ID.ToString()) + "' />",
                                        Html.ActionLink(customers2.ElementAt(s).NameCode, "Details", "Customer", new { id = customers2.ElementAt(s).ID.ToString() }, null)));

                                }   
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- 客户区域 -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="opengys('ProductCustomer♂','Customer♂ID','01','gysxx','<%=Url.Action("Details","Customer")%>');">
        供应商信息</a></li>
    <li><a href="#" onclick="opengys('ProductCustomer♂','Customer♂ID','02','khspxx','<%=Url.Action("Details","Customer")%>');">
        客户商品信息</a></li>
    <li><a href="#" onclick="addImage('<%=Html.Encode(Model.ID.ToString()) %>');">商品图片</a></li>
</asp:Content>
