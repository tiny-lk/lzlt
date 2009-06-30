<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        备忘录动态区域</h3>
    <input type="hidden" value="1" name="bwl★regioncount" id="bwl★regioncount" /><!-- 标识子表添加总数 -->
    <input type="hidden" name="region" value="bwl★" /><!-- 标识子表区域名称 -->
    <input type="hidden" name="bwl★objectname" value="LZL.ForeignTrade.DataEntity,LZL.ForeignTrade.DataEntity.Memorandum" /><!-- 标识子表名称 -->
    
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
            <input type="text" name="bwl★rq" />
        </td>
        <td style="width: 20%;" align="right">
            主题：
        </td>
        <td style="width: 20%;" align="right">
            <input type="text" name="bwl★zt" />
        </td>
    </tr>
    <tr>
        <td align="right">
            备忘内容：
        </td>
        <td align="left" colspan="3">
            <textarea name="bwl★nr" style="width: 99%; height: 80px;" cols="5"></textarea>
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