<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    系统发生错误
</asp:Content>
<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        错误：<%= Model.Exception.Message%>
        ！动作：<%= Model.ActionName %>！控制对象：<%= Model.ControllerName %>
    </h2>
    <h2>
        <input type="button" class="button" value="返 回" onclick="javascript:history.back(1);" /></h2>
</asp:Content>
