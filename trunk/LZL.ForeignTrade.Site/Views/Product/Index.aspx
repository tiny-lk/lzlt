<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Product/Product.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="ProductTitle" ContentPlaceHolderID="TitleContent" runat="server">
    ��Ʒ��Ϣ
</asp:Content>
<asp:Content ID="ProductMain" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("ProductIndex", Model); %>
</asp:Content>
<asp:Content ID="ProductChildAction" ContentPlaceHolderID="ChildActionContent" runat="server">
</asp:Content>
