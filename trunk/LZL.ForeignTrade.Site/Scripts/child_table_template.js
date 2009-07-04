//添加控件信息
function addcontrol(obj, controlname, region, num) {
    if ($("#" + region).find("div[id = 'regioncontent']").length <= 0) {
        $.ajax({
            type: "get",
            dataType: "html",
            data: { name: controlname, number: num },
            url: '/Shared/GetShareControl', //获取控件信息
            success: function(data) {
                $("#" + region).find("div[id='regioncontent']").remove();
                $("#" + region).find("div[id='region']").remove();
                $("#" + region).children().append($(data));
                dynamicinputcss(); //动态添加之后执行模板页中css样式。
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
    var obj = $(regionname).closest("div[id='regioncontent']");
    $.each($(obj).siblings("div[id='region']").find("input[type='hidden']"), function(i, o) {
        if ($(o).attr("name").search("regioncount") != -1) {
            var value = Number($(o).val());
            $(o).val(value + 1);
        }
    });
    var copyhtml = $(obj).clone(true);
    $(copyhtml).find("input[type='hidden']").val("");
    $(obj).parent().append(copyhtml);
}

//删除区域模版
function deleteregion(regionname) {
    var obj = $(regionname).closest("div[id='regioncontent']");
    $.each($(obj).siblings("div[id='region']").find("input[type='hidden']"), function(i, o) {
        if ($(o).attr("name").search("regioncount") != -1) {
            var value = Number($(o).val());
            $(o).val(value - 1);
            if (value == 1) {//表示只有一个。
                $.data(document, $(o).attr("name").substr(0, $(o).attr("name").indexOf("♂") + 1), 0);
                $($(obj).parent().parent()).css("display", "none");
            }
            $(obj).remove();
        }
    });

}