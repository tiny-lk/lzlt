<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Attachment/Attachment.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    资源下载
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%"  class="list">
        <caption>
            资源下载</caption>
        <thead>
            <tr>
                <td>
                    文件名称
                </td>
                <td>
                    下载
                </td>
            </tr>
        </thead>
        <%
            string strFileContent = string.Empty;
            foreach (string strFile in (List<string>)ViewData["Resource"])
            {
                strFileContent += string.Format(@"<tr>
                    <td>
                        {0}
                    </td>
                    <td>
                        <a href='../Views/Attachment/ResourceFolder/{0}'>下载</a>
                    </td>
                </tr>", strFile);
            }
            Response.Write(strFileContent);
        %>
    </table>
</asp:Content>
