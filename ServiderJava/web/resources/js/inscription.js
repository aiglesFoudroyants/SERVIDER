var stateHtml = null;
var serviceTemplate = null;



$(document).ready(function () {
    stateHtml = $("#state")[0].innerHTML;
    serviceTemplate = '<div class="row" style="display: none;">';
    serviceTemplate += '<div class="form-group">';
    serviceTemplate += '<div class="col-md-11">';
    serviceTemplate += '<input class="form-control txtService" type="text" placeholder="' + $(".txtService").attr("placeholder") + '" value="">';
    serviceTemplate += '</div>';
    serviceTemplate += '<div class="col-md-1 padding0-5" style="display: flex;align-items: center;height: 4em;">';
    serviceTemplate += '<i class="fa fa-2x fa-remove clean" style=\'color: red;cursor:pointer;\' onclick="removeService(event);"></i>';
    serviceTemplate += '</div>';
    serviceTemplate += '</div>';
    serviceTemplate += '</div>';

    populateComboBoxes();
    bindInscription();
    bindChks();
    bindAutocompleteService();
    bindAdd();

    $("#state").prop('disabled', true);
    $("#txtCompagnie").hide();
    $("#serviceSection").hide();
});


function populateComboBoxes() {
    populateCountry();
    bindState();
    populateGenre();
    populateLangue();
}

function populateCountry() {
    $.get("pays.htm", function (data) {
        var select = $("#country");
        data = $("<textarea/>").html(data).text();
        $(data).find("paysGroup").children("pays").each(function () {
            var pays = {
                id: $(this).children("id"),
                nomFr: $(this).children("nomFr"),
                nomEn: $(this).children("nomEn"),
                abreviation: $(this).children("abreviation")
            };
            select.append('<option value="' + pays.id.text() + '">'
                    + ($("#language  option:selected").val() === "fr" ? pays.nomFr.text() : pays.nomEn.text())
                    + '</option>');
        });
    });
}

function populateGenre() {
    $.get("genre.htm", function (data) {
        var select = $("#gender");
        data = $("<textarea/>").html(data).text();
        $(data).find("genres").children("genre").each(function () {
            var genre = {
                id: $(this).children("id"),
                genreFr: $(this).children("sexeFr"),
                genreEn: $(this).children("sexeEn")
            };
            select.append('<option value="' + genre.id.text() + '">'
                    + ($("#language  option:selected").val() === "fr" ? genre.genreFr.text() : genre.genreEn.text())
                    + '</option>');
        });
    });
}

function populateLangue() {
    $.get("langue.htm", function (data) {
        var select = $("#preferredLanguage");
        data = $("<textarea/>").html(data).text();
        $(data).find("langues").children("langue").each(function () {
            var langue = {
                id: $(this).children("id"),
                langueFr: $(this).children("langueFr"),
                langueEn: $(this).children("langueEn")
            };
            select.append('<option value="' + langue.id.text() + '">'
                    + ($("#language  option:selected").val() === "fr" ? langue.langueFr.text() : langue.langueEn.text())
                    + '</option>');
        });
    });
}

function bindState() {
    $("#country").bind('change', function () {
        $.get("province.htm", function (data) {
            var select = $("#state");
            var paysId = $("#country  option:selected").val();
            data = $("<textarea/>").html(data).text();
            select[0].innerHTML = stateHtml;
            if (paysId === "0") {
                select.prop('disabled', true);
            }
            else {
                select.prop('disabled', false);
                $(data).find("provinces").children("province").each(function () {
                    var province = {
                        id: $(this).children("id"),
                        paysId: $(this).children("paysId"),
                        nomFr: $(this).children("nomFr"),
                        nomEn: $(this).children("nomEn"),
                        abreviation: $(this).children("abreviation")
                    };
                    if (province.paysId.text() === paysId) {
                        select.append('<option value="' + province.id.text() + '">'
                                + ($("#language  option:selected").val() === "fr" ? province.nomFr.text() : province.nomEn.text())
                                + '</option>');
                    }
                });
            }
        });
    });
}

function bindInscription() {
    var user;
    var services;
    $("#btnRegister").bind('click', function () {
        user = {
            paysID: $("#country option:selected").val(),
            provinceID: $("#state option:selected").val(),
            sexeID: $("#gender option:selected").val(),
            langueID: $("#preferredLanguage option:selected").val(),
            sNomCompagnie: $("#chkCompagnie").is(':checked') ? $("#txtCompagnie").val() : "",
            sNom: $("#txtNom").val(),
            sPrenom: $("#txtPrenom").val(),
            sPassword: $("#txtPassword").val(),
            sCourriel: $("#txtCourriel").val(),
            sAdresse: $("#txtAdresse").val(),
            sCodePostal: $("#txtCode").val(),
            sVille: $("#txtVille").val()
        };
        services = [];

        if ($("#chkService").is(':checked')) {
            $(".txtService").each(function () {
                services.push($(this).val());
            });
        }
        $.ajax({
            dataType: "json",
            type: 'POST',
            url: 'insertUtilisateur.htm',
            data: {user: JSON.stringify(user), services: JSON.stringify(services), langue: $("#language option:selected").val()},
            success: function (data) {
                alert("Inscription Réussi");
                window.location = "index.htm";
            },
            error: function (data) {
                console.log("error ajax: ", data);
            }
        });
    });
}

function bindChks() {
    $("#chkCompagnie").bind('change', function () {
        $("#txtCompagnie").slideToggle();
    });

    $("#chkService").bind('change', function () {
        $("#serviceSection").slideToggle();
    });
}

function bindAutocompleteService() {
    $(".txtService:first").autocomplete({
        source: function (request, response) {
            $.ajax({
                dataType: "text",
                type: 'Get',
                contentType: 'text/plain; charset=UTF-8',
                url: 'typesServices.htm',
                data: {entree: $(".txtService:first").val(), langue: $("#language  option:selected").val()},
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
}

function bindAdd() {
    $("#btnAddService").bind('click', function () {
        $("#btnAddService").parents('.row').prev('.row').after(serviceTemplate);
        $("#btnAddService").parents('.row').prev('.row').slideDown();
        $("#serviceSection").find('.txtService:last').autocomplete({
            source: function (request, response) {
                $.ajax({
                    dataType: "text",
                    type: 'Get',
                    contentType: 'text/plain; charset=UTF-8',
                    url: 'typesServices.htm',
                    data: {entree: $(".txtService:last").val(), langue: $("#language  option:selected").val()},
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
    });
}

function removeService(e) {
    var deleteButton = $(e.target);
    if ((deleteButton.parents("#serviceSection").find(".row").length - 1) > 1) {
        var row = deleteButton.parents(".row:first");
        row.slideUp('slow', function () {
            row.remove();
        });
    }
    else {
        deleteButton.parents(".row:first").find(".txtService").val("");
    }
}
