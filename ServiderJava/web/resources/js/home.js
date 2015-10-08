$( document ).ready(function() {
    $("#search").autocomplete({
        source: function( request, response ) {
            $.ajax({
                dataType: "json",
                type : 'Get',
                url: 'typesServices.htm',
                data:{entree: $("#search").val(), langue: $("#language  option:selected").val()},
                success: function(data) {
                    $('input.suggest-user').removeClass('ui-autocomplete-loading');
                    response(data);
                },
                error: function(data) {
                    $('input.suggest-user').removeClass('ui-autocomplete-loading');  
                }
            });
        },
        messages: {
            noResults: '',
            results: function() {}
        }
    });
});