<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Account/Account.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="profileTitle" ContentPlaceHolderID="TitleContent" runat="server">
    �˻���Ϣ
</asp:Content>
<asp:Content ID="profileContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        �˻���Ϣ</h2>
    <p>
        �˻��ĸ�����Ϣ
    </p>
    <%= Html.ValidationSummary("���˻�����Ϣ�޸�ʧ�ܣ��������������ԡ�")%>
    <% using (Html.BeginForm())
       {
           var user = ViewData.Model as MembershipUser;%>
    <div>
        <fieldset>
            <legend>�ʻ�������Ϣ</legend>
            <p>
                �û��� ��<%= Html.Encode(user.UserName) %><br />
            </p>
            <p>
                �����ʼ���<%= Html.TextBox("email",user.Email) %>
                <%= Html.ValidationMessage("email") %>
            </p>
            <p>
                ����ʱ�䣺<%= user.CreationDate.ToLocalTime() %><br />
                ����¼ʱ�䣺<%= user.LastLoginDate.ToLocalTime() %><br />
            </p>
            <p>
                <input type="submit" class="button" value="�޸�" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
