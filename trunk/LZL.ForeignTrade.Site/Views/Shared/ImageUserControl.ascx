<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.form.js")%>"></script>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#imageform").ajaxForm(function() {
            $("input[name='Name']").val("");
            $("input[name='TypeCode']").val("");
            $("textarea[name='Note']").val("");
            alert("添加完成！");
        });

        $("#imageviewer").bind("click", function() {
            $("#imageviewmodedialog").remove();
            $("body").append("<div id='imageviewmodedialog'><p style='color:Red;'>正在加载中...</p></div>");
            $("#imageviewmodedialog").dialog({
                bgiframe: true,
                height: 'auto',
                modal: false,
                width: 960,
                position: 'top',
                resizable: true,
                draggable: true,
                title: '显示图片信息',
                closeOnEscape: true
            });
            $("#imageviewmodedialog").dialog();
            $("#imageviewmodedialog").dialog('open');
            $.ajax({
                type: "get",
                dataType: "html",
                data: { fid: $("#fid").val(), imagetype: encodeURI('商品图片类型') },
                url: '<%=Url.Action("ImageView","Shared")%>',
                success: function(data) {
                    $("#imageviewmodedialog").children().remove();
                    $("#imageviewmodedialog").append(data);
                },
                error: function() {
                    alert("添加表单数据失败！");
                }
            });
        });

        $("#imageform").validate({
            rules: {
                Name: {
                    required: true
                },
                TypeCode: {
                    required: true
                },
                Attachment: {
                    required: true,
                    accept: "png|jpe?g|gif"
                }
            }
        });

    });
</script>

<% using (Html.BeginForm("ImageUserControl", "Shared", FormMethod.Post, new { id = "imageform", enctype = "multipart/form-data" }))
   {
%>
<%=Html.Hidden("fid", ViewData["fid"])%>
<table class="dynamictable">
    <tr>
        <td align="center" valign="middle" rowspan="3">
            附件信息
        </td>
        <td align="right">
            附件名称：
        </td>
        <td align="left">
            <%=Html.TextBox("Name")%>
        </td>
        <td align="right">
            附件类型：
        </td>
        <td align="left">
            <%=Html.TextBox("TypeCode")%>
        </td>
    </tr>
    <tr>
        <td align="right">
            选择文件：
        </td>
        <td align="left" colspan="3">
            <input type="file" name="Attachment" style="width: 99%;" />
        </td>
    </tr>
    <tr>
        <td align="right">
            备注：
        </td>
        <td align="left" colspan="3">
            <%=Html.TextArea("Note", new { style = "width: 99%; height: 80px;" })%>
        </td>
    </tr>
    <tr>
        <td colspan="5" align="right">
            <span style="color: Red;">注:图片不大于3M。</span>
            <input type="button" value="查 看" id="imageviewer" />
            <input type="submit" value="添 加" />
        </td>
    </tr>
</table>
<%} %>
