<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUserCollection>" %>

<asp:Content ID="ManageUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    �û�����
</asp:Content>
<asp:Content ID="ManageUserContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.PrintArea.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            $("#allselect").bind("click", function() {
                $.each($('table > tbody > tr').find("input[type='checkbox']"), function(i, o) {
                    if ($(o).attr("checked") != true) {
                        $(o).click();
                    }
                })
            });

            $("#reverseselect").bind("click", function() {
                $('table > tbody > tr').find("input[type='checkbox']").click();
            });

            $("#Edit").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/EditUser/") %>' + $(document).data('checkvalue');
            });

            $("#Refresh").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageUser/") %>';
            });

            $(".print").bind("click", function() {
                $("table > tbody ").printArea("true");
            });

            $("#Delete").bind("click", function() {
                var State = confirm('��ȷ��Ҫɾ��' + $(document).data('checkvalue') + '��');
                if (State == true) {
                    window.location.href = '<%=Url.Content("~/Account/DeleteUser/") %>' + $(document).data('checkvalue');
                }
            });
        });

    </script>

    <% using (Html.BeginForm())
       { %>
    <table width="100%" style="vertical-align: middle; text-align: center;" summary="User Grid">
        <caption>
            �û�����</caption>
        <thead>
            <tr>
                <td colspan="2">
                    <%= Html.DropDownList("searchType", (SelectList)ViewData["searchOptionList"])%>
                </td>
                <td colspan="2">
                    <%= Html.TextBox("searchInput", ViewData["searchInput"])%>
                </td>
                <td colspan="2" align="left">
                    <input type="submit" id="Query" value="�� ѯ" />
                    <input type="button" id="Edit" value="�� ��" disabled="disabled" check="1" />
                    <input type="button" id="Delete" value="ɾ ��" disabled="disabled" check="n" />
                    <input type="button" id="Refresh" value="ˢ ��" />
                </td>
            </tr>
        </thead>
        <tbody listmouse="listmouseovercss">
            <tr>
                <td>
                    <a href="#" id="allselect">ȫѡ</a>/<a href="#" id="reverseselect">��ѡ</a>
                </td>
                <td>
                    �û���
                </td>
                <td>
                    �����ʼ�
                </td>
                <td>
                    ����ʱ��
                </td>
                <td>
                    ���ʹ��ʱ��
                </td>
                <td>
                    �Ƿ����
                </td>
            </tr>
            <% foreach (MembershipUser membershipUser in ViewData.Model)
               { %>
            <tr id="user-<%= membershipUser.UserName %>">
                <td>
                    <%= Html.CheckBox("select", false, new { value = Html.Encode(membershipUser.UserName.ToString()) })%>
                </td>
                <td>
                    <%= membershipUser.UserName%>
                </td>
                <td>
                    <%= membershipUser.Email%>
                </td>
                <td align="center">
                    <%= membershipUser.CreationDate.ToLocalTime()%>
                </td>
                <td align="center">
                    <%= membershipUser.LastActivityDate.ToLocalTime()%>
                </td>
                <td align="center">
                    <%= Html.Encode(membershipUser.IsApproved ? "��" : "��")%>
                </td>
            </tr>
            <% } %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="9" align="right">
                    <a href="#" class="print">�� ӡ</a>|
                    <%
                        int count = int.Parse(ViewData["pagecount"].ToString());
                        int p = Request["page"] == null ? 1 : int.Parse(Request["page"]);
                        if (p >= count && count <= 1)
                        {
                            Response.Write("��һҳ|��һҳ");
                        }
                        else
                        {
                            if (p < count)
                            {
                                Response.Write("��һҳ|" + Html.ActionLink("��һҳ", "Admin", "ManageUser", new { page = p + 1 }, null));
                            }
                            else
                            {
                                Response.Write(Html.ActionLink("��һҳ", "Admin", "ManageUser", new { page = p - 1 }, null) + "|��һҳ");
                            }
                        }
                        Response.Write("|��ǰҳ���� <span style='font-weight:bolder; color:Red;'>" + p + "</span> ҳ|��ҳ�룺<span style='font-weight:bolder; color:Red;'>" + count + "</span> ҳ");
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
    <% } %>
</asp:Content>
