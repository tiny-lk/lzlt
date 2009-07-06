<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUser>" %>

<asp:Content ID="EditUserTitle" ContentPlaceHolderID="TitleContent" runat="server">
    编辑用户
</asp:Content>
<asp:Content ID="EditUserContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>编辑用户</h2>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js")%>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $.validator.setDefaults();
            $("input[name='Return']").bind("click", function() {
                window.location.href = '<%=Url.Content("~/Admin/ManageUser/") %>';
            });

            $($("form")).validate({
                rules: {
                    UserName: {
                        required: true
                    },
                    Email: {
                        required: true,
                        email: true
                    },
                    Password: {
                        minlength: 5,
                        required: true
                    },
                    confirmPassword: {
                        minlength: 5,
                        required: true,
                        equalTo: "#Password"
                    }
                },
                messages: {
                    UserName: {
                        required: "用户名不能为空！"
                    },
                    Email: {
                        required: "邮箱地址不能为空！",
                        email: "输入邮箱地址错误！"
                    },
                    Password: {
                        minlength: "密码最小长度不能小于6！",
                        required: "密码不能为空！"
                    },
                    confirmPassword: {
                        required: "重复密码不能为空！",
                        equalTo: "密码不一致！"
                    }
                }
            });

        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <p>
        <input type="submit" value="更 新" />
        <input name="Return" type="button" value="返 回" />
    </p>
    <fieldset>
        <legend>用户信息</legend>
        <%= Html.Hidden("id")%>
        <p>
            <label for="UserName">
                用户名称：</label>
            <%=Html.TextBox("UserName", Model.UserName, new { disabled = true })%>
        </p>
        <p>
            <label for="Email">
                E-Mail：</label><%=Html.TextBox("Email", Model.Email)%></p>
        <p>
            <label for="Password">
                密 码：</label>
            <%= Html.Password("Password", Model.GetPassword())%></p>
        <p>
            <label for="Password">
                确认密码：</label>
            <%= Html.Password("confirmPassword", Model.GetPassword())%></p>
        <p>
            <label for="approved">
                是有效：</label>
            <%= Html.CheckBox("approved", Model.IsApproved)%></p>
        <p>
            <label for="Note">
                备注信息：</label>
            <%= Html.TextArea("note",Model.Comment,4,50,null) %>
        </p>
    </fieldset>
    <fieldset>
        <legend>角色信息</legend>
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
        <input id="Edit" type="submit" value="更 新" />
        <input name="Return" type="button" value="返 回" />
    </p>
    <%}
    %>
</asp:Content>
