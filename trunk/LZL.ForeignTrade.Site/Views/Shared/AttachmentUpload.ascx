<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.form.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#imageform").ajaxForm(function() {
            $("input[name='KeyName']").val("");
            $("textarea[name='Notes']").val("");
            alert("添加完成！");
            window.location.href = window.location.href;
        });

     });
</script>

<% using (Html.BeginForm("AttachmentUpload", "Attachment", FormMethod.Post, new { id = "imageform", enctype = "multipart/form-data" }))
   {
%>
<table class="dynamictable">
    <tr>
        <td align="center" valign="middle" rowspan="3">
            附件信息
        </td>
        <td align="right">
            附件名称：
        </td>
        <td align="left">
            <%=Html.TextBox("KeyName")%>
        </td>
    </tr>
    <tr>
        <td align="right">
            选择文件：
        </td>
        <td align="left" colspan="3">
            <input type="file" name="FileData" style="width: 99%;" />
        </td>
    </tr>
    <tr>
        <td align="right">
            备注：
        </td>
        <td align="left" colspan="3">
            <%=Html.TextArea("Notes", new { style = "width: 99%; height: 80px;" })%>
        </td>
    </tr>
    <tr>
        <td colspan="5" align="right">
            <span style="color: Red;">注:文件不大于3M。</span>
            <input type="submit" value="添 加" />
        </td>
    </tr>
</table>
<%} %>