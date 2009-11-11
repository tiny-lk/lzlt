<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.Linkman>>" %>
<div id="region">
    <!-- 标识子表添加总数 -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="Linkman♂regioncount"
        id="Linkman♂regioncount" />
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="Linkman♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="Linkman♂objectname" value="LZL.ForeignTrade.DataEntity.Linkman,LZL.ForeignTrade.DataEntity" />
    <!-- 标识子表外键实体对象名称、外键字段名称 -->
    <input type="hidden" name="Linkman♂fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Customer" :ViewData["FK"] %>' />
    <%= Html.Hidden("Linkman♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("Linkman♂iseditdate", "EditDate")%>
    <center>
        <h3>
            联系人动态区域</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#Linkman♂').css("display", "");
        });

    </script>

</div>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<div id="regioncontent">
    <table class="dynamictable">
        <%
            if (Model == null)
            {
                Response.Write(Html.Hidden("Linkman♂ID"));
            }
            else
            {
                Response.Write(Html.Hidden("Linkman♂ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" valign="middle" rowspan="4" style="width: 10%;">
                联系人信息
            </td>
            <td align="right" style="width: 15%;">
                联系人：
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman♂Name", "", new { validate = "required:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman♂Name", Html.Encode(Model[i].Name), new { validate = "required:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Name));
                        }
                    }
                %>
            </td>
            <td align="right" style="width: 15%;">
                职位：
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman♂Job"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman♂Job", Html.Encode(Model[i].Job)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Job));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                电话：
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman♂Phone"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman♂Phone", Html.Encode(Model[i].Phone)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Phone));
                        }
                    }
                %>
            </td>
            <td align="right">
                传真：
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman♂Fax"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman♂Fax", Html.Encode(Model[i].Fax)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Fax));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                移动电话：
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman♂MobilePhone"));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman♂MobilePhone", Html.Encode(Model[i].MobilePhone)));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].MobilePhone));
                        }
                    }
                %>
            </td>
            <td align="right">
                电子邮件：
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("Linkman♂Email", "", new { validate = "email:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("Linkman♂Email", Html.Encode(Model[i].Email), new { validate = "email:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Email));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                联系人备注：
            </td>
            <td align="left" colspan="3">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextArea("Linkman♂Note", new { style = "width: 99%; height: 80px;" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextArea("Linkman♂Note", Html.Encode(Model[i].Note), new { style = "width: 99%; height: 80px;" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Note));
                        }
                    }
                %>
            </td>
        </tr>
        <%
            if (ViewData["Details"] == null)
            {
        %>
        <tr>
            <td colspan="5" align="right">
                <input type="button" class="button" value="添 加" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="删 除" onclick="deleteregion(this);" />
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%  
    }
%>
