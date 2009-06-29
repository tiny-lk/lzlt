<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��ӿͻ���Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="../../Scripts/jquery-1.3.2.js"></script>

    <script type="text/javascript">
        function lxyregion() {
            if ($("#lxrregion").is(":hidden")) {
                $("#lxrregion").show('slow');
            }
            else {
                $("#lxrregion").hide('normal');
                $.data(document, "slow", 0);
            }
        }
        
        //�������ģ��
        function addregion(regionname) {
            while ($(regionname).parent("TABLE").length == 0) {
                regionname = $(regionname).parent();
            }
            var obj = $(regionname).parent("TABLE");
            var value = Number(obj.parent().find("input[type='hidden']").val());
            obj.parent().find("input[type='hidden']").val(value + 1);
            var copyhtml = $(obj).clone();
            var randomvalue = getrandom();
            $.each($(copyhtml).find("input[type='text'], input[type='password'], textarea,input[type='button']"), function(v, o) {
                if (o.name != null) {
                    if (o.name.search("��") == -1) {
                        o.name = o.name + "��" + randomvalue;
                        o.id = o.name;
                    } else {
                        o.name = o.name.substr(0, o.name.indexOf("��")) + "��" + randomvalue;
                        o.id = o.name;
                    }
                }
            });
            if ($(copyhtml).attr("id").search("��") == -1) {
                $(copyhtml).attr("id", $(copyhtml).attr("id") + "��" + randomvalue);
            } else {
                $(copyhtml).attr("id", $(copyhtml).attr("id").substr(0, $(copyhtml).attr("id").indexOf("��")) + "��" + randomvalue);
            }
            $(obj).parent().append(copyhtml);
        }
        //��ȡ�����
        function getrandom() {
            return (new Date().getTime()) ^ Math.random();
        }
        //ɾ������ģ��
        function deleteregion(regionname) {
            while ($(regionname).parent("TABLE").length == 0) {
                regionname = $(regionname).parent();
            }
            var obj = $(regionname).parent("TABLE");
            var value = Number(obj.parent().find("input[type='hidden']").val());
            if (value != 1) {
                obj.parent().find("input[type='hidden']").val(value - 1);
                $(obj).remove();
            } else {
                alert("ֻ����һ�������ܽ���ɾ����");
            }
        }
    </script>

    <h2>
        ��ӿͻ���Ϣ</h2>
    <% using (Html.BeginForm())
       { %>
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5">
                    <h3>
                        �ͻ���Ϣ</h3>
                </td>
            </tr>
        </thead>
        <tr>
            <td rowspan="7" align="center" valign="middle">
                �ͻ�������Ϣ
            </td>
            <td align="right">
                �ͻ����루��ƣ���
            </td>
            <td align="left">
                <%= Html.TextBox("khdmjc")%>
            </td>
            <td align="right">
                �������ƣ�
            </td>
            <td align="left">
                <%= Html.TextBox("zwmc")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                Ӣ�����ƣ�
            </td>
            <td align="left">
                <%= Html.TextBox("ywmc")%>
            </td>
            <td align="right">
                Ӣ�ĵ�ַ��
            </td>
            <td align="left">
                <%= Html.TextBox("ywdz")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���ң�
            </td>
            <td align="left">
                <%= Html.TextBox("gj")%>
            </td>
            <td align="right">
                ʡ�ݣ��ݣ���
            </td>
            <td align="left">
                <%= Html.TextBox("sf")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���У�
            </td>
            <td align="left">
                <%= Html.TextBox("cs")%>
            </td>
            <td align="right">
                ���룺
            </td>
            <td align="left">
                <%= Html.TextBox("yzbm")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                �绰���룺
            </td>
            <td align="left">
                <%= Html.TextBox("dhhm")%>
            </td>
            <td align="right">
                ������룺
            </td>
            <td align="left">
                <%= Html.TextBox("czhm")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��վ��
            </td>
            <td align="left">
                <%= Html.TextBox("wzdz")%>
            </td>
            <td align="right">
                �ͻ����
            </td>
            <td align="left">
                <%= Html.TextBox("khlb")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ע��
            </td>
            <td align="left" colspan="3">
                <%= Html.TextArea("bz", new { style = "width:99%; height:80px;" })%>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle">
                ������Ϣ
            </td>
            <td align="right">
                �������У�
            </td>
            <td align="left">
                <%= Html.TextBox("kfhy")%>
            </td>
            <td align="right">
                ��&nbsp;&nbsp;&nbsp;&nbsp;����
            </td>
            <td align="left">
                <%= Html.TextBox("yhzh")%>
            </td>
        </tr>
        <!-- ��ϵ������ -->
        <tr>
            <td colspan="5">
                <center>
                    <h3>
                        ��ϵ�˶�̬����</h3>
                    <input type="hidden" value="1" name="lxrregioncount" id="lxrregioncount" />
                </center>
                <table id="lxrregion" class="dynamictable" style="display: none;">
                    <tr>
                        <td align="center" valign="middle" rowspan="4" style="width: 20%;">
                            ��ϵ����Ϣ
                        </td>
                        <td align="right" style="width: 20%;">
                            ��ϵ�ˣ�
                        </td>
                        <td align="left" style="width: 20%;">
                            <%= Html.TextBox("lxr")%>
                        </td>
                        <td align="right" style="width: 20%;">
                            ְλ��
                        </td>
                        <td align="left" style="width: 20%;">
                            <%= Html.TextBox("zw")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            �绰��
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxrdh")%>
                        </td>
                        <td align="right">
                            ���棺
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxrcz")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            �ƶ��绰��
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxryddh")%>
                        </td>
                        <td align="right">
                            �����ʼ���
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxrdzyj")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            ��ϵ�˱�ע��
                        </td>
                        <td align="left" colspan="3">
                            <%= Html.TextArea("lxrbz", new { style = "width:99%; height:80px;" })%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right">
                            <input id="add" name="add" type="button" value="�� ��" onclick="addregion(this);" />
                            <input id="delete" name="delete" type="button" value="ɾ ��" onclick="deleteregion(this);" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!-- ��ϵ������ -->
        <tr>
            <td colspan="5" align="center">
                <input type="submit" value="�� ��" />
                &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                    type="button" value="�� ��" onclick="javascript:history.back(1);" />
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="lxyregion();">�����ϵ����Ϣ</a></li>
    <li>����¼</li>
</asp:Content>
