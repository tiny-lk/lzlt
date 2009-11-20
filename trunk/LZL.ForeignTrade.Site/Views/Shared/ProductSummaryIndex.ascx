<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ProductSummary>>" %>

<script type="text/javascript">

    //��ѯ������Ϣ
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
                alert("�б����ݴ���");
            }
        });
    }

</script>

<table width="100%" class="list">
    <caption>
        �ͻ���Ϣ</caption>
    <thead>
        <tr>
            <td colspan="2">
                <%=Html.DropDownList("quyerCondition",
                        new SelectList(new List<SelectListItem>() {
                            new SelectListItem(){ Text="��˾���", Value ="Name"},
                               new SelectListItem(){ Text="��˾��������", Value ="NameCH"},
                            new SelectListItem(){Text="��˾��ַ", Value ="AddressCH"}
                        }, "Value", "Text", "Name"))%>
            </td>
            <td colspan="6" align="left">
                <%= Html.TextBox("queryvalue", "", new { style = "width:50%;" })%>
                <input type="button" class="button" id="OK" value="�� ѯ" disabled="disabled" />
                <input type="button" class="button" id="Refresh" value="ˢ ��" />
            </td>
        </tr>
    </thead>
    <tbody listmouse="listmouseovercss">
        <tr>
            <td>
                <a href="#" id="allselect">ȫѡ</a>/<a href="#" id="reverseselect">��ѡ</a>
            </td>
            <td>
                ���
            </td>
            <td>
                ��Ʒ���
            </td>
            <td>
                ���ش���
            </td>
            <td>
                ��Ʒ����
            </td>
            <td>
                Ӣ�ĵ�λ
            </td>
            <td>
                ��Ʒ��������
            </td>
            <td>
                ��Ʒ�������
            </td>
            <td>
                ����
            </td>
            <td>
                ��ע
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
                <a href="#" class="print">�� ӡ</a>|
                <%
                    int count = int.Parse(ViewData["pagecount"].ToString());
                    int p = Request["page"] == null ? 1 : int.Parse(Request["page"]);
                    if (p >= count && count <= 1)
                    {
                        Response.Write("��һҳ|��һҳ");
                    }
                    else
                    {
                        if (p < count)
                        {
                            if (p == 1)
                            {
                                Response.Write("��һҳ|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ")>��һҳ</a>");
                            }
                            else
                            {
                                Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ")>��һҳ</a>|" + "<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page + 1) + ")>��һҳ</a>");
                            }
                        }
                        else
                        {
                            Response.Write("<a href='#' onclick=loadlistdata(this,'" + Request["quyerCondition"] + "','" + Server.UrlDecode(Request["queryvalue"]) + "'," + (page - 1) + ")>��һҳ</a>|��һҳ");
                        }
                    }
                    Response.Write("|��ǰҳ���� <span style='font-weight:bolder; color:Red;'>" + p + "</span> ҳ|��ҳ�룺<span style='font-weight:bolder; color:Red;'>" + count + "</span> ҳ");
                %>
            </td>
        </tr>
    </tfoot>
</table>
