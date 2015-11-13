$(document).ready(function () {
    $("#search").autocomplete({
        source: function (request, response) {
            $.ajax({
                dataType: "text",
                type: 'Get',
                contentType: 'text/plain; charset=UTF-8',
                url: 'typesServices.htm',
                data: {entree: $("#search").val(), langue: $("#language  option:selected").val()},
                success: function (data) {
                    $('input.suggest-user').removeClass('ui-autocomplete-loading');
                    console.log("data " + data);
                    response(data.split(","));
                },
                error: function (data) {
                    console.log("error");
                    $('input.suggest-user').removeClass('ui-autocomplete-loading');
                }
            });
        },
        messages: {
            noResults: '',
            results: function () {
            }
        }
    });
});