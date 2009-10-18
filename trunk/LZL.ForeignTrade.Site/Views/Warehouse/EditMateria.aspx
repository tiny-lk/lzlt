<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.MaterialBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ԭ������Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("MaterialBuy��YclType", "�������");
            autocompletedictionary("MaterialBuy��BColor", "������ɫ");
        });

        function addImage(key, n) {
            $("#imagemodedialog").remove();
            $("body").append("<div id='imagemodedialog'></div>");
            $.ajax({
                type: "get",
                dataType: "html",
                data: { fid: key, name: n },
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
    <input type="hidden" name="region" value="MaterialBuy��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="MaterialBuy��objectname" value="LZL.ForeignTrade.DataEntity.MaterialBuy,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("MaterialBuy��ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%">
        <caption>
            ԭ������Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="4" style="width: 10%;">
                    ԭ����
                </td>
                <td align="right" style="width: 15%;">
                    ��ţ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("MaterialBuy��YclNo", Html.Encode(Model.YclNo), new { validate = "required:true" })%>
                </td>
                <td align="right" style="width: 15%;">
                    ���
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("MaterialBuy��YclType", Html.Encode(Model.YclType))%><a href="#"
                        onclick="LoadDictionaryPanel('�������',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ɷ֣�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��YclCf", Html.Encode(Model.YclCf))%>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BWeight", Html.Encode(Model.BWeight), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ɫ��
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BColor", Html.Encode(Model.BColor))%><a href="#" onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BCount", Html.Encode(Model.BCount), new { validate = "number:true" })%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ���ۣ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��BPrice", Html.Encode(Model.BPrice), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    �׺ţ�
                </td>
                <td align="left">
                    <%= Html.TextBox("MaterialBuy��Bgh", Html.Encode(Model.Bgh))%>
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
                            Html.RenderPartial("OtherMaterialBuy", Model.SubMaterialBuy.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- ������������ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="5" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/MaterialBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ContentPlaceHolderID="ChildActionContent" ID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'OtherMaterialBuy','SubMaterialBuy��',1,'MaterialBuy')"
        class="button">����ԭ��</a> <a href="#" onclick="addImage('<%=Html.Encode(Model.ID.ToString()) %>','ԭ����ͼƬ����');"
            class="button4">ԭ����ͼƬ</a>
</asp:Content>
