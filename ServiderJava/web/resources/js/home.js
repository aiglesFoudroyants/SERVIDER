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
                    console.log("dataé " + data);
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

    $("#btnLogin").bind("click", function () {
        $.get("login.htm", {email: $("#txtEmail").val(), password: $("#txtPass").val()}).done(function(data){
           if (data === "true"){
               alert($("#loginValide").text());
           } else {
               alert($("#loginInvalide").text());               
           }
        });
    });
});