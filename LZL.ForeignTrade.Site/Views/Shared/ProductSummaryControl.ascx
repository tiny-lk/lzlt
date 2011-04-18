<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<LZL.ForeignTrade.DataEntity.ProductSummary>>" %>
<div class="contentpanle">
    <div id="divProductSummaryRegion">
        <!-- 标识子表添加总数 -->
        <input type="hidden" value='<%= int.Parse(ViewData["number"].ToString())%>' name="ProductSummary♂regioncount"
            id="ProductSummary♂regioncount" />
        <!-- 标识子表区域名称(表格名称、实体对象名称) -->
        <input type="hidden" name="ProductSummaryRegion" id="ProductSummaryRegion" value="ProductSummary♂" />
        <!-- 标识子表实体对象类 -->
        <input type="hidden" name="ProductSummary♂objectname" value="LZL.ForeignTrade.DataEntity.ProductSummary,LZL.ForeignTrade.DataEntity" />
        <!-- 标识子表外键实体对象名称、外键字段名称 -->
        <input type="hidden" name="ProductSummary♂fk" value='<%= ViewData["FK"] == null || string.IsNullOrEmpty(ViewData["FK"].ToString()) ? "Invoice" :ViewData["FK"] %>' />
        <%= Html.Hidden("ProductSummary♂iscreatedate", "CreateDate")%>
        <%= Html.Hidden("ProductSummary♂iseditdate", "EditDate")%>
        <link href="<%= Url.Content("~/Content/blue/blue.css")%>" type="text/css" rel="stylesheet">

        <script src="<%= Url.Content("~/Scripts/jquery.tablesorter.js")%>" type="text/javascript"></script>

        <script src="<%= Url.Content("~/Scripts/jquery.tableEditor.js")%>" type="text/javascript"></script>

        <script src="<%= Url.Content("~/Scripts/common.js")%>" type="text/javascript"></script>

        <script type="text/javascript">
            $().ready(function() {
                $("#editableTable").tableSorter().tableEditor({
                    EDIT_HTML: '编辑',
                    SAVE_HTML: '',
                    COL_APPLYCLASS: true,
                    COLUMN_NOEDIT: 'edit'
                });

                RelationControls();
            });

            function addRow(regionname) {
                var obj = $(regionname).closest("table").siblings("div[id='divProductSummaryRegion']");

                //var regionvalue = $(obj).find("input[name='ProductSummaryRegion']").val();
                var regionvalue = $('#ProductSummaryRegion').val();

                if (regionvalue != null) {
                    //var regioncountobj = $(obj).find("#" + regionvalue + "regioncount");
                    var regioncountobj = $("#" + regionvalue + "regioncount");
                    $(regioncountobj).val(Number($(regioncountobj).val()) + 1);
                }
                var copyobj = $($("#editableTable tr")[$("#editableTable tr").length - 1])
                var copyhtml = $(copyobj).clone(true);

                $.each($(copyhtml).find("input[type='hidden']"), function(i, o) {
                    var copyvalue = $(o).attr("copyvalue");
                    if (copyvalue == null || copyvalue == "" || typeof (copyvalue) == "undefined") {
                        $(o).val("");
                    }
                });

                //需要删掉，否则会导致新增一行的事件有问题
                //$(copyhtml).find("input[type='text']").removeAttr("id");
                $(copyhtml).find('.' + $.datepicker.markerClassName).removeClass($.datepicker.markerClassName)
                $(copyobj).parent().append(copyhtml);

                initData();
            }
            function removeRow(regionname) {
                var obj = $(regionname).closest("table").siblings("div[id='divProductSummaryRegion']");
                //var regionvalue = $(obj).find("input[name='ProductSummaryRegion']").val();
                var regionvalue = $('#ProductSummaryRegion').val();
                if (regionvalue != null) {
                    //var regioncountobj = $(obj).find("#" + regionvalue + "regioncount");
                    var regioncountobj = $("#" + regionvalue + "regioncount");
                    $(regioncountobj).val(Number($(regioncountobj).val()) - 1);
                }
                var objTemp = $(regionname);
                $(objTemp.parent().parent()).remove();
            }

            //关联控件间关系
            function RelationControls() {
                $("#ProductSummary♂PieceAmount").attr("title", "双击自动获取运算值");
                $("#ProductSummary♂SinglePackBulk").attr("title", "双击自动获取运算值");
                $("#ProductSummary♂PackBulk").attr("title", "双击自动获取运算值");
                $("#ProductSummary♂GrossWeight").attr("title", "双击自动获取运算值");
                $("#ProductSummary♂NetWeight").attr("title", "双击自动获取运算值");
                $("#ProductSummary♂CustomsCode").attr("title", "双击自动获取该商品信息");
                $("#ProductSummary♂PurchaseTotalPrice").attr("title", "双击自动获取运算值");
                $("#ProductSummary♂ExportAmount").attr("title", "双击自动获取运算值");

                $("#ProductSummary♂PieceAmount").live("dblclick", function(thisObj) {
                    
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");                   
                    if (thistr.find("#ProductSummary♂SingleProductAmount").val() != "") {
                        var tj = Number(thistr.find("#ProductSummary♂ProductAmount").val()) / Number(thistr.find("#ProductSummary♂SingleProductAmount").val());
                        if (tj != 0) {
                            thistr.find("#ProductSummary♂PieceAmount").val(tj.toFixed(0));
                        }
                    }
                });   //包装件数

                $("#ProductSummary♂SinglePackBulk").live("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");

                    var tj = Number(thistr.find("#ProductSummary♂PackLength").val()) * Number(thistr.find("#ProductSummary♂PackWidth").val()) * Number(thistr.find("#ProductSummary♂PackHeight").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂SinglePackBulk").val(tj.toFixed(2) / 1000000);
                    }
                }); //(单件)包装体积(CBM)

                $("#ProductSummary♂PackBulk").live("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductSummary♂SinglePackBulk").val()) * Number(thistr.find("#ProductSummary♂PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂PackBulk").val(tj.toFixed(2));
                    }
                }); //总包装体积

                $("#ProductSummary♂GrossWeight").live("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductSummary♂SingleGrossWeight").val()) * Number(thistr.find("#ProductSummary♂PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂GrossWeight").val(tj.toFixed(2));
                    }
                }); // 总包装毛重

                $("#ProductSummary♂NetWeight").live("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductSummary♂SingleNetWeight").val()) * Number(thistr.find("#ProductSummary♂PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂NetWeight").val(tj.toFixed(2));
                    }
                });  //总包装净重

                $("#ProductSummary♂PurchaseTotalPrice").live("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductSummary♂PurchasePrice").val()) * Number(thistr.find("#ProductSummary♂ProductAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂PurchaseTotalPrice").val(tj.toFixed(2));
                    }
                });  //进销总金额

                $("#ProductSummary♂ExportAmount").live("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    var tj = Number(thistr.find("#ProductSummary♂ExportPrice").val()) * Number(thistr.find("#ProductSummary♂ProductAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂ExportAmount").val(tj.toFixed(2));
                    }
                });  //外销总金额

                $("#ProductSummary♂CustomsCode").live("dblclick", function(thisObj) {
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    SetInitValueWithSelect(thistr);
                });   //点击商品数量获取关联信息

                //输入产品数量的同时自动计算如下数据
                $("#ProductSummary♂ProductAmount").live("keyup", function(thisObj) {
                    //包装件数
                    var thistr = $($(thisObj)[0].srcElement).closest("tr");
                    if (thistr.find("#ProductSummary♂SingleProductAmount").val() != "") {
                        var tj = Number(thistr.find("#ProductSummary♂ProductAmount").val()) / Number(thistr.find("#ProductSummary♂SingleProductAmount").val());
                        if (tj != 0) {
                            thistr.find("#ProductSummary♂PieceAmount").val(tj.toFixed(0));
                        }
                    }

                    //(单件)包装体积(CBM)
                    var tj = Number(thistr.find("#ProductSummary♂PackLength").val()) * Number(thistr.find("#ProductSummary♂PackWidth").val()) * Number(thistr.find("#ProductSummary♂PackHeight").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂SinglePackBulk").val(tj.toFixed(2) / 1000000);
                    }

                    //总包装体积
                    tj = Number(thistr.find("#ProductSummary♂SinglePackBulk").val()) * Number(thistr.find("#ProductSummary♂PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂PackBulk").val(tj.toFixed(2));
                    }

                    // 总包装毛重
                    tj = Number(thistr.find("#ProductSummary♂SingleGrossWeight").val()) * Number(thistr.find("#ProductSummary♂PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂GrossWeight").val(tj.toFixed(2));
                    }

                    //总包装净重
                    tj = Number(thistr.find("#ProductSummary♂SingleNetWeight").val()) * Number(thistr.find("#ProductSummary♂PieceAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂NetWeight").val(tj.toFixed(2));
                    }

                    //进销总金额
                    tj = Number(thistr.find("#ProductSummary♂PurchasePrice").val()) * Number(thistr.find("#ProductSummary♂ProductAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂PurchaseTotalPrice").val(tj.toFixed(2));
                    }

                    //外销总金额
                    tj = Number(thistr.find("#ProductSummary♂ExportPrice").val()) * Number(thistr.find("#ProductSummary♂ProductAmount").val());
                    if (tj != 0) {
                        thistr.find("#ProductSummary♂ExportAmount").val(tj.toFixed(2));
                    }

                });
            }

            //通过选择商品获取商品相关信息
            function SetInitValueWithSelect(thistr) {

                var varid = thistr.find("#ProductSummary♂propertyobjectvalue").val();

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
                              rowItems[1] = rowItems[1].replace("\"", "").replace("\"", "");

                              if (rowItems[0] == "CustomsCode") {
                                  thistr.find("input[name = 'ProductSummary♂CustomsCode']").val(rowItems[1]);
                              }
                              else if (rowItems[0] == "PackUnitEN") {
                                  thistr.find("select[name = 'ProductSummary♂UnitEN']").val(rowItems[1]);
                              } else if (rowItems[0] == "NameEH") {
                                  thistr.find("textarea[name = 'ProductSummary♂DescriptionEN']").val(rowItems[1]);
                              } else if (rowItems[0] == "PackAmount") {
                                  //thistr.find("#ProductSummary♂SingleProductAmount").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂SingleProductAmount']").val(rowItems[1]);
                              } else if (rowItems[0] == "PackLength") {
                                  thistr.find("input[name = 'ProductSummary♂PackLength']").val(rowItems[1]);
                                  // thistr.find("#ProductSummary♂PackLength").val(rowItems[1]);
                              } else if (rowItems[0] == "PackWidth") {
                                  //thistr.find("#ProductSummary♂PackWidth").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂PackWidth']").val(rowItems[1]);
                              } else if (rowItems[0] == "PackHeight") {
                                  //thistr.find("#ProductSummary♂PackHeight").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂PackHeight']").val(rowItems[1]);
                              } else if (rowItems[0] == "PackBulk") {
                                  //thistr.find("#ProductSummary♂SinglePackBulk").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂SinglePackBulk']").val(rowItems[1]);
                              } else if (rowItems[0] == "PackGrossWeight") {
                                  //thistr.find("#ProductSummary♂SingleGrossWeight").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂SingleGrossWeight']").val(rowItems[1]);
                              } else if (rowItems[0] == "PackNetWeight") {
                                  //thistr.find("#ProductSummary♂SingleNetWeight").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂SingleNetWeight']").val(rowItems[1]);
                              } else if (rowItems[0] == "BoxAmount") {
                                  //thistr.find("#ProductSummary♂InsideProductAmount").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂InsideProductAmount']").val(rowItems[1]);
                              } else if (rowItems[0] == "BoxUnitEN") {
                                  //thistr.find("#ProductSummary♂InsideUnitEN").val(rowItems[1]);
                                  thistr.find("input[name = 'ProductSummary♂InsideUnitEN']").val(rowItems[1]);
                              }
                          }
                      };
                  });
            }
            
        </script>

    </div>
    <table id="editableTable" class="dynamictable" cellspacing="0" cellpadding="0" border="0"
        width="100%" style="margin-left: 0px; padding-left: 0px;">
        <thead class="header">
            <tr style="cursor: pointer; background-color: Silver;" title="点击列进行排序">
                <%if (ViewData["Details"] == null)
                  {%>
                <th>
                    &nbsp;操&nbsp;作&nbsp;
                </th>
                <%} %>
                <th>
                    商品款号
                </th>
                <th>
                    商品编码<br />
                    (HS编码)
                </th>
                <th>
                    商品描述<br />
                    (英文)
                </th>
                <th>
                    商品<br />
                    数量
                </th>
                <th>
                    商品单位
                </th>
                <th>
                    商品外<br />
                    销单价
                </th>
                <th>
                    商品外销<br />
                    总金额
                </th>
                <th>
                    商品进货<br />
                    单价
                </th>
                <th>
                    商品进货<br />
                    总金额
                </th>
                <th>
                    单件商品数量
                </th>
                <th>
                    包装<br />
                    箱数
                </th>
                <th>
                    包装单位
                </th>
                <th>
                    包装长度(CM)
                </th>
                <th>
                    包装宽度(CM)
                </th>
                <th>
                    包装高度(CM)
                </th>
                <th>
                    (单件)包装<br />
                    体积(CBM)
                </th>
                <th>
                    包装总体积<br />
                    (CBM)
                </th>
                <th>
                    (单件)包装<br />
                    毛重(KG)
                </th>
                <th>
                    (单件)包装<br />
                    净重(KG)
                </th>
                <th>
                    总包装毛重<br />
                    (KG)
                </th>
                <th>
                    总包装净重<br />
                    (KG)
                </th>
                <th>
                    备注
                </th>
            </tr>
        </thead>
        <tbody id="tbdMain">
            <% 
                for (int i = 0; i < int.Parse(ViewData["number"].ToString()); i++)
                {                   
            %>
            <tr>
                <% if (Model == null)
                   {
                       Response.Write(Html.Hidden("ProductSummary♂ID"));
                   }
                   else
                   {
                       Response.Write(Html.Hidden("ProductSummary♂ID", Model[i].ID.ToString()));
                   }
                   Response.Write(Html.Hidden("ProductSummary♂propertyobject", "Product", new { copyvalue = true }));

                   if (ViewData["Details"] == null)
                   {%>
                <td align="center" width="4%">
                    <key></key>
                    <a class="tsEditLink" href="#">编辑</a><br />
                    <a href="#" onclick="removeRow(this)">删除</a>
                </td>
                <%} %>
                <td width="10%">
                    <%                   
               
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("_ProductSummary♂ProductID", "", new { style = "width:120px;height:30px;" }));
                            Response.Write(Html.Hidden("ProductSummary♂propertyobjectvalue", "", new { copyvalue = true }));
                            Response.Write("<br/><a href='#'onclick=LoadControlList(this,'ProductIndex','ProductSummary♂CustomsCode')>选择</a>");
                        }
                        else
                        {
                            Model[i].ProductReference.Load();
                            if (ViewData["Details"] == null)
                            {
                                if (Model[i].Product != null)
                                {
                                    Response.Write(Html.TextBox("_ProductSummary♂ProductID", Model[i].Product.NameCode, new { style = "width:120px;height:30px;" }));
                                    Response.Write(Html.Hidden("ProductSummary♂propertyobjectvalue", Model[i].Product.ID, new { copyvalue = true }));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_ProductSummary♂ProductID", "", new { style = "width:120px;height:30px;" }));
                                    Response.Write(Html.Hidden("ProductSummary♂propertyobjectvalue", "", new { copyvalue = true }));
                                }
                                Response.Write("<br/><a href='#'onclick=LoadControlList(this,'ProductIndex','ProductSummary♂CustomsCode')>选择</a>");
                            }
                            else
                            {
                                if (Model[i].Product != null)
                                {
                                    Response.Write(Html.Encode(Model[i].Product.NameCode));
                                }
                            }
                        }
                    %>
                </td>
                <td width="8%">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂CustomsCode", "", new { style = "width:80px;height:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂CustomsCode", Html.Encode(Model[i].CustomsCode), new { style = "width:80px;height:40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].CustomsCode));
                            }
                        }
                    %>
                </td>
                <td width="10%">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary♂DescriptionEN", new { style = "width: 95px; height: 40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductSummary♂DescriptionEN", Html.Encode(Model[i].DescriptionEN), new { style = "width: 95px; height: 40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].DescriptionEN));
                            }
                        }
                    %>
                </td>
                <td width="10%">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂ProductAmount", "", new { validate = "digits:true", style = "width:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂ProductAmount", Html.Encode(Model[i].ProductAmount), new { validate = "digits:true", style = "width:40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ProductAmount));
                            }
                        }
                    %>
                </td>
                <td width="8%">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.DropDownList("ProductSummary♂UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位"), "请选择", new { style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductSummary♂UnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model[i].UnitEN)), "请选择", new { style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(LZL.ForeignTrade.Controllers.DataHelper.GetDictionaryName(Html.Encode(Model[i].UnitEN)));
                            }
                        }
                    %>
                </td>
                <td width="10%">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂ExportPrice", "", new { validate = "number:true", style = "width:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂ExportPrice", Html.Encode(Model[i].ExportPrice), new { validate = "number:true", style = "width:40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ExportPrice));
                            }
                        }
                    %>
                </td>
                <td width="10%"  style="background-color: Silver">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂ExportAmount", "", new { validate = "number:true", style = "width:70px;height:30px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂ExportAmount", Html.Encode(Model[i].ExportAmount), new { validate = "number:true", style = "width:70px;height:30px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].ExportAmount));
                            }
                        }
                    %>
                </td>
                <td width="10%">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂PurchasePrice", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂PurchasePrice", Html.Encode(Model[i].PurchasePrice), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PurchasePrice));
                            }
                        }
                    %>
                </td>
                <td width="10%" style="background-color: Silver">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂PurchaseTotalPrice", "", new { validate = "number:true", style = "width:70px;height:30px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂PurchaseTotalPrice", Html.Encode(Model[i].PurchaseTotalPrice), new { validate = "number:true", style = "width:70px;height:30px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PurchasePrice));
                            }
                        }
                    %>
                </td>
                <td>
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂SingleProductAmount", "", new { validate = "digits:true", style = "width:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂SingleProductAmount", Html.Encode(Model[i].SingleProductAmount), new { validate = "digits:true", style = "width:40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleProductAmount));
                            }
                        }
                    %>
                </td>
                <td style="background-color: Silver">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂PieceAmount", "", new { validate = "digits:true", style = "width:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂PieceAmount", Html.Encode(Model[i].PieceAmount), new { validate = "digits:true", style = "width:40px;" }));
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
                            Response.Write(Html.DropDownList("ProductSummary♂PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位"), "请选择", new { style = "width: 50px; " }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.DropDownList("ProductSummary♂PackUnitEN", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("英文单位", Html.Encode(Model[i].PackUnitEN)), "请选择", new { style = "width: 50px; " }));
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
                            Response.Write(Html.TextBox("ProductSummary♂PackLength", "", new { validate = "number:true", style = "width:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂PackLength", Html.Encode(Model[i].PackLength), new { validate = "number:true", style = "width:40px;" }));
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
                            Response.Write(Html.TextBox("ProductSummary♂PackWidth", "", new { validate = "number:true", style = "width:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂PackWidth", Html.Encode(Model[i].PackWidth), new { validate = "number:true", style = "width:40px;" }));
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
                            Response.Write(Html.TextBox("ProductSummary♂PackHeight", "", new { validate = "number:true", style = "width:40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂PackHeight", Html.Encode(Model[i].PackHeight), new { validate = "number:true", style = "width:40px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].PackHeight));
                            }
                        }
                    %>
                </td>
                <td style="background-color: Silver">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂SinglePackBulk", "", new { validate = "number:true", style = "width:80px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂SinglePackBulk", Html.Encode(Model[i].SinglePackBulk), new { validate = "number:true", style = "width:80px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SinglePackBulk));
                            }
                        }
                    %>
                </td>
                <td style="background-color: Silver">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂PackBulk", "", new { validate = "number:true", style = "width:80px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂PackBulk", Html.Encode(Model[i].PackBulk), new { validate = "number:true", style = "width:80px;" }));
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
                            Response.Write(Html.TextBox("ProductSummary♂SingleGrossWeight", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂SingleGrossWeight", Html.Encode(Model[i].SingleGrossWeight), new { validate = "number:true", style = "width:60px;" }));
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
                            Response.Write(Html.TextBox("ProductSummary♂SingleNetWeight", "", new { validate = "number:true", style = "width:60px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂SingleNetWeight", Html.Encode(Model[i].SingleNetWeight), new { validate = "number:true", style = "width:60px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].SingleNetWeight));
                            }
                        }
                    %>
                </td>
                <td style="background-color: Silver">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂GrossWeight", "", new { validate = "number:true", style = "width:80px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂GrossWeight", Html.Encode(Model[i].GrossWeight), new { validate = "number:true", style = "width:80px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].GrossWeight));
                            }
                        }
                    %>
                </td>
                <td style="background-color: Silver">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextBox("ProductSummary♂NetWeight", "", new { validate = "number:true", style = "width:80px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextBox("ProductSummary♂NetWeight", Html.Encode(Model[i].NetWeight), new { validate = "number:true", style = "width:80px;" }));
                            }
                            else
                            {
                                Response.Write(Html.Encode(Model[i].NetWeight));
                            }
                        }
                    %>
                </td>
                <td width="10%">
                    <%
                        if (Model == null)
                        {
                            Response.Write(Html.TextArea("ProductSummary♂Note", new { style = "width: 80px; height: 40px;" }));
                        }
                        else
                        {
                            if (ViewData["Details"] == null)
                            {
                                Response.Write(Html.TextArea("ProductSummary♂Note", Html.Encode(Model[i].Note), new { style = "width: 80px; height: 40px;" }));
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
        <input type="button" id="btnInsert" value="添加行" onclick="addRow(this)" class="button" />
    </div>
    <%
        }
    %>

    <script type="text/javascript">
        function setreadonly() {
            $("#editableTable").find('input, select,textarea').attr("readonly", "true");
            $("#editableTable").addClass("dynamictablereadonly");
        }
        setreadonly();
    </script>

</div>
