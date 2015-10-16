$( document ).ready(function() {
    $("#search").autocomplete({
        source: function( request, response ) {
            $.ajax({
                dataType: "text",
                type : 'Get',
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                url: 'typesServices.htm',
                data:{entree: $("#search").val(), langue: $("#language  option:selected").val()},
                success: function(data) {
                    $('input.suggest-user').removeClass('ui-autocomplete-loading');
                    //data = utf8_decode(data);
                    console.log("dataé " + data);
                    response(data.split(","));
                },
                error: function(data) {
                    console.log("error");
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