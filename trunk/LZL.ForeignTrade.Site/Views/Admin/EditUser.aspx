<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUser>" %>

<asp:Content ID="EditUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    �༭�û�
</asp:Content>
<asp:Content ID="EditUserContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �༭�û�</h2>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='Return']").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageUser/") %>';
            });
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <p>
        <input type="submit" value="�� ��" />
        <input name="Return" type="button" value="�� ��" />
    </p>
    <fieldset>
        <legend>�û���Ϣ</legend>
        <%= Html.Hidden("id")%>
        <p>
            <label for="UserName">
                �û����ƣ�</label>
            <%=Html.TextBox("UserName", Model.UserName, new { disabled = true, validate = "required:true" })%>
        </p>
        <p>
            <label for="Email">
                E-Mail��</label><%=Html.TextBox("Email", Model.Email, new { validate = "email:true, required:true" })%></p>
        <p>
            <label for="Password">
                �� �룺</label>
            <%= Html.Password("Password", Model.GetPassword(), new { validate = "required:true,minlength:5" })%></p>
        <p>
            <label for="Password">
                ȷ�����룺</label>
            <%= Html.Password("confirmPassword", Model.GetPassword(), new { validate = "required:true,equalTo:'#Password', minlength:5" })%></p>
        <p>
            <label for="approved">
                ����Ч��</label>
            <%= Html.CheckBox("approved", Model.IsApproved)%></p>
        <p>
            <label for="Note">
                ��ע��Ϣ��</label>
            <%= Html.TextArea("note",Model.Comment,4,50,null) %>
        </p>
    </fieldset>
    <fieldset>
        <legend>��ɫ��Ϣ</legend>
        <ul style="list-style-type: decimal;">
            <% foreach (string role in (string[])ViewData["roles"])
               { %>
            <li>
                <%= Html.CheckBox("role", Roles.IsUserInRole(Model.UserName, role), new { value = role })%>
                <%= role%>
            </li>
            <% } %>
        </ul>
    </fieldset>
    <p>
        <input id="Edit" type="submit" value="�� ��" />
        <input name="Return" type="button" value="�� ��" />
    </p>
    <%}
    %>
</asp:Content>
