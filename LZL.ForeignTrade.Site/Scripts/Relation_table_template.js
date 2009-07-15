function addRelationcontrol(regionname, childobject, data, addid, url) {
    $("#modedialog").remove();
    $("body").append("<div id='modedialog'></div>");
    var groupid = addid;
    $("#modedialog").dialog({
        bgiframe: true,
        modal: true,
        width: 600,
        height: 'auto',
        position: 'center',
        resizable: true,
        draggable: true,
        closeOnEscape: true,
        buttons: {
            确定: function() {
                if ($(document).data("checkvalue") != null || $(document).data("checkvalue") != 'undefined') {
                    $("#" + regionname).css("display", "");
                    $.each($(document).data("checkvalue").split("♂"), function(i, o) {
                        if (o != "undefined" && $("#" + regionname).find("input[value=" + o.split('|')[0] + "]").length == 0) {
                            var count = $("#" + regionname).find("#" + regionname + "regioncount").val();
                            $("#" + regionname).find("#" + regionname + "regioncount").val(Number(count) + 1);
                            var checkedhtml = "<li style='display: inline;padding:0 2;'>";
                            checkedhtml += " <input type='checkbox'name=" + childobject + " value=" + o.split('|')[0] + " checked = '" + o.split('|')[0] + "' ";
                            checkedhtml += " onclick=$(this).parent().remove();display('" + regionname + "','" + groupid + "'); >";
                            checkedhtml += " <a href=" + url + "/" + o.split('|')[0] + ">" + o.split("|")[1] + "</a> </li>";
                            if (addid != null && $("#" + regionname).find("#" + groupid).length == 1) {
                                $('#' + groupid).parent().css("display", "");
                                $("#" + regionname).find("#" + groupid).append(checkedhtml);
                            }
                            else {
                                $("#" + regionname).find("ul").append(checkedhtml);
                            }
                        }
                    })
                    $("#dialog").children().remove();
                    $(this).dialog('close');
                }
                else {
                    alert("选择不能为空！");
                }
            }
        }
    });

    $("#modedialog").append(data);
    $("#modedialog").dialog();
    $("#modedialog").dialog('open');
}

function display(regionname, groupid) {

    var count = $("#" + regionname).find("#" + regionname + "regioncount").val();
    $("#" + regionname).find("#" + regionname + "regioncount").val(Number(count) - 1);
    if ($('#' + groupid).find("input[type='checkbox']").length == 0) {
        $('#' + groupid).parent().css('display', 'none');
    }
    if ($('#' + regionname).find("input[type='checkbox']").length == 0) {
        $('#' + regionname).css('display', 'none');
    }
}