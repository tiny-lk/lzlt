<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PrintWord</title>
</head>
<body>
    <div>
        <%
            //if (Page.IsPostBack)
            ////{
            ////    Response.Clear();
            ////    string path = Server.MapPath("~/DocTemplate/Template/invoice.doc");
            //    string targetpath = Server.MapPath("~/DocTemplate/Print/");

            //    this.Response.Buffer = true;
            //    byte[] tempbuffer = LZL.ForeignTrade.Controllers.WordInvoiceHelper.Instance.BuilderInvoice(new Guid(this.Model.ToString()), path, targetpath);
            //    Response.ContentType = "application/ms-word";
            //    Response.AppendHeader("Content-Disposition", "inline;filename=test.doc");
            //    Response.BinaryWrite(tempbuffer);
            //    this.Response.Flush();
            //    this.Response.End();
            //}
            %>
    </div>
</body>
</html>
