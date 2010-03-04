<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ProductPack>>" %>
<div id="region">
    <!-- ��ʶ�ӱ�������� -->
    <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="ProductPack��regioncount"
        id="ProductPack��regioncount" />
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="ProductPack��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="ProductPack��objectname" value="LZL.ForeignTrade.DataEntity.ProductPack,LZL.ForeignTrade.DataEntity" />
    <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
    <input type="hidden" name="ProductPack��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "ExportContracts" :ViewData["FK"] %>' />
    <%= Html.Hidden("ProductPack��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("ProductPack��iseditdate", "EditDate")%>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#ProductPack��').css("display", "");
        });

        $(document).ready(function() {
            $("#ProductPack��SinglePackBulk").bind("dblclick", function() {
                var tj = Number($("#ProductPack��PackLength").val() / 100) * Number($("#ProductPack��PackWidth").val() / 100) * Number($("#ProductPack��PackHeight").val() / 100);
                if (tj != 0) {
                    $("#ProductPack��SinglePackBulk").val(tj.toFixed(2));
                }
            });

            $("#ProductPack��PackBulk").bind("dblclick", function() {
                var tj = Number($("#ProductPack��SinglePackBulk").val()) * Number($("#ProductPack��SingleProductAmount").val());
                if (tj != 0) {
                    $("#ProductPack��PackBulk").val(tj.toFixed(2));
                }
            });

            $("#ProductPack��GrossWeight").bind("dblclick", function() {
                var tj = Number($("#ProductPack��SingleGrossWeight").val()) * Number($("#ProductPack��SingleProductAmount").val());
                if (tj != 0) {
                    $("#ProductPack��GrossWeight").val(tj.toFixed(2));
                }
            });

            $("#ProductPack��NetWeight").bind("dblclick", function() {
                var tj = Number($("#ProductPack��SingleNetWeight").val()) * Number($("#ProductPack��SingleProductAmount").val());
                if (tj != 0) {
                    $("#ProductPack��NetWeight").val(tj.toFixed(2));
                }
            });

        });

        function toggle(obj) {
            if ($(obj).val() == "�� ��") {
                $(obj).val("չ ��");
            } else {
                $(obj).val("�� ��");
            }
            $(obj).closest("table").find("tbody").toggle("slow");
        }
        
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_ProductPack��ProductID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    selectFirst: false,
                    scrollHeight: 300,
                    dataType: 'json',
                    autoFill: false,
                    extraParams: { t: "Product", f: "NameCode" },
                    parse: function(data) {
                        var rows = [];
                        $.each(data, function(i, o) {
                            rows[rows.length] = { data: o, value: i, result: o
                            };
                        }); return rows;
                    },
                    formatItem: function(row, i, n) {
                        return row;
                    }
                });

            $("input[name='_ProductPack��ProductID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='ProductPack��ProductID']").val(formatted);
                }
            });

            $("input[name='_ProductPack��ProductID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='ProductPack��ProductID']").val("");
                }
            });

        });
    </script>

</div>
<%
    for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
    {
%>
<div id="regioncontent">
    <table class="dynamictable">
        <tbody>
            <%
                if (Model == null)
                {
                    Response.Write(Html.Hidden("ProductPack��ID"));
                }
                else
                {
                    Response.Write(Html.Hidden("ProductPack��ID", Model[i].ID.ToString()));
                }
            %>
            <tr>
                <td align="center" valign="middle" rowspan="1" style="width: 10%;">
                    ������Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    ��Ʒ��ţ�
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.Hidden("ProductPack��ProductID", "", new { copyvalue = true }));
                            Response.Write(Html.TextBox("_ProductPack��ProductID"));
                            Response.Write("<a href='#'onclick=LoadControlList(this,'ProductIndex')>ѡ��</a>");
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                if (Model[i].ProductID != null)
                                {
                                    var obj = LZL.ForeignTrade.Controllers.DataHelper.GetProduct(Model[i].ProductID);
                                    if (obj != null)
                                    {
                                        Response.Write(Html.Hidden("ProductPack��ProductID", Html.Encode(Model[i].ProductID), new { copyvalue = true }));
                                        Response.Write(Html.TextBox("_ProductPack��ProductID", Html.Encode(obj.NameCode))); ;
                                    }
                                    else
                                    {
                                        Response.Write(Html.Hidden("ProductPack��ProductID", "", new { copyvalue = true }));
                                        Response.Write(Html.TextBox("_ProductPack��ProductID"));

                                    }
                                }
                                else
                                {
                                    Response.Write(Html.Hidden("ProductPack��ProductID", "", new { copyvalue = true }));
                                    Response.Write(Html.TextBox("_ProductPack��ProductID"));
                                }
                                Response.Write("<a href='#'onclick=LoadControlList(this,'ProductIndex')>ѡ��</a>");
                            }
                            else
                            {
                                if (Model[i].ProductID != null)
                                {
                                    var obj = LZL.ForeignTrade.Controllers.DataHelper.GetProduct(Model[i].ProductID);
                                    if (obj != null)
                                    {
                                        Response.Write(Html.ActionLink(obj.NameCode, "Details", "Product", new { id = obj.ID.ToString() }, null));
                                    }
                                }
                            }
                        }
        
                    %>
                </td>
            </tr>
            <tr>
                <td align="center" valign="middle" rowspan="10" style="width: 10%;">
                    ��װ��Ϣ
                </td>
                <td align="right" style="width: 15%;">
                    ��Ʒ������
                </td>
                <td align="left" style="width: 30%;">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��ProductAmount", "", new { validate = "digits:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��ProductAmount", Html.Encode(Model[i].ProductAmount), new { validate = "digits:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ProductAmount));
                            }
                        }
                    %>
                </td>
                <td align="right" style="width: 15%;">
                    ��������װ����Ʒ������
                </td>
                <td align="left" style="width: 30%;">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleProductAmount", "", new { validate = "digits:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleProductAmount", Html.Encode(Model[i].SingleProductAmount), new { validate = "digits:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleProductAmount));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ������
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PieceAmount", "", new { validate = "digits:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PieceAmount", Html.Encode(Model[i].PieceAmount), new { validate = "digits:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PieceAmount));
                            }
                        }
                    %>
                </td>
                <%--<td align="right">
                    ��װ��λ(����)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductPack��PackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ"), "��ѡ��"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductPack��PackUnitCH", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ", Html.Encode(Model[i].PackUnitCH)), "��ѡ��"));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].PackUnitCH)));
                            }
                        }
                    %>
                </td>--%>
            </tr>
            <tr>
                <td align="right">
                    ��װ��λ��Ӣ�ģ���
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductPack��PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductPack��PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model[i].PackUnitEN)), "��ѡ��"));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].PackUnitEN)));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    ��װ����(CM)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackLength", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackLength", Html.Encode(Model[i].PackLength), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackLength));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��װ��ȣ�CM����
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackWidth", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackWidth", Html.Encode(Model[i].PackWidth), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackWidth));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    ��װ�߶�(CM)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackHeight", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackHeight", Html.Encode(Model[i].PackHeight), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackHeight));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    (����)��װ���(CBM)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SinglePackBulk", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SinglePackBulk", Html.Encode(Model[i].SinglePackBulk), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SinglePackBulk));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    ��װ�����(CBM)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackBulk", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackBulk", Html.Encode(Model[i].PackBulk), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackBulk));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ں���Ʒ������
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��InsideProductAmount", "", new { validate = "digits:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��InsideProductAmount", Html.Encode(Model[i].InsideProductAmount), new { validate = "digits:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].InsideProductAmount));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    (����װ)�ںм�����
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleInsidePiece", "", new { validate = "digits:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleInsidePiece", Html.Encode(Model[i].SingleInsidePiece), new { validate = "digits:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleInsidePiece));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
               <%-- <td align="right">
                    �ںе�λ(����)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductPack��InsideUnitCN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ"), "��ѡ��"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductPack��InsideUnitCN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ĵ�λ", Html.Encode(Model[i].InsideUnitCN)), "��ѡ��"));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].InsideUnitCN)));
                            }
                        }
                    %>
                </td>--%>
                <td align="right">
                    �ںе�λ(Ӣ��)��
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductPack��InsideUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��"));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductPack��InsideUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model[i].InsideUnitEN)), "��ѡ��"));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].InsideUnitEN)));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    (����)��װë��(KG)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleGrossWeight", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleGrossWeight", Html.Encode(Model[i].SingleGrossWeight), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleGrossWeight));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    (����)��װ����(KG)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleNetWeight", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleNetWeight", Html.Encode(Model[i].SingleNetWeight), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleNetWeight));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    �ܰ�װë��(KG)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��GrossWeight", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��GrossWeight", Html.Encode(Model[i].GrossWeight), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].GrossWeight));
                            }
                        }
                    %>
                </td>
                <td align="right">
                    �ܰ�װ����(KG)��
                </td>
                <td align="left">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��NetWeight", "", new { validate = "number:true" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��NetWeight", Html.Encode(Model[i].NetWeight), new { validate = "number:true" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].NetWeight));
                            }
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    ��ע��
                </td>
                <td align="left" colspan="3">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductPack��Note", new { style = "width: 99%; height: 50px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductPack��Note", Html.Encode(Model[i].Note), new { style = "width: 99%; height: 80px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].Note));
                            }
                        }
                    %>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <%
                if (ViewData["Details"] == null)
                {
            %>
            <tr>
                <td colspan="5" align="right">
                    <input type="button" class="button" value="�� ��" onclick="addregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="ɾ ��" onclick="deleteregion(this);" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="�� ��" onclick="toggle(this)" />
                </td>
            </tr>
            <%
                }
            %>
        </tfoot>
    </table>
</div>
<%  
    }
%>