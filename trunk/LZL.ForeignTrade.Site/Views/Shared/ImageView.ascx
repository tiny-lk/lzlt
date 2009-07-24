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
</script>

<div id="imageview" style="width: 100%; height: 100%;">
    <div style="float: left; width: 100px; position: relative; z-index: 999999;">
        <ul id="treenavigation">
            <%=ViewData["tree"] %>
        </ul>
    </div>
    <div id="image" style="float: left; width: 800px;">
        <%
            if (Model == null)
            {
                Response.Write("û���ҵ�ͼƬ��Ϣ��");
            }
            else
            {
        %>
        <center>
            <img src='<%=Url.Action("ShowImage", "Shared", new { id = Model.ID.ToString() }) %>'
                alt="ͼƬ��Ϣ" style="cursor: move;" title='<%= Html.Encode( Model.Note) %>' />
        </center>
        <%
            }  
        %>
    </div>
</div>
