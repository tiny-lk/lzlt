<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<LZL.ForeignTrade.DataEntity.Image>" %>

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

    function showimage(key) {
        $("#image").find("img").attr("src", '<%=Url.Action("ShowImage", "Shared") %>' + "/" + key);
    }

    function deleteimage(id) {
        $.ajax({
            type: "get",
            dataType: "html",
            data: { imageid: id, fid: '<%= Request["fid"] %>', imagetype: '<%= Request["imagetype"]%>' },
            url: '<%=Url.Action("DeleteImage","Shared")%>',
            success: function(data) {
                $("#imageview").children().remove();
                $("#imageview").append(data);
            },
            error: function() {
                alert("删除失败！");
            }
        });

    }
</script>

<div id="imageview" style="width: 100%; height: 100%;">
    <div style="float: left; width: 100px; position: relative; z-index: 999999;">
        <ul id="treenavigation">
            <%=ViewData["tree"] %>
        </ul>
        <a href="#" onclick="deleteimage('<%= Model==null?"":Model.ID.ToString() %>');" class="button">
            删除</a>
    </div>
    <div id="image" style="float: left; width: 800px;">
        <%
            if (Model == null)
            {
                Response.Write("没有找到图片信息！");
            }
            else
            {
        %>
        <center>
            <img src='<%=Url.Action("ShowImage", "Shared", new { id = Model.ID.ToString() }) %>'
                alt="图片信息" style="cursor: move;" title='<%=  Html.Encode( Model.Note) %>' />
        </center>
        <%
            }  
        %>
    </div>
</div>
