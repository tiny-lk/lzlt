<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ProductPack>>" %>
<div class="contentpanle">
    <div id="divProductPackRegion">
        <!-- ��ʶ�ӱ�������� -->
        <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="ProductPack��regioncount"
            id="ProductPack��regioncount" />
        <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
        <input type="hidden" name="ProductPackRegion" id="ProductPackRegion" value="ProductPack��" />
        <!-- ��ʶ�ӱ�ʵ������� -->
        <input type="hidden" name="ProductPack��objectname" value="LZL.ForeignTrade.DataEntity.ProductPack,LZL.ForeignTrade.DataEntity" />
        <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
        <input type="hidden" name="ProductPack��fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "ExportContracts" :ViewData["FK"] %>' />
        <%= Html.Hidden("ProductPack��iscreatedate", "CreateDate")%>
        <%= Html.Hidden("ProductPack��iseditdate", "EditDate")%>
        <link href="<%= Url.Content("~/Content/blue/blue.css")%>" type="text/css" rel="stylesheet">

        <script src="<%= Url.Content("~/Scripts/jquery.tablesorter.js")%>" type="text/javascript"></script>

        <script src="<%= Url.Content("~/Scripts/jquery.tableEditor.js")%>" type="text/javascript"></script>

        <script src="<%= Url.Content("~/Scripts/common.js")%>" type="text/javascript"></script>

        <script type="text/javascript">

            function addRow2(regionname) {
                var obj = $(regionname).closest("table").siblings("div[id='divProductPackRegion']");
                //var regionvalue = $(obj).find("input[name='ProductPackRegion']").val();
                var regionvalue = $("#ProductPackRegion").val();
                
                if (regionvalue != null) {
                    //var regioncountobj = $(obj).find("#" + regionvalue + "regioncount");
                    var regioncountobj = $("#" + regionvalue + "regioncount");
                    $(regioncountobj).val(Number($(regioncountobj).val()) + 1);
                }
                var copyobj = $($("#editableTable2 tr")[$("#editableTable2 tr").length - 1])
                var copyhtml = $(copyobj).clone(true);
                $.each($(copyhtml).find("input[type='hidden']"), function(i, o) {
                    var copyvalue = $(o).attr("copyvalue");
                    if (copyvalue == null || copyvalue == "") {
                        $(o).val("");
                    }
                });
                //  $(copyhtml).find("input[type='text']").removeAttr("id");
                $(copyhtml).find('.' + $.datepicker.markerClassName).removeClass($.datepicker.markerClassName)
                $(copyobj).parent().append(copyhtml);
                init();
            }
            function removeRow2(regionname) {
                var obj = $(regionname).closest("table").siblings("div[id='divProductPackRegion']");
                //var regionvalue = $(obj).find("input[name='ProductPackRegion']").val();
                var regionvalue = $("#ProductPackRegion").val();
                
                if (regionvalue != null) {
                    //var regioncountobj = $(obj).find("#" + regionvalue + "regioncount");
                    var regioncountobj = $("#" + regionvalue + "regioncount");
                    $(regioncountobj).val(Number($(regioncountobj).val()) - 1);
                }
                var objTemp = $(regionname);
                $(objTemp.parent().parent()).remove();
            }

            function toggle(obj) {
                if ($(obj).val() == "�� ��") {
                    $(obj).val("չ ��");
                } else {
                    $(obj).val("�� ��");
                }
                $(obj).closest("table").find("tbody").toggle("slow");
            }

            //�����ؼ����ϵ
            function RelationControls() {
                $("#ProductPack��PieceAmount").attr("title", "˫���Զ���ȡ����ֵ");
                //$("#ProductPack��PieceAmount").attr("border-color", "red");
                $("#ProductPack��SinglePackBulk").attr("title", "˫���Զ���ȡ����ֵ");
                //$("#ProductPack��SinglePackBulk").attr("border-color", "Silver");
                $("#ProductPack��PackBulk").attr("title", "˫���Զ���ȡ����ֵ");
                //$("#ProductPack��PackBulk").attr("border-color", "Silver");
                $("#ProductPack��GrossWeight").attr("title", "˫���Զ���ȡ����ֵ");
                //$("#ProductPack��GrossWeight").attr("border-color", "Silver");
                $("#ProductPack��NetWeight").attr("title", "˫���Զ���ȡ����ֵ");
                //$("#ProductPack��NetWeight").attr("border-color", "Silver");

                $("#ProductPack��PieceAmount").bind("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    if (thistr.find("#ProductPack��SingleProductAmount").val() != "") {
                        var tj = Number(thistr.find("#ProductPack��ProductAmount").val()) / Number(thistr.find("#ProductPack��SingleProductAmount").val());
                        if (tj != 0) {
                            thistr.find("#ProductPack��PieceAmount").val(tj.toFixed(2));
                        }
                    }
                }); //��װ����

                $("#ProductPack��SinglePackBulk").bind("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");

                    var tj = Number(thistr.find("#ProductPack��PackLength").val()) * Number(thistr.find("#ProductPack��PackWidth").val()) * Number(thistr.find("#ProductPack��PackHeight").val());
                    if (tj != 0) {
                        thistr.find("#ProductPack��SinglePackBulk").val(tj.toFixed(2) / 1000000);
                    }
                }); //(����)��װ���(CBM)

                $("#ProductPack��PackBulk").bind("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductPack��SinglePackBulk").val()) * Number(thistr.find("#ProductPack��PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductPack��PackBulk").val(tj.toFixed(2));
                    }
                }); //�ܰ�װ���

                $("#ProductPack��GrossWeight").bind("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductPack��SingleGrossWeight").val()) * Number(thistr.find("#ProductPack��PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductPack��GrossWeight").val(tj.toFixed(2));
                    }
                }); // �ܰ�װë��

                $("#ProductPack��NetWeight").bind("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductPack��SingleNetWeight").val()) * Number(thistr.find("#ProductPack��PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductPack��NetWeight").val(tj.toFixed(2));
                    }
                }); //�ܰ�װ����

                $("#ProductPack��ProductAmount").bind("click", function(thisObj) {
                    SetInitValueWithSelect();
                }); //�����Ʒ������ȡ������Ϣ
            }

            //ͨ��ѡ����Ʒ��ȡ��Ʒ�����Ϣ
            function SetInitValueWithSelect() {
                var varid = $("input[name='ProductPack��ProductID']").val();
                $.get(
                '<%=Url.Action("GetProductInfo","Shared")%>',
                 { t: varid },
                  function(data) {
                      data = data.replace("{", "").replace("}", "");
                      var rows = data.split(',');
                      for (var i = 0; i < rows.length; i++) {
                          var rowItems = rows[i].split(':');
                          if (rowItems[1] != "null") {
                              rowItems[0] = rowItems[0].replace("\"", "").replace("\"", "");

                              //$("#ProductPack��" + rowItems[0]).val(rowItems[1]);
                              if (rowItems[0] == "PackUnitEN") {
                                  if ($("#ProductPack��PackUnitEN").val() == "") {
                                      $("#ProductPack��PackUnitEN").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "PackAmount") {
                                  if ($("#ProductPack��SingleProductAmount").val() == "") {
                                      $("#ProductPack��SingleProductAmount").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "PackLength") {
                                  if ($("#ProductPack��PackLength").val() == "") {
                                      $("#ProductPack��PackLength").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "PackWidth") {
                                  if ($("#ProductPack��PackWidth").val() == "") {
                                      $("#ProductPack��PackWidth").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "PackHeight") {
                                  if ($("#ProductPack��PackHeight").val() == "") {
                                      $("#ProductPack��PackHeight").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "PackBulk") {
                                  if ($("#ProductPack��SinglePackBulk").val() == "") {
                                      $("#ProductPack��SinglePackBulk").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "PackGrossWeight") {
                                  if ($("#ProductPack��SingleGrossWeight").val() == "") {
                                      $("#ProductPack��SingleGrossWeight").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "PackNetWeight") {
                                  if ($("#ProductPack��SingleNetWeight").val() == "") {
                                      $("#ProductPack��SingleNetWeight").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "BoxAmount") {
                                  if ($("#ProductPack��InsideProductAmount").val() == "") {
                                      $("#ProductPack��InsideProductAmount").val(rowItems[1]);
                                  }
                              } else if (rowItems[0] == "BoxUnitEN") {
                                  if ($("#ProductPack��InsideUnitEN").val() == "") {
                                      $("#ProductPack��InsideUnitEN").val(rowItems[1]);
                                  }
                              }
                          }
                      };
                  });
            }

            //ҳ�����
            $(document).ready(function() {

                $("#editableTable2").tableSorter().tableEditor({
                    EDIT_HTML: '�༭',
                    SAVE_HTML: '',
                    COL_APPLYCLASS: true,
                    COLUMN_NOEDIT: 'edit'
                });
                $('#ProductPack��').css("display", "");
                RelationControls();

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
    <table id="editableTable2" class="dynamictable" cellspacing="0" cellpadding="0" border="0"
        width="100%" style="margin-left: 0px; padding-left: 0px;">
        <thead class="header">
            <tr>
                <th>
                    <br />
                    ����<input style="width: 60px;" />
                </th>
                <th>
                    ��Ʒ���
                </th>
                <th>
                    ��Ʒ����
                </th>
                <th>
                    ��Ʒ����(������װ)
                </th>
                <th>
                    ��װ����
                </th>
                <th>
                    ��װ��λ(Ӣ��)
                </th>
                <th>
                    ��װ����(CM)
                </th>
                <th>
                    ��װ���(CM)
                </th>
                <th>
                    ��װ�߶�(CM)
                </th>
                <th>
                    (����)��װ���(CBM)
                </th>
                <th>
                    ��װ�����(CBM)
                </th>
                <th>
                    �ں���Ʒ����
                </th>
                <th>
                    �ںм���(����װ)
                </th>
                <th>
                    �ںе�λ(Ӣ��)
                </th>
                <th>
                    (����)��װë��(KG)
                </th>
                <th>
                    (����)��װ����(KG)
                </th>
                <th>
                    �ܰ�װë��(KG)
                </th>
                <th>
                    �ܰ�װ����(KG)
                </th>
                <th>
                    ��ע
                </th>
            </tr>
        </thead>
        <tbody id="tbdMain">
            <% 
                for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
                {
            %>
            <tr>
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
                <td align="center">
                    <key></key>
                    <a class="tsEditLink" href="#">�༭</a><br />
                    <a href="#" onclick="removeRow2(this)">ɾ��</a>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.Hidden("ProductPack��ProductID", "", new { copyvalue = true }));
                            Response.Write(Html.TextBox("_ProductPack��ProductID", "", new { style = "width:80px;" }));
                            Response.Write("<br/><a href='#'onclick=LoadControlList(this,'ProductIndex')>ѡ��</a>");
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
                                        Response.Write(Html.TextBox("_ProductPack��ProductID", Html.Encode(obj.NameCode), new { style = "width:80px;" })); ;
                                    }
                                    else
                                    {
                                        Response.Write(Html.Hidden("ProductPack��ProductID", "", new { copyvalue = true }));
                                        Response.Write(Html.TextBox("_ProductPack��ProductID", "", new { style = "width:80px;" }));

                                    }
                                }
                                else
                                {
                                    Response.Write(Html.Hidden("ProductPack��ProductID", "", new { copyvalue = true }));
                                    Response.Write(Html.TextBox("_ProductPack��ProductID", "", new { style = "width:80px;" }));
                                }
                                Response.Write("<br/><a href='#'onclick=LoadControlList(this,'ProductIndex')>ѡ��</a>");
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
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��ProductAmount", "", new { validate = "digits:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��ProductAmount", Html.Encode(Model[i].ProductAmount), new { validate = "digits:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ProductAmount));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleProductAmount", "", new { validate = "digits:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleProductAmount", Html.Encode(Model[i].SingleProductAmount), new { validate = "digits:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleProductAmount));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PieceAmount", "", new { validate = "digits:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PieceAmount", Html.Encode(Model[i].PieceAmount), new { validate = "digits:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PieceAmount));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductPack��PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��", new { style = "width: 50px; " }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductPack��PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model[i].PackUnitEN)), "��ѡ��", new { style = "width: 50px; " }));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].PackUnitEN)));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackLength", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackLength", Html.Encode(Model[i].PackLength), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackLength));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackWidth", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackWidth", Html.Encode(Model[i].PackWidth), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackWidth));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackHeight", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackHeight", Html.Encode(Model[i].PackHeight), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackHeight));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SinglePackBulk", "", new { validate = "number:true", style = "width:80px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SinglePackBulk", Html.Encode(Model[i].SinglePackBulk), new { validate = "number:true", style = "width:80px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SinglePackBulk));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��PackBulk", "", new { validate = "number:true", style = "width:80px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��PackBulk", Html.Encode(Model[i].PackBulk), new { validate = "number:true", style = "width:80px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackBulk));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��InsideProductAmount", "", new { validate = "digits:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��InsideProductAmount", Html.Encode(Model[i].InsideProductAmount), new { validate = "digits:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].InsideProductAmount));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleInsidePiece", "", new { validate = "digits:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleInsidePiece", Html.Encode(Model[i].SingleInsidePiece), new { validate = "digits:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleInsidePiece));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductPack��InsideUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ"), "��ѡ��", new { style = "width: 50px; " }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductPack��InsideUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("Ӣ�ĵ�λ", Html.Encode(Model[i].InsideUnitEN)), "��ѡ��", new { style = "width: 50px; " }));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].InsideUnitEN)));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleGrossWeight", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleGrossWeight", Html.Encode(Model[i].SingleGrossWeight), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleGrossWeight));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��SingleNetWeight", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��SingleNetWeight", Html.Encode(Model[i].SingleNetWeight), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleNetWeight));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��GrossWeight", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��GrossWeight", Html.Encode(Model[i].GrossWeight), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].GrossWeight));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductPack��NetWeight", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductPack��NetWeight", Html.Encode(Model[i].NetWeight), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].NetWeight));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductPack��Note", new { style = "width: 80px; height: 40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductPack��Note", Html.Encode(Model[i].Note), new { style = "width: 80px; height: 40px;" }));
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
                }
            %>
        </tbody>
    </table>
    <%
        if (ViewData["Details"] == null)
        {
    %>
    <div style="width: 100%" align="left">
        <input type="button" id="btnInsert" value="�����" onclick="addRow2(this)" class="button" />
    </div>
    <%
        }
    %>

    <script type="text/javascript">
        function setreadonly2() {
            $("#editableTable2").find('input, select,textarea').attr("readonly", "true");
            $("#editableTable2").addClass("dynamictablereadonly");
        }
        setreadonly2();
    </script>

</div>
