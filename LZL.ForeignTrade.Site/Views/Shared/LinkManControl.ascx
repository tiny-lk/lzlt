<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        联系人动态区域</h3>
    <input type="hidden" value="1" name="lxr★regioncount" id="lxr★regioncount" /><!-- 标识子表添加总数 -->
    <input type="hidden" name="region" value="lxr★" /><!-- 标识子表区域名称 -->
    <input type="hidden" name="lxr★objectname" value="LZL.ForeignTrade.DataEntity,LZL.ForeignTrade.DataEntity.Linkman" /><!-- 标识子表对象名称 -->
</center>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<table class="dynamictable">
    <tr>
        <td align="center" valign="middle" rowspan="4" style="width: 20%;">
            联系人信息
        </td>
        <td align="right" style="width: 20%;">
            联系人：
        </td>
        <td align="left" style="width: 20%;">
            <input type="text" name="lxr★name" />
        </td>
        <td align="right" style="width: 20%;">
            职位：
        </td>
        <td align="left" style="width: 20%;">
            <input type="text" name="lxr★zw" />
        </td>
    </tr>
    <tr>
        <td align="right">
            电话：
        </td>
        <td align="left">
            <input type="text" name="lxr★dh" />
        </td>
        <td align="right">
            传真：
        </td>
        <td align="left">
            <input type="text" name="lxr★cz" />
        </td>
    </tr>
    <tr>
        <td align="right">
            移动电话：
        </td>
        <td align="left">
            <input type="text" name="lxr★yddh" />
        </td>
        <td align="right">
            电子邮件：
        </td>
        <td align="left">
            <input type="text" name="lxr★dzyj" />
        </td>
    </tr>
    <tr>
        <td align="right">
            联系人备注：
        </td>
        <td align="left" colspan="3">
            <textarea name="lxr★bz" style="width: 99%; height: 80px;" cols="5"></textarea>
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