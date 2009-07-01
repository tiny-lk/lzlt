<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<center>
    <h3>
        联系人动态区域</h3>
    <!-- 标识子表添加总数 -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="LinkMan♂regioncount"
        id="LinkMan♂regioncount" />
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="LinkMan♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="LinkMan♂objectname" value="LZL.ForeignTrade.DataEntity.Linkman,LZL.ForeignTrade.DataEntity" />
    <!-- 标识子表外键实体对象名称、外键字段名称 -->
    <input type="hidden" name="LinkMan♂fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
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
            <input type="text" name="LinkMan♂Name" />
        </td>
        <td align="right" style="width: 20%;">
            职位：
        </td>
        <td align="left" style="width: 20%;">
            <input type="text" name="LinkMan♂Job" />
        </td>
    </tr>
    <tr>
        <td align="right">
            电话：
        </td>
        <td align="left">
            <input type="text" name="LinkMan♂Phone" />
        </td>
        <td align="right">
            传真：
        </td>
        <td align="left">
            <input type="text" name="LinkMan♂Fax" />
        </td>
    </tr>
    <tr>
        <td align="right">
            移动电话：
        </td>
        <td align="left">
            <input type="text" name="LinkMan♂MobilePhone" />
        </td>
        <td align="right">
            电子邮件：
        </td>
        <td align="left">
            <input type="text" name="LinkMan♂Email" />
        </td>
    </tr>
    <tr>
        <td align="right">
            联系人备注：
        </td>
        <td align="left" colspan="3">
            <textarea name="LinkMan♂Note" style="width: 99%; height: 80px;" cols="5"></textarea>
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