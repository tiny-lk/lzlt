<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Costomer/Costomer.master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    添加客户信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="../../Scripts/jquery-1.3.2.js"></script>

    <script type="text/javascript">
        function lxyregion() {
            if ($("#lxrregion").is(":hidden")) {
                $("#lxrregion").show('slow');
            }
            else {
                $("#lxrregion").hide('normal');
                $.data(document, "slow", 0);
            }
        }
        
        //添加区域模版
        function addregion(regionname) {
            while ($(regionname).parent("TABLE").length == 0) {
                regionname = $(regionname).parent();
            }
            var obj = $(regionname).parent("TABLE");
            var value = Number(obj.parent().find("input[type='hidden']").val());
            obj.parent().find("input[type='hidden']").val(value + 1);
            var copyhtml = $(obj).clone();
            var randomvalue = getrandom();
            $.each($(copyhtml).find("input[type='text'], input[type='password'], textarea,input[type='button']"), function(v, o) {
                if (o.name != null) {
                    if (o.name.search("♂") == -1) {
                        o.name = o.name + "♂" + randomvalue;
                        o.id = o.name;
                    } else {
                        o.name = o.name.substr(0, o.name.indexOf("♂")) + "♂" + randomvalue;
                        o.id = o.name;
                    }
                }
            });
            if ($(copyhtml).attr("id").search("♂") == -1) {
                $(copyhtml).attr("id", $(copyhtml).attr("id") + "♂" + randomvalue);
            } else {
                $(copyhtml).attr("id", $(copyhtml).attr("id").substr(0, $(copyhtml).attr("id").indexOf("♂")) + "♂" + randomvalue);
            }
            $(obj).parent().append(copyhtml);
        }
        //获取随机数
        function getrandom() {
            return (new Date().getTime()) ^ Math.random();
        }
        //删除区域模版
        function deleteregion(regionname) {
            while ($(regionname).parent("TABLE").length == 0) {
                regionname = $(regionname).parent();
            }
            var obj = $(regionname).parent("TABLE");
            var value = Number(obj.parent().find("input[type='hidden']").val());
            if (value != 1) {
                obj.parent().find("input[type='hidden']").val(value - 1);
                $(obj).remove();
            } else {
                alert("只存在一个区域不能进行删除！");
            }
        }
    </script>

    <h2>
        添加客户信息</h2>
    <% using (Html.BeginForm())
       { %>
    <table width="100%">
        <thead align="center">
            <tr>
                <td colspan="5">
                    <h3>
                        客户信息</h3>
                </td>
            </tr>
        </thead>
        <tr>
            <td rowspan="7" align="center" valign="middle">
                客户基本信息
            </td>
            <td align="right">
                客户代码（简称）：
            </td>
            <td align="left">
                <%= Html.TextBox("khdmjc")%>
            </td>
            <td align="right">
                中文名称：
            </td>
            <td align="left">
                <%= Html.TextBox("zwmc")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                英文名称：
            </td>
            <td align="left">
                <%= Html.TextBox("ywmc")%>
            </td>
            <td align="right">
                英文地址：
            </td>
            <td align="left">
                <%= Html.TextBox("ywdz")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                国家：
            </td>
            <td align="left">
                <%= Html.TextBox("gj")%>
            </td>
            <td align="right">
                省份（州）：
            </td>
            <td align="left">
                <%= Html.TextBox("sf")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                城市：
            </td>
            <td align="left">
                <%= Html.TextBox("cs")%>
            </td>
            <td align="right">
                编码：
            </td>
            <td align="left">
                <%= Html.TextBox("yzbm")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                电话号码：
            </td>
            <td align="left">
                <%= Html.TextBox("dhhm")%>
            </td>
            <td align="right">
                传真号码：
            </td>
            <td align="left">
                <%= Html.TextBox("czhm")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                网站：
            </td>
            <td align="left">
                <%= Html.TextBox("wzdz")%>
            </td>
            <td align="right">
                客户类别：
            </td>
            <td align="left">
                <%= Html.TextBox("khlb")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                备注：
            </td>
            <td align="left" colspan="3">
                <%= Html.TextArea("bz", new { style = "width:99%; height:80px;" })%>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle">
                财务信息
            </td>
            <td align="right">
                开户银行：
            </td>
            <td align="left">
                <%= Html.TextBox("kfhy")%>
            </td>
            <td align="right">
                账&nbsp;&nbsp;&nbsp;&nbsp;户：
            </td>
            <td align="left">
                <%= Html.TextBox("yhzh")%>
            </td>
        </tr>
        <!-- 联系人区域 -->
        <tr>
            <td colspan="5">
                <center>
                    <h3>
                        联系人动态区域</h3>
                    <input type="hidden" value="1" name="lxrregioncount" id="lxrregioncount" />
                </center>
                <table id="lxrregion" class="dynamictable" style="display: none;">
                    <tr>
                        <td align="center" valign="middle" rowspan="4" style="width: 20%;">
                            联系人信息
                        </td>
                        <td align="right" style="width: 20%;">
                            联系人：
                        </td>
                        <td align="left" style="width: 20%;">
                            <%= Html.TextBox("lxr")%>
                        </td>
                        <td align="right" style="width: 20%;">
                            职位：
                        </td>
                        <td align="left" style="width: 20%;">
                            <%= Html.TextBox("zw")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            电话：
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxrdh")%>
                        </td>
                        <td align="right">
                            传真：
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxrcz")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            移动电话：
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxryddh")%>
                        </td>
                        <td align="right">
                            电子邮件：
                        </td>
                        <td align="left">
                            <%= Html.TextBox("lxrdzyj")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            联系人备注：
                        </td>
                        <td align="left" colspan="3">
                            <%= Html.TextArea("lxrbz", new { style = "width:99%; height:80px;" })%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right">
                            <input id="add" name="add" type="button" value="添 加" onclick="addregion(this);" />
                            <input id="delete" name="delete" type="button" value="删 除" onclick="deleteregion(this);" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!-- 联系人区域 -->
        <tr>
            <td colspan="5" align="center">
                <input type="submit" value="提 交" />
                &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取 消" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                    type="button" value="返 回" onclick="javascript:history.back(1);" />
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
<asp:Content ID="ChildActionContent" ContentPlaceHolderID="ChildActionContent" runat="server">
    <li><a href="#" onclick="lxyregion();">添加联系人信息</a></li>
    <li>备忘录</li>
</asp:Content>
