<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Attachment/Attachment.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��Դ����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%"  class="list">
        <caption>
            ��Դ����</caption>
        <thead>
            <tr>
                <td>
                    �ļ�����
                </td>
                <td>
                    ����
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
                        <a href='../Views/Attachment/ResourceFolder/{0}'>����</a>
                    </td>
                </tr>", strFile);
            }
            Response.Write(strFileContent);
        %>
    </table>
</asp:Content>
