<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/Customer.master"
    Inherits="System.Web.Mvc.ViewPage<List<LZL.ForeignTrade.DataEntity.Customer>>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    客户信息
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("CustomerIndex", Model); %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
<%= Html.ActionLink("添 加", "Add", "Customer",null, new { Class = "button" })%>
</asp:Content>
