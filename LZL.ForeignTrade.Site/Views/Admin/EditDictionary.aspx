<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.master" Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.Dictionary>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑数据字典
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Dictionary♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Dictionary♂objectname" value="LZL.ForeignTrade.DataEntity.Dictionary,LZL.ForeignTrade.DataEntity" />
    <table width="100%"  class="list">
        <caption>
            编辑数据字典信息</caption>
        <thead align="center">
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDictionary") %>'" />
                </td>
            </tr>
            <%= Html.Hidden("Dictionary♂ID",Html.Encode(Model.ID.ToString())) %>
            <tr>
                <td style="width:30%; text-align:right;">
                    类型：
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary♂Type", Html.Encode(Model.Type))%>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    名称：
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary♂Name", Html.Encode(Model.Name))%>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    编码：
                </td>
                <td align="left">
                    <%= Html.TextBox("Dictionary♂Code", Html.Encode(Model.Code))%>
                </td>
            </tr>
        </thead>
        <!-- 备忘录区域 -->
        <tfoot>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="button" value="提 交" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="button" class="button" value="返 回" onclick="javascript:window.location.href ='<%=Url.Content("~/Admin/ManageDictionary") %>'" />
                </td>
            </tr>
        </tfoot>
    </table>
    <%} %>
</asp:Content>
