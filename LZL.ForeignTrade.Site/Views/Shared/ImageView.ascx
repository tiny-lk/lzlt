<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<LZL.ForeignTrade.DataEntity.Image>" %>

<script type="text/javascript" src='<%= Url.Content("~/Scripts/ui.dialog.js")%>'></script>

<script type="text/javascript" src='<%= Url.Content("~/Scripts/jquery.treeview.js")%>'></script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#image").draggable();
        $("#treenavigation").treeview({
            persist: "location",
            collapsed: true,
            unique: true
        });
    });
</script>

<div id="imageview" style="position: relative;">
    <div style="float: left; width: 100px; position: relative; z-index: 99999999;">
        <ul id="treenavigation">
            <%=ViewData["tree"] %>
        </ul>
    </div>
    <div id="image" style="vertical-align: top; float: left; width: 90%;">
        <%
            if (Model == null)
            {
                Response.Write("没有找到图片信息！");
            }
            else
            {
        %>
        <img src='<%=Url.Action("ShowImage", "Shared", new { id = Model.ID.ToString() }) %>'
            alt="图片信息" style="cursor: move;" title='<%= Html.Encode( Model.Note) %>'  />
        <%
            }  
        %>
    </div>
</div>
