<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.MaterialBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ԭ������Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <caption>
            ԭ������Ϣ</caption>
        <thead>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" style="width: 10%;">
                    ԭ����
                </td>
                <td align="right">
                    ��ţ�
                </td>
                <td align="left">
                    <%=Html.Encode(Model.YclNo) %>
                </td>
                <td align="right">
                    ���
                </td>
                <td align="left">
                    <%=Html.Encode(Model.YclType)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ɷ֣�
                </td>
                <td align="left">
                    <%=Html.Encode(Model.YclCf)%>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BWeight)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BColor)%>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BCount)%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%=Html.Encode(Model.BPrice)%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%=Html.Encode(Model.Bgh)%>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <!-- ������������ -->
            <tr id="SubMaterialBuy��" style="display: none;">
                <td colspan="5">
                    <%
                        Model.SubMaterialBuy.Load();
                        if (Model.SubMaterialBuy.Count > 0)
                        {
                            ViewDataDictionary viewdictionary = new ViewDataDictionary();
                            viewdictionary.Add("number", Model.SubMaterialBuy.Count);
                            viewdictionary.Add("Details", true);
                            Html.RenderPartial("OtherMaterialBuy", Model.SubMaterialBuy.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- ������������ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
