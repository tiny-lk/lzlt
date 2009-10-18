<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.AccessoriesChildBuy>>" %>
<div id="region">
    <!-- 标识子表添加总数 -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="AccessoriesChildBuy♂regioncount"
        id="AccessoriesChildBuy♂regioncount" />
    <!-- 标识子表区域名称(表格名称、实体对象名称) -->
    <input type="hidden" name="region" value="AccessoriesChildBuy♂" />
    <!-- 标识子表实体对象类 -->
    <input type="hidden" name="AccessoriesChildBuy♂objectname" value="LZL.ForeignTrade.DataEntity.AccessoriesChildBuy,LZL.ForeignTrade.DataEntity" />
    <!-- 标识子表外键实体对象名称、外键字段名称 -->
    <input type="hidden" name="AccessoriesChildBuy♂fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "AccessoriesBuy" :ViewData["FK"] %>' />
    <%= Html.Hidden("AccessoriesChildBuy♂iscreatedate", "CreateDate")%>
    <%= Html.Hidden("AccessoriesChildBuy♂iseditdate", "EditDate")%>
    <center>
        <h3>
            其它辅助动态区域</h3>
    </center>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#AccessoriesChildBuy♂').css("display", "");
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
                Response.Write(Html.Hidden("AccessoriesChildBuy♂ID"));
            }
            else
            {
                Response.Write(Html.Hidden("AccessoriesChildBuy♂ID", Model[i].ID.ToString()));
            }
        %>
        <tr>
            <td align="center" valign="middle" rowspan="3" style="width: 10%;">
                其它信息
            </td>
            <td align="right" style="width: 15%;">
                类型：
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy♂AccessoriesType", "", new { validate = "required:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy♂AccessoriesType", Html.Encode(Model[i].AccessoriesType), new { validate = "required:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].AccessoriesType));
                        }
                    }
                %>
            </td>
            <td align="right" style="width: 15%;">
                名称：
            </td>
            <td align="left" style="width: 30%;">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy♂AccessoriesName", "", new { validate = "required:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy♂AccessoriesName", Html.Encode(Model[i].AccessoriesName), new { validate = "required:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].AccessoriesName));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                单价：
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy♂Price", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy♂Price", Html.Encode(Model[i].Price), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Price));
                        }
                    }
                %>
            </td>
            <td align="right">
                总数：
            </td>
            <td align="left">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy♂Count", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy♂Count", Html.Encode(Model[i].Count), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Count));
                        }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="right">
                重量：
            </td>
            <td align="left" colspan="3">
                <%
                    if (Model == null)
                    {
                        Response.Write(Html.TextBox("AccessoriesChildBuy♂Weight", "", new { validate = "number:true" }));
                    }
                    else
                    {
                        if (ViewData["Details"] == null)
                        {
                            Response.Write(Html.TextBox("AccessoriesChildBuy♂Weight", Html.Encode(Model[i].Weight), new { validate = "number:true" }));
                        }
                        else
                        {
                            Response.Write(Html.Encode(Model[i].Weight));
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
                <input type="button" value="添 加" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="删 除" onclick="deleteregion(this);" />
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
