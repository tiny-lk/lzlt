<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        备忘录动态区域</h3>
    <!-- 标识子表添加总数 -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="Memorandum♂regioncount" id="Memorandum♂regioncount" />
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Memorandum♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Memorandum♂objectname" value="LZL.ForeignTrade.DataEntity.Memorandum,LZL.ForeignTrade.DataEntity" />
    <!-- 标识子表外键实体对象名称、外键字段名称 -->
    <input type="hidden" name="LinkMan♂fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
</center>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<table class="dynamictable">
    <tr>
        <td align="center" valign="middle" rowspan="2" style="width: 20%;">
            备忘录信息
        </td>
        <td style="width: 20%;" align="right">
            日期：
        </td>
        <td style="width: 20%;" align="right">
            <input type="text" name="Memorandum♂rq" />
        </td>
        <td style="width: 20%;" align="right">
            主题：
        </td>
        <td style="width: 20%;" align="right">
            <input type="text" name="Memorandum♂zt" />
        </td>
    </tr>
    <tr>
        <td align="right">
            备忘内容：
        </td>
        <td align="left" colspan="3">
            <textarea name="Memorandum♂nr" style="width: 99%; height: 80px;" cols="5"></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="5" align="right">
            <input type="button" value="添 加" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="删 除" onclick="deleteregion(this);" />
        </td>
    </tr>
</table>
<%
    }
%>