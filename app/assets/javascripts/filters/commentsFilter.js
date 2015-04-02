angular.module("commentsFilters", [])
.filter("comment", function ($filter) {
    return function (data, text) {
        if (angular.isArray(data) && angular.isString(text)) {
            var results = [];
            var keys = {};
            for (var i = 0; i < data.length; i++) {
                var val = data[i]['text'];
                if (val.indexOf(text) != -1) {
                    results.push(data[i]);
                }
            }
            return results;
        } else {
            return data;
        }
    }
})