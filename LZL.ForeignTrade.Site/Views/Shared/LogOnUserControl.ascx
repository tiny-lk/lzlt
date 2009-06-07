<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated)
    {
%>
<b>
    <%= Html.Encode(Page.User.Identity.Name) %></b>|
<%= Html.ActionLink("我的帐户", "UserProfile", "Account")%>|
<%= Html.ActionLink("注销", "LogOff", "Account")%>
<%
    }
    else
    {
%>
<%= Html.ActionLink("登录", "LogOn", "Account") %>
<%
    }
%>
