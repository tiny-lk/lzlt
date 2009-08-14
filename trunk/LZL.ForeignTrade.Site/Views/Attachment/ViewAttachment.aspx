<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Attachment/Attachment.Master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.TableAttachment>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    查看或下载资源
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        查看或下载资源</h2>

    <script type="text/javascript">
        function ViewFileInSuccess(data) {
            if (kzm == "png" || kzm == "jpg" || kzm == "jpeg" || kzm == "bmp" || kzm == "gif") {
                $("#hcfjxx-3").find("img").show('slow');
                $("#hcfjxx-3").find("img").attr("src", data);
            }
            else if (kzm == "doc" || kzm == "docx" || kzm == "xls" || kzm == "xlsx" || kzm == "ppt" || kzm == "pptx" || kzm == "mdb" || kzm == "mdbx") {
                var openDocObj = new ActiveXObject("SharePoint.OpenDocuments.3");
                openDocObj.ViewDocument(data);
            }
            else {
                window.open(data, "newwindow");
            }
        }
    </script>

 
    <div id="attachPanel">
        <%
        if (!IsPostBack)
        {
            if (Model == null)
            {
                Response.Write("没有附件信息！");
            }
            else
            {
                Response.ClearContent();

                byte[] bArr = Model.FileData;
                string strFileType = Model.FileExt;
                strFileType = strFileType.ToLower();

                //控制生成的文件名字
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", Model.FileName));
                
                if (strFileType.CompareTo("jpg") == 0 || strFileType.CompareTo("gif") == 0 ||
                    strFileType.CompareTo("png") == 0 || strFileType.CompareTo("bmp") == 0)
                {
                    Response.ContentType = string.Format("image/{0}", strFileType);
                }
                if (strFileType.CompareTo("xls") == 0)
                {
                    Response.ContentType = "application/vnd.ms-excel";
                }
                if (strFileType.CompareTo("doc") == 0)
                {
                    Response.ContentType = "application/msword";
                }
                if (strFileType.CompareTo("ppt") == 0)
                {
                    Response.ContentType = "application/vnd.ms-powerpoint";
                }
                if (strFileType.CompareTo("rtf") == 0)
                {
                    Response.ContentType = "application/rtf";
                }
                if (strFileType.CompareTo("pdf") == 0)
                {
                    Response.ContentType = "application/pdf";
                }
                if (strFileType.CompareTo("zip") == 0)
                {
                    Response.ContentType = "application/zip";
                }
                Response.BinaryWrite(bArr);

                Response.Flush();
            }
        }
        %>
    </div>
    
</asp:Content>
