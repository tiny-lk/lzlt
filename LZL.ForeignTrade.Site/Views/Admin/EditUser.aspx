<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUser>" %>

<asp:Content ID="EditUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    �༭�û�
</asp:Content>
<asp:Content ID="EditUserContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �༭�û�</h2>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#Return").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageUser/") %>';
            });
            $("#Edit").bind("click", function() {
                $("form").submit();
            });
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <fieldset>
        <legend>�û���Ϣ</legend>
        <%= Html.Hidden("id")%>
        <p>
            <label for="UserName">
                �û����ƣ�</label>
            <%=Html.TextBox("UserName", Model.UserName) %>
        </p>
        <p>
            <label for="Email">
                E-Mail��</label><%=Html.TextBox("Email", Model.Email)%></p>
        <p>
            <label for="Password">
                �� �룺</label>
            <%= Html.Password("Password")%></p>
                    <p>
            <label for="Password">
                 ȷ�����룺</label>
            <%= Html.Password("confirmPassword")%></p>
        <p>
            <label for="approved">
                ����Ч��</label>
            <%= Html.CheckBox("approved", Model.IsApproved)%></p>
        <p>
            <label for="approved">
                ��������</label>
            <%= Html.CheckBox("lockedOut", Model.IsLockedOut)%></p>
    </fieldset>
    <ul>
        <% foreach (string role in (string[])ViewData["roles"])
           { %>
        <li>
            <%= Html.CheckBox("role." + role, Roles.IsUserInRole(Model.UserName, role))%>
            <label for="role.<%= role %>">
                <%= role%></label></li>
        <% } %>
    </ul>
    <p>
        <input type="submit" value="�� ��" id="Edit" />
        <input id="Return" type="button" value="�� ��" />
    </p>
    <%}
    %>
</asp:Content>
