//添加控件信息
function addcontrol(obj, controlname, region) {
    if ($.data(document, region) == null || $.data(document, region) == 0) {
        $.ajax({
            type: "get",
            dataType: "html",
            data: { name: controlname },
            url: '/Shared/GetShareControl', //获取控件信息
            success: function(data) {
                $("#" + region).children().append(data);
                dynamicinputcss(); //动态添加之后执行模板页中css样式。
                $.data(document, region, 1);
                $("#" + region).css("display", "");
            },
            error: function(err) {
                alert("添加" + controlname + "表单错误！");
            }
        });
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
    $(obj).parent().append(copyhtml);
    dynamicinputcss(); //动态添加之后执行模板页中css样式。
}
//删除区域模版
function deleteregion(regionname) {
    while ($(regionname).parent("TABLE").length == 0) {
        regionname = $(regionname).parent();
    }
    var obj = $(regionname).parent("TABLE");
    $.each(obj.parent().find("input[type='hidden']"), function(i, o) {
        if ($(o).attr("name").search("regioncount") != -1) {
            var value = $(o).val();
            $(o).val(value - 1);
            if (value == 1) {
                $.data(document, $(o).attr("name").substr(0, $(o).attr("name").indexOf("★") + 1), 0);
                $($(obj).parent().parent()).css("display", "none");
                $($(obj).parent()).children().remove();
            }
            else {
                $(obj).remove();
            }
        }
    });
}