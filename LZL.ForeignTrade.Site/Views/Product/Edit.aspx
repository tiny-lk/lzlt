<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭��Ʒ��Ϣ
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
                    alert("��ӱ�����ʧ�ܣ�");
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
                    alert("��ӱ�����ʧ�ܣ�");
                }
            });
        }
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Product��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Product��objectname" value="LZL.ForeignTrade.DataEntity.Product,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            �༭��Ʒ��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
                </td>
            </tr>
            <tr>
                <%= Html.Hidden("Product��ID", Html.Encode(Model.ID.ToString()))%>
                <td rowspan="5" align="center" valign="middle">
                    ��Ʒ������Ϣ
                </td>
                <td align="right" style="width: 20%;">
                    ��Ʒ���루��ƣ���
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��NameCode",Html.Encode( Model.NameCode), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 20%;">
                    �������ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��NameCH", Html.Encode(Model.NameCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��NameEH", Html.Encode(Model.NameEH))%>
                </td>
                <td align="right">
                    ���Ĺ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��SpecCH", Html.Encode(Model.SpecCH))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�Ĺ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��SpecEN", Html.Encode(Model.SpecEN))%>
                </td>
                <td align="right">
                    ���ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��UnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ", Html.Encode(Model.UnitCH)), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model.UnitEN)), "��ѡ��")%>
                </td>
                <td align="right">
                    ���ش��룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��CustomsCode", Html.Encode(Model.CustomsCode))%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ���룺
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Product��BarCode", Html.Encode(Model.BarCode))%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="6" valign="middle">
                    ��Ʒ��װ
                </td>
                <td align="right">
                    ��װ��Ʒ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackAmount", Html.Encode(Model.PackAmount),new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    ���İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��PackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ", Html.Encode(Model.PackUnitCH)), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model.PackUnitEN)), "��ѡ��")%>
                </td>
                <td align="right">
                    ��װ����(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackLength", Html.Encode(Model.PackLength),new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackWidth", Html.Encode(Model.PackWidth), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��װ�߶�(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackHeight", Html.Encode(Model.PackHeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CBM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackBulk", Html.Encode(Model.PackBulk), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��װë��(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackGrossWeight", Html.Encode(Model.PackGrossWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ����(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackNetWeight", Html.Encode(Model.PackNetWeight), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �ں���Ʒ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��BoxAmount", Html.Encode(Model.BoxAmount), new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ں����ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��BoxUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ", Html.Encode(Model.BoxUnitCH)), "��ѡ��")%>
                </td>
                <td align="right">
                    �ں�Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��BoxUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model.BoxUnitEN)), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="4" valign="middle">
                    ������Ϣ
                </td>
                <td align="right">
                    ��Ʒ���
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��TypeCode", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("��Ʒ����", Html.Encode(Model.TypeCode)), "��ѡ��")%>
                </td>
                <td align="right">
                    �Ƿ���
                </td>
                <td align="left">
                    <%= Html.CheckBox("Product��IsShare", Model.IsShare)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ����������
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��DescriptionCH", Html.Encode(Model.DescriptionCH) ,new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ƷӢ��������
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��DescriptionEN", Html.Encode(Model.DescriptionEN), new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��Ϣ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <!-- �ͻ����� -->
            <% 
                Model.ProductCustomer.Load();
                for (int i = 0; i < Model.ProductCustomer.Count; i++)
                {
                    Model.ProductCustomer.ElementAt(i).CustomerReference.Load();
                }
           
            %>
            <tr id="ProductCustomer��" style="text-align: left; <%=Model.ProductCustomer.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        �����ͻ���Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='<%= Model.ProductCustomer.Count %>' name="ProductCustomer��regioncount"
                        id="ProductCustomer��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="ProductCustomer��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="ProductCustomer��objectname" value="LZL.ForeignTrade.DataEntity.ProductCustomer,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="ProductCustomer��fk" value='Customer' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="ProductCustomer��pfk" value='Product' />
                    <%
                        var customers = Model.ProductCustomer.Where(v => v.Customer != null && v.Customer.TypeCode.Equals("01")).Select(v => v.Customer);
                    %>
                    <fieldset style="width: 95%; <%=customers.Count()>0?"": "display: none"%>;">
                        <legend>��Ӧ�̹�ϵ��Ϣ</legend>
                        <ul id="gysxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int i = 0; i < customers.Count(); i++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('ProductCustomer��','gysxx')";
                                    Response.Write(string.Format(htmlstr,
                                        @"<input type='checkbox' name='Customer��ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Html.Encode(customers.ElementAt(i).ID.ToString()) + "' />",
                                        Html.ActionLink(customers.ElementAt(i).NameCode, "Details", "Customer", new { id = customers.ElementAt(i).ID.ToString() }, null)));
                                }
                            %>
                        </ul>
                    </fieldset>
                    <%
                        var customers2 = Model.ProductCustomer.Where(v => v.Customer != null && v.Customer.TypeCode.Equals("02")).Select(v => v.Customer);
                    %>
                    <fieldset style="width: 95%; <%=customers2.Count()>0?"": "display: none"%>;">
                        <legend>�ͻ���Ʒ��ϵ��Ϣ</legend>
                        <ul id="khspxx" style="float: left; width: 100%; clear: both; position: relative;">
                            <%
                                for (int s = 0; s < customers2.Count(); s++)
                                {
                                    var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                    var script = @"$(this).parent().remove();display('ProductCustomer��','khspxx')";
                                    Response.Write(string.Format(htmlstr, "<input type='checkbox' name='Customer��ID' checked='true'onclick=" + Html.Encode(script) + " value='" + Html.Encode(customers2.ElementAt(s).ID.ToString()) + "' />",
                                        Html.ActionLink(customers2.ElementAt(s).NameCode, "Details", "Customer", new { id = customers2.ElementAt(s).ID.ToString() }, null)));

                                }   
                            %>
                        </ul>
                    </fieldset>
                </td>
            </tr>
            <!-- �ͻ����� -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Action("Index","Product")%>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="opengys('ProductCustomer��','Customer��ID','01','gysxx','<%=Url.Action("Details","Customer")%>');">
        ��Ӧ����Ϣ</a></li>
    <li><a href="#" onclick="opengys('ProductCustomer��','Customer��ID','02','khspxx','<%=Url.Action("Details","Customer")%>');">
        �ͻ���Ʒ��Ϣ</a></li>
    <li><a href="#" onclick="addImage('<%=Html.Encode(Model.ID.ToString()) %>');">��ƷͼƬ</a></li>
</asp:Content>
