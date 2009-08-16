<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Invoice/Invoice.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ∑¢∆±–≈œ¢
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("InvoiceIndex", Model); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
