<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Attachment/Attachment.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ��Դ����
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ��Դ����</h2>
    <div style="text-align: center">
        <table style="width: 100%">
            <tr>
                <th>
                    �ļ�����
                </th>
                <th>
                    ����
                </th>
            </tr>
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
    </div>
</asp:Content>
