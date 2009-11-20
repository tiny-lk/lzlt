<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ProductSummary>>" %>

<script type="text/javascript">

    //查询数据信息
    function loadlistdata(obj, name, value, p) {
        var tableobject = $(obj).closest("table");
        $.ajax({
            type: "get",
            dataType: "html",
            data: { quyerCondition: name, queryvalue: encodeURI(value), page: p },
            url: '<%=Url.Action("ProductSummaryIndex","Shared")%>',
            success: function(data) {
                $(tableobject).find("tfoot").html("");
                $(tableobject).find("tfoot").append($(data).find("tfoot").html());
                $(tableobject).find("tbody").html("");
                $(tableobject).find("tbody").append($(data).find("tbody").html());
            },
            error: function(err) {
                alert("列表数据错误！");
            }
        });
    }

</script>

<table width="100%" class="list">
    <caption>
        客户信息</caption>
    <thead>
        <tr>
            <td colspan="2">
                <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="公司简称", Value ="Name"},
                               new SelectListItem(){ Text="公司中文名称", Value ="NameCH"},
                            new SelectListItem(){Text="公司地址", Value ="AddressCH"}
                        }, "Value", "Text", "Name"))%>
            </td>
            <td colspan="6" align="left">
                <%= Html.TextBox("queryvalue", "", new { style = "width:50%;" })%>
                <input type="button" class="button" id="OK" value="查 询" disabled="disabled" />
                <input type="button" class="button" id="Refresh" value="刷 新" />
            </td>
        </tr>
    </thead>
    <tbody listmouse="listmouseovercss">
        <tr>
            <td>
                <a href="#" id="allselect">全选</a>/<a href="#" id="reverseselect">反选</a>
            </td>
            <td>
                编号
            </td>
            <td>
                商品款号
            </td>
            <td>
                海关代码
            </td>
            <td>
                商品数量
            </td>
            <td>
                英文单位
            </td>
            <td>
                商品外销单价
            </td>
            <td>
                商品外销金额
            </td>
            <td>
                描述
            </td>
            <td>
                备注
            </td>
        </tr>
        <%
            int page = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
            int beginenumber = page <= 1 ? 1 : ((page - 1) * int.Parse(ConfigurationManager.AppSettings["pagenumber"])) + 1;
            for (int i = 0; i < Model.Count; i++)
            {
                Model[i].ProductReference.Load();  
        %>
        <tr>
            <td>
                <%= Html.CheckBox("select", false, new { value = Html.Encode(Model[i].ID.ToString() + "|" + Html.Encode(Model[i].Product.NameCode)) })%>
            </td>
            <td>
                <%= (beginenumber+i).ToString()%>
            </td>
            <td>
                <%= Html.Encode(Model[i].Product.NameCode)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].CustomsCode)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].Amount)%>
            </td>
            <td>
                <%= LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].UnitEN))%>
            </td>
            <td>
                <%= Html.Encode(Model[i].ExportPrice)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].ExportAmount)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].DescriptionEN)%>
            </td>
            <td>
                <%= Html.Encode(Model[i].Note)%>
            </td>
        </tr>
        <%
            }
            
        %>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="7" align="right">
                <a href="#" class="print">打 印</a>|
                <%
                    int count = int.Parse(ViewData["pagecount"].ToString());
                    int p = Request["page"] == null ? 1 : int.Parse(Request["page"]);
                    if (p >= count && count <= 1)
                    {
                        Response.Write("上一页|下一页");
                    }
                    else
                    {
                        if (p < count)
                        {
                            if (p == 1)
                            {
                                Response.Write("上一页|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ")>下一页</a>");
                            }
                            else
                            {
                                Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ")>上一页</a>|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ")>下一页</a>");
                            }
                        }
                        else
                        {
                            Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ")>上一页</a>|下一页");
                        }
                    }
                    Response.Write("|当前页：第 <span style='font-weight:bolder; color:Red;'>" + p + "</span> 页|总页码：<span style='font-weight:bolder; color:Red;'>" + count + "</span> 页");
                %>
            </td>
        </tr>
    </tfoot>
</table>
