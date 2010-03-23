<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ExportContracts/ExportContracts.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    出口合同信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("ExportContractsIndex", Model); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <%= Html.ActionLink("添 加", "Add", "ExportContracts", null, new {Class="button" })%>
</asp:Content>
