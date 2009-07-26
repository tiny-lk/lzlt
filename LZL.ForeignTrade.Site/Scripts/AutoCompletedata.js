function autocompletedictionary(name, type) {
    $("#" + name).autocomplete('/Shared/GetDictionary',
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
