<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUserCollection>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �û���������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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

            $("#ReturnMainPage").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageDepartment/") %>';
            });

            $("#SaveRelation").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/SaveUserRelation") %>' + '?id=' + $(document).data('checkvalue') + "&DepartId=" + $("#DepartId").val();
                //window.location.href = '<%=Url.Action("SaveUserRelation","Admin")%>' + '?id=' + $(document).data('checkvalue') + "&DepartId=" + $("#DepartId").value;
            });
        });

    </script>

    <% using (Html.BeginForm())
       { %>
    <%= Html.Hidden("DepartId", Html.ViewContext.RequestContext.RouteData.Values["id"])%>
    <table width="100%" class="list">
        <caption>
            �û���������</caption>
        <thead>
            <tr>
                <td>
                    <%= Html.DropDownList("searchType", (SelectList)ViewData["searchOptionList"])%>
                </td>
                <td>
                    <%= Html.TextBox("searchInput", ViewData["searchInput"])%>
                </td>
                <td>
                    <input type="button" id="SaveRelation" value="�������" disabled="disabled" check="n" />
                    <input type="button" id="ReturnMainPage" value="����" />
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
            </tr>
            <% foreach (MembershipUser membershipUser in ViewData.Model)
               { %>
            <tr id="user-<%= membershipUser.UserName %>">
                <td>
                    <%
                        bool bNoData = false;
                        foreach (LZL.ForeignTrade.DataEntity.UserDepartRelation objUser in (List<LZL.ForeignTrade.DataEntity.UserDepartRelation>)ViewData["UserRelation"])
                        {
                            if (objUser.UserId == membershipUser.UserName)
                            {
                                bNoData = true;
                            }
                        }

                        Response.Write(Html.CheckBox("select", bNoData, new { value = Html.Encode(membershipUser.UserName.ToString()) }));
                    %>
                </td>
                <td>
                    <%= membershipUser.UserName%>
                </td>
                <td>
                    <%= membershipUser.Email%>
                </td>
            </tr>
            <% } %>
        </tbody>
        <tfoot>
        </tfoot>
    </table>
    <% } %>
</asp:Content>
