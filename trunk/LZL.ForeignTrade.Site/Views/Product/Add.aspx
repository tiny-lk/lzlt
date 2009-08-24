<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �����Ʒ��Ϣ
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

    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="Product��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="Product��objectname" value="LZL.ForeignTrade.DataEntity.Product,LZL.ForeignTrade.DataEntity" />
    <table width="100%">
        <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
            ��Ʒ��Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Product/Index") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="5" align="center" valign="middle" style="width: 10%;">
                    ��Ʒ������Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    ��Ʒ���루��ƣ���
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Product��NameCode", "", new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    �������ƣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("Product��NameCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�����ƣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��NameEH")%>
                </td>
                <td align="right">
                    ���Ĺ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��SpecCH")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�Ĺ��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��SpecEN")%>
                </td>
                <td align="right">
                    ���ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��UnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ"), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��")%>
                </td>
                <td align="right">
                    ���ش��룺
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��CustomsCode")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ���룺
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextBox("Product��BarCode")%>
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
                    <%= Html.TextBox("Product��PackAmount", "", new { validate = "digits:true" })%>
                </td>
                <td align="right">
                    ���İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��PackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ"), "��ѡ��")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ӣ�İ�װ��λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��")%>
                </td>
                <td align="right">
                    ��װ����(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackLength", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackWidth", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��װ�߶�(CM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackHeight", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ���(CBM)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackBulk", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ��װë��(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackGrossWeight", "", new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ����(KG)��
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��PackNetWeight", "", new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �ں���Ʒ������
                </td>
                <td align="left">
                    <%= Html.TextBox("Product��BoxAmount", "", new { validate = "digits:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ں����ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��BoxUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ"), "��ѡ��")%>
                </td>
                <td align="right">
                    �ں�Ӣ�ĵ�λ��
                </td>
                <td align="left">
                    <%= Html.DropDownList("Product��BoxUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��")%>
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
                    <%= Html.DropDownList("Product��TypeCode", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("��Ʒ����"), "��ѡ��")%>
                </td>
                <td align="right">
                    �Ƿ���
                </td>
                <td align="left">
                    <%= Html.CheckBox("Product��IsShare",false)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��Ʒ����������
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��DescriptionCH", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ƷӢ��������
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��DescriptionEN", new { style = "width:99%; height:40px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��Ϣ��
                </td>
                <td align="left" colspan="3">
                    <%= Html.TextArea("Product��Note", new { style = "width:99%; height:60px;" })%>
                </td>
            </tr>
            <!-- �ͻ����� -->
            <tr id="ProductCustomer��" style="display: none; text-align: left;">
                <td colspan="5">
                    <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                        �����ͻ���Ϣ</center>
                    <!-- ��ʶ�ӱ�������� -->
                    <input type="hidden" value='0' name="ProductCustomer��regioncount" id="ProductCustomer��regioncount" />
                    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                    <input type="hidden" name="region" value="ProductCustomer��" />
                    <!-- ��ʶ�ӱ�ʵ������� -->
                    <input type="hidden" name="ProductCustomer��objectname" value="LZL.ForeignTrade.DataEntity.ProductCustomer,LZL.ForeignTrade.DataEntity" />
                    <!-- ��Զ��ϵ�� -->
                    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                    <input type="hidden" name="ProductCustomer��fk" value='Customer' />
                    <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                    <input type="hidden" name="ProductCustomer��pfk" value='Product' />
                    <fieldset style="display: none; width: 95%;">
                        <legend>��Ӧ�̹�ϵ��Ϣ</legend>
                        <ul id="gysxx" style="float: left; width: 100%; clear: both; position: relative;">
                        </ul>
                    </fieldset>
                    <fieldset style="display: none; width: 95%;">
                        <legend>�ͻ���Ʒ��ϵ��Ϣ</legend>
                        <ul id="khspxx" style="float: left; width: 100%; clear: both; position: relative;">
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
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Product/Index") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%
        } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="opengys('ProductCustomer��','Customer��ID','01','gysxx','<%=Url.Action("Details","Customer")%>');"
        class="button">��Ӧ��</a> <a href="#" onclick="opengys('ProductCustomer��','Customer��ID','02','khspxx','<%=Url.Action("Details","Customer")%>');"
            class="button">�ͻ���Ʒ</a> <a href="#" class="button">��ƷͼƬ</a>
</asp:Content>
