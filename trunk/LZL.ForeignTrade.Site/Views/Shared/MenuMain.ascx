<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<ul id="treemenu">
    <li>
        <%= Html.ActionLink("主页", "Index", "Home") %></li>
    <li class="open"><a href="#">业务功能</a>
        <ul>
            <li>
                <%= Html.ActionLink("商品信息", "Index", "Product")%></li>
            <li>
                <%= Html.ActionLink("客户信息", "Index", "Customer")%></li>
            <li>
                <%= Html.ActionLink("出口合同信息", "Index", "ExportContracts")%></li>
            <li>
                <%= Html.ActionLink("采购合同信息", "Index", "StockContracts")%></li>
            <li>
                <%= Html.ActionLink("报价单信息", "Index", "Price")%></li>
            <li>
                <%= Html.ActionLink("发票单证管理", "Index", "Invoice")%></li>
            <li>
                <%= Html.ActionLink("资源管理", "AttachmentDownload", "Attachment")%></li>
            <li>
                <%= Html.ActionLink("仓库管理", "WarehouseManager", "Warehouse")%></li>
        </ul>
    </li>
    <li>
        <%= Html.ActionLink("管理", "Index", "Admin")%></li>
    <li>
        <%= Html.ActionLink("关于", "Home", "About")%></li>
</ul>
