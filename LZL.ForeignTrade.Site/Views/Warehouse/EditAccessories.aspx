<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Warehouse/Warehouse.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.AccessoriesBuy>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("AccessoriesBuy��ZbColor", "������ɫ");
            autocompletedictionary("AccessoriesBuy��ZbSize", "����");
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
    <input type="hidden" name="region" value="AccessoriesBuy��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="AccessoriesBuy��objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesBuy,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("AccessoriesBuy��ID", Html.Encode(Model.ID.ToString()))%>
    <table width="100%">
        <caption>
            ������Ϣ</caption>
        <thead align="center">
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" style="width: 10%;">
                    �� ��
                </td>
                <td align="right">
                    ��ţ�
                </td>
                <td align="left" colspan="4">
                    <%= Html.TextBox("AccessoriesBuy��AccessoriesNo", Html.Encode(Model.AccessoriesNo), new { validate = "required:true"})%>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 15%;">
                    ���ƣ�
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("AccessoriesBuy��Zbmc", Html.Encode(Model.Zbmc), new { validate = "required:true"})%>
                </td>
                <td align="right" style="width: 15%;">
                    ��ɫ��
                </td>
                <td align="left" style="width: 30%;">
                    <%= Html.TextBox("AccessoriesBuy��ZbColor", Html.Encode(Model.ZbColor))%><a href="#"
                        onclick="LoadDictionaryPanel('������ɫ',true,this)">ѡ��</a>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ������
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy��ZbCount", Html.Encode(Model.ZbCount), new { validate = "number:true" })%>
                </td>
                <td align="right">
                    ���룺
                </td>
                <td align="left">
                    <%= Html.TextBox("AccessoriesBuy��ZbSize", Html.Encode(Model.ZbSize))%><a href="#"
                        onclick="LoadDictionaryPanel('����',true,this)">ѡ��</a>
                </td>
            </tr>
            <!-- ������������ -->
            <tr id="AccessoriesChildBuy��" style="display: none;">
                <td colspan="5">
                    <%
                        Model.AccessoriesChildBuy.Load();
                        if (Model.AccessoriesChildBuy.Count > 0)
                        {
                            ViewDataDictionary viewdictionary = new ViewDataDictionary();
                            viewdictionary.Add("number", Model.AccessoriesChildBuy.Count);
                            Html.RenderPartial("OtherAccessories", Model.AccessoriesChildBuy.ToList(), viewdictionary);
                        }
                    %>
                </td>
            </tr>
            <!-- ������������ -->
        </thead>
        <tfoot>
            <tr>
                <td colspan="7" align="right">
                    <input type="submit" value="�� ��" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/Warehouse/AccessoriesBuy") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
<asp:Content ContentPlaceHolderID="ChildActionContent" ID="ChildActionContent" runat="server">
    <a href="#" onclick="addcontrol(this,'OtherAccessories','AccessoriesChildBuy��',1,'AccessoriesBuy')"
        class="button">��������</a> <a href="#" onclick="addImage('<%=Html.Encode(Model.ID.ToString()) %>','�����ɹ�����');"
            class="button4">�����ɹ�ͼƬ</a>
</asp:Content>
