$(document).ready(function () {
    $("#search").autocomplete({
        source: function (request, response) {
            $.ajax({
                dataType: "text",
                type: 'Get',
                contentType: 'text/html; charset=UTF-8',
                url: 'typesServices.htm',
                data: {entree: $("#search").val(), langue: $("#language option:selected").val()},
                success: function (data) {
                    $('input.suggest-user').removeClass('ui-autocomplete-loading');
                    data = $("<textarea/>").html(data).text();
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
    $("#btnSearch").bind("click", function () {
        $.ajax({
            dataType: "text",
            type: 'Get',
            contentType: 'text/html; charset=UTF-8',
            url: 'getResultatRechercheTypeID.htm',
            data: {entree: $("#search").val(), langue: $("#language option:selected").val()},
            success: function (data) {
                window.location = "recherche.htm?recherche=" + data.trim();
            },
            error: function (data) {
                console.log("error");

            }
        });
    });
    $("#btnOffre").bind("click", function () {

        window.location="nouvelle_annonce.htm";

    });
});