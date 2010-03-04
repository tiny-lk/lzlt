<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ExportContracts/ExportContracts.master"
    Inherits="System.Web.Mvc.ViewPage<LZL.ForeignTrade.DataEntity.ExportContracts>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �༭���ں�ͬ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/Relation_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/child_table_template.js")%>"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Scripts/AutoCompletedata.js")%>"></script>

    <script type="text/javascript">
        function openbjd(regionname, childobject, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { simple: true },
                url: '<%=Url.Action("PriceIndex","Shared")%>',
                success: function(data) {
                    addRelationcontrol(regionname, childobject, data, null, url);
                },
                error: function() {
                    alert("��ӱ�����ʧ�ܣ�");
                }
            });
        }
        function openspxx(regionname, childobject, addid, url) {
            $.ajax({
                type: "get",
                dataType: "html",
                data: { simple: true },
                url: '<%=Url.Action("ProductIndex","Shared")%>',
                success: function(data) {
                    addRelationcontrol(regionname, childobject, data, null, url);
                },
                error: function() {
                    alert("��ӱ�����ʧ�ܣ�");
                }
            });
        }
        
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='_ExportContracts��CustomerID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    selectFirst: false,
                    scrollHeight: 300,
                    dataType: 'json',
                    autoFill: false,
                    extraParams: { t: "Customer", f: "NameCode" },
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

            $("input[name='_ExportContracts��CustomerID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='ExportContracts��CustomerID']").val(formatted);
                }
            });

            $("input[name='_ExportContracts��CustomerID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='ExportContracts��CustomerID']").val("");
                }
            });

            $("input[name='_ExportContracts��CompanyID']").autocomplete('<%=Url.Action("GetAutocompleteValue2","Shared")%>',
                { max: 20,
                    highlight: false,
                    multiple: false,
                    scroll: true,
                    selectFirst: false,
                    scrollHeight: 300,
                    dataType: 'json',
                    autoFill: false,
                    extraParams: { t: "Company", f: "Name" },
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

            $("input[name='_ExportContracts��CompanyID']").result(function(event, data, formatted) {
                if (formatted != "" && formatted != null) {
                    $("input[name='ExportContracts��CompanyID']").val(formatted);
                }
            });

            $("input[name='_ExportContracts��CompanyID']").bind("blur", function() {
                if ($(this).val() == "" || $(this).val() == null) {
                    $("input[name='ExportContracts��CompanyID']").val("");
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            autocompletedictionary("ExportContracts��CurrencyType", "��������");
            autocompletedictionary("ExportContracts��PriceClause", "�۸�����");
            autocompletedictionary("ExportContracts��ClauseType", "���ʽ");
            autocompletedictionary("ExportContracts��TansportCountry", "�ۿ�");
            autocompletedictionary("ExportContracts��StartHaven", "�ۿ�");
            autocompletedictionary("ExportContracts��EdnHaven", "�ۿ�");
            autocompletedictionary("ExportContracts��TransferHaven", "�ۿ�");
            autocompletedictionary("ExportContracts��TransportMode", "���䷽ʽ");
        });
    </script>

    <% using (Html.BeginForm())
       { %>
    <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
    <input type="hidden" name="region" value="ExportContracts��" />
    <!-- ��ʶ�ӱ�ʵ������� -->
    <input type="hidden" name="ExportContracts��objectname" value="LZL.ForeignTrade.DataEntity.ExportContracts,LZL.ForeignTrade.DataEntity" />
    <%= Html.Hidden("ExportContracts��iscreatedate", "CreateDate")%>
    <%= Html.Hidden("ExportContracts��iseditdate", "EditDate")%>
    <div class="tabs" style="background: none; border: solid 1px #488dca; border-collapse: collapse;">
        <ul>
            <li><a href="#tabs-1">���ں�ͬ��Ϣ</a></li>
            <li><a href="#tabs-2">��Ʒ��Ϣ</a></li>
            <li><a href="#tabs-3">��Ʒ��װ��Ϣ</a></li>
        </ul>
        <table width="100%" class="list" id="tabs-1">
            <caption style="text-align: center; font-size: x-large; font-weight: bolder; padding: 0 0 10px 0;">
                ���ں�ͬ��Ϣ</caption>
            <thead align="center">
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" class="button" value="�� ��" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="3" align="center" valign="middle" style="width: 10%;">
                        ���ں�ͬ���
                    </td>
                    <%= Html.Hidden("ExportContracts��ID", Html.Encode(Model.ID.ToString()))%>
                    <td align="right" style="width: 15%;">
                        ���ں�ͬ�ţ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("ExportContracts��Name",Html.Encode( Model.Name), new { validate = "required:true" })%>
                    </td>
                    <td align="right" style="width: 15%;">
                        ���ں�ͬǩԼ���ڣ�
                    </td>
                    <td align="left" style="width: 30%;">
                        <%= Html.TextBox("ExportContracts��Date", Html.Encode(Model.Date.ToShortDateString()), new { validate = "date:true,required:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ͻ������ţ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��CustomerNo", Html.Encode(Model.CustomerNo))%>
                    </td>
                    <td align="right">
                        ��ͬ���
                    </td>
                    <td align="left">
                        <%= Html.DropDownList("ExportContracts��Type", LZL.ForeignTrade.Controllers.DataHelper.GetDictionary("���ں�ͬ����", Html.Encode(Model.Type)), "��ѡ��")%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ѡ��ͻ���
                    </td>
                    <td align="left">
                        <%
                            if (Model.CustomerID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCustomer(Model.CustomerID);
                                if (obj != null)
                                {
                                    Response.Write(Html.TextBox("_ExportContracts��CustomerID", obj.NameCode));
                                    Response.Write(Html.Hidden("ExportContracts��CustomerID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_ExportContracts��CustomerID"));
                                    Response.Write(Html.Hidden("ExportContracts��CustomerID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_ExportContracts��CustomerID"));
                                Response.Write(Html.Hidden("ExportContracts��CustomerID"));
                            }
                            Response.Write("<a href='#'onclick=LoadControlList(this,'CustomerIndex')>ѡ��</a>");
                        %>
                    </td>
                    <td align="right">
                        ��˾��ƣ�
                    </td>
                    <td align="left">
                        <%
                            if (Model.CompanyID != null)
                            {
                                var obj = LZL.ForeignTrade.Controllers.DataHelper.GetCompany(Model.CompanyID);
                                if (obj != null)
                                {
                                    Response.Write(Html.TextBox("_ExportContracts��CompanyID", obj.Name));
                                    Response.Write(Html.Hidden("ExportContracts��CompanyID", obj.ID.ToString()));
                                }
                                else
                                {
                                    Response.Write(Html.TextBox("_ExportContracts��CompanyID"));
                                    Response.Write(Html.Hidden("ExportContracts��CompanyID"));
                                }
                            }
                            else
                            {
                                Response.Write(Html.TextBox("_ExportContracts��CompanyID"));
                                Response.Write(Html.Hidden("ExportContracts��CompanyID"));
                            }
                        %>
                        <%Response.Write("<a href='#'onclick=LoadControlList(this,'CompanyIndex')>ѡ��</a>"); %>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        ������Ϣ
                    </td>
                    <td align="right">
                        ��ע��Ϣ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("ExportContracts��Note", Html.Encode(Model.Note), new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="5" valign="middle">
                        ����������
                    </td>
                    <td align="right">
                        ��ͬ���֣�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��CurrencyType", Html.Encode(Model.CurrencyType))%><a
                            href="#" onclick="LoadDictionaryPanel('��������',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �۸����
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��PriceClause", Html.Encode(Model.PriceClause))%><a
                            href="#" onclick="LoadDictionaryPanel('�۸�����',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �۸������˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("ExportContracts��PriceClauseNote", Html.Encode(Model.PriceClauseNote), new { style = "width:99%; height:60px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("ExportContracts��ClauseType", Html.Encode(Model.ClauseType))%><a
                            href="#" onclick="LoadDictionaryPanel('���ʽ',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���ʽ����˵����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("ExportContracts��ClauseTypeNote", Html.Encode(Model.ClauseTypeNote), new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ����֤�������ޣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��SubmitDate", Html.Encode(Model.SubmitDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                    <td align="right">
                        Ͷ���ձ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��PolicyType", Html.Encode(Model.PolicyType))%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="6" valign="middle">
                        ����������
                    </td>
                    <td align="right">
                        �˵ֹ���
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��TansportCountry", Html.Encode(Model.TansportCountry))%><a
                            href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        ���˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��StartHaven", Html.Encode(Model.StartHaven))%><a
                            href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ת�˸ۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��TransferHaven", Html.Encode(Model.TransferHaven))%><a
                            href="#" onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        Ŀ�ĸۿڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��EdnHaven", Html.Encode(Model.EdnHaven))%><a href="#"
                            onclick="LoadDictionaryPanel('�ۿ�',true,this)">ѡ��</a>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���䷽ʽ��
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��TransportMode", Html.Encode(Model.TransportMode))%><a
                            href="#" onclick="LoadDictionaryPanel('���䷽ʽ',true,this)">ѡ��</a>
                    </td>
                    <td align="right">
                        �������ڣ�
                    </td>
                    <td align="left">
                        <%= Html.TextBox("ExportContracts��ShipmentDate", Html.Encode(Model.ShipmentDate), new { validate = "date:true", Class = "calendar" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �ʲ�ٷֱȣ���
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextBox("ExportContracts��ErrorValue", Html.Encode(Model.ErrorValue), new { validate = "digits:true,min:0,max:100" })%>%
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��ͷ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("ExportContracts��Mark", Html.Encode(Model.Mark), new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��װҪ��
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("ExportContracts��PackRequire", Html.Encode(Model.PackRequire), new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="1" valign="middle">
                        ��������
                    </td>
                    <td align="right">
                        ��ͬ�ۺ����
                    </td>
                    <td align="left" colspan="3">
                        <%= Html.TextArea("ExportContracts��ComprehensiveConvention", Html.Encode(Model.ComprehensiveConvention), new { style = "width:99%; height:40px;" })%>
                    </td>
                </tr>
                <% 
                    Model.ExportContractsPrice.Load();
                    if (Model.ExportContractsPrice.Count > 0)
                    {
                        for (int i = 0; i < Model.ExportContractsPrice.Count; i++)
                        {
                            Model.ExportContractsPrice.ElementAt(i).PriceReference.Load();
                        }
                    }
                %>
                <!-- ���۵���Ϣ -->
                <tr id="ExportContractsPrice��" style="<%=Model.ExportContractsPrice.Count>0?"": "display: none"%>;
                    text-align: left;">
                    <td colspan="5">
                        <center style="text-align: center; font-size: x-large; font-weight: bolder;">
                            ���۵���Ϣ</center>
                        <!-- ��ʶ�ӱ�������� -->
                        <input type="hidden" value='<%=  Model.ExportContractsPrice.Count %>' name="ExportContractsPrice��regioncount"
                            id="ExportContractsPrice��regioncount" />
                        <!-- ��ʶ�ӱ���������(������ơ�ʵ���������) -->
                        <input type="hidden" name="region" value="ExportContractsPrice��" />
                        <!-- ��ʶ�ӱ�ʵ������� -->
                        <input type="hidden" name="ExportContractsPrice��objectname" value="LZL.ForeignTrade.DataEntity.ExportContractsPrice,LZL.ForeignTrade.DataEntity" />
                        <!-- ��Զ��ϵ�� -->
                        <!-- ��ʶ�ӱ����ʵ��������ơ�����ֶ����� -->
                        <input type="hidden" name="ExportContractsPrice��fk" value='Price' />
                        <!-- ��ʶ��Զ��ϵ���У�һ�� -->
                        <input type="hidden" name="ExportContractsPrice��pfk" value='ExportContracts' />
                        <fieldset style="<%=Model.ExportContractsPrice.Count>0?"": "display: none"%>; width: 95%;">
                            <legend>���۵���Ϣ</legend>
                            <ul id="bjdxx" style="float: left; width: 100%; clear: both; position: relative;">
                                <%
                                    for (int i = 0; i < Model.ExportContractsPrice.Count(); i++)
                                    {
                                        var htmlstr = "<li style='display: inline;padding:0 2;'>{0}{1}</li>";
                                        var script = @"$(this).parent().remove();display('ExportContractsPrice��','bjdxx')";
                                        Response.Write(string.Format(htmlstr,
                                            @"<input type='checkbox' name='Price��ID' checked='true' onclick=" + Html.Encode(script) + " value='" + Model.ExportContractsPrice.ElementAt(i).Price.ID.ToString() + "' />",
                                            Html.ActionLink(Model.ExportContractsPrice.ElementAt(i).Price.Name, "Details", "Price", new { id = Model.ExportContractsPrice.ElementAt(i).Price.ID.ToString() }, null)));
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </td>
                </tr>
                <!-- ���۵���Ϣ -->
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" class="button" value="�� ��" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="ȡ ��" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            type="button" class="button" value="�� ��" onclick="javascript:window.location.href ='<%=Url.Content("~/ExportContracts/Index") %>'" />
                    </td>
                </tr>
            </tfoot>
        </table>
        <table class="list" width="100%" id="tabs-2">
            <caption>
                ��Ʒ��Ϣ��̬����
            </caption>
            <%
                Model.ProductSummary.Load();
            %>
            <!-- ��Ʒ��Ϣ -->
            <tr id="ProductSummary��" style="<%=Model.ProductSummary.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <%
                        if (Model.ProductSummary.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductSummary.Count);
                            viewdictionary2.Add("FK", "ExportContracts");//���۵���Ϣ
                            Html.RenderPartial("ProductSummaryControl", Model.ProductSummary.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- ��Ʒ��Ϣ -->
        </table>
        <table class="list" width="100%" id="tabs-3">
            <caption>
                ��Ʒ��װ��Ϣ��̬����
            </caption>
            <!-- ��Ʒ��װ��Ϣ -->
            <%
                Model.ProductPack.Load();
            %>
            <tr id="ProductPack��" style="<%=Model.ProductPack.Count>0?"": "display: none"%>;">
                <td colspan="5">
                    <%  
                        if (Model.ProductPack.Count > 0)
                        {
                            ViewDataDictionary viewdictionary2 = new ViewDataDictionary();
                            viewdictionary2.Add("number", Model.ProductPack.Count);
                            viewdictionary2.Add("FK", "ExportContracts");//���۵���Ϣ
                            Html.RenderPartial("ProductPackControl", Model.ProductPack.ToList(), viewdictionary2);
                        }
                    %>
                </td>
            </tr>
            <!-- ��Ʒ��װ��Ϣ -->
        </table>
    </div>
    <%
        } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ChildActionContent" runat="server">
    <a href="#" onclick="openbjd('ExportContractsPrice��','Price��ID','bjdxx','<%=Url.Action("Details","Price")%>');"
        class="button4">����������Ϣ</a> <a href="#" onclick="addcontrol(this,'ProductSummaryControl','ProductSummary��',1,'ExportContracts')"
            class="button4">�����Ʒ��Ϣ</a> <a href="#" onclick="addcontrol(this,'ProductPackControl','ProductPack��',1,'ExportContracts')"
                class="button4">�����Ʒ��װ</a>
</asp:Content>
