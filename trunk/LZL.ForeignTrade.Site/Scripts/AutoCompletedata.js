function autocompletedictionary_Bak(name, type) {
    $("#" + name).autocomplete(
    //'/Shared/GetDictionary',
    //'<%= Url.Content(\"~/Shared/GetDictionary\")%>', //change by lj(如果不用这种方式，在iis中浏览路径找不到)
     '<%=Url.Action("GetDictionary","Shared")%>',
    { max: 20,
        highlight: false,
        multiple: false,
        scroll: true,
        scrollHeight: 300,
        dataType: 'json',
        extraParams: { typename: type },
        parse: function(data) {
            var rows = [];
            for (var i = 0; i < data.length; i++) {
                rows[rows.length] = { data: data[i].Name,
                    value: data[i].ID, result: data[i].Name
                };
            } return rows;
        },
        formatItem: function(row, i, n) { return row; }
    });
}
