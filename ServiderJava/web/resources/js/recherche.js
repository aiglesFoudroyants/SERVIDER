var htmlAnnonce = '<div class="annonce col-md-12">';


htmlAnnonce += '<div class="col-md-10" style="padding:10px;align-items: center;">';
htmlAnnonce += '<div class="row">';
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += '<h3 class="TitreTypeService"></h3>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '<div class="row">';
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += 'Description :';
htmlAnnonce += '<p class="DescriptionService"></p>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '<div class="row">';
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += 'Prix :';
htmlAnnonce += '<p class="PrixService"></p>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '<div class="row">';
htmlAnnonce += '<div class="col-md-6">';
htmlAnnonce += 'Localisation :';
htmlAnnonce += '<p class="LocalisationService"></p>';
htmlAnnonce += '</div>';
htmlAnnonce += '<div class="col-md-6" style="opacity:0;">';
htmlAnnonce += 'Disponibilité :';
htmlAnnonce += '<p class="DisponibiliteService"></p>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '<div class="col-md-2" style="padding:10px;padding-left:25px;padding-right:25px;align-items: center;">';
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += '<button class="form-control btn btn-color submit" type="submit" style="height: 34px !important">Contacter</button>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';

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
                window.location = "recherche.htm?recherche=" + data.trim() + "&language=" + $("#language  option:selected").val();
            },
            error: function (data) {
                console.log("error");

            }
        });
    });

    $.ajax({
        dataType: "json",
        type: 'Get',
        contentType: 'text/plain; charset=UTF-8',
        url: 'getResultatRecherche.htm',
        data: {TypeService: $("#valeur_recherche").text().trim(), langue: $("#language  option:selected").val()},
        success: function (annonces) {
            var containerAnnonces = $("#annonces");
            if (annonces.length > 0) {
                annonces.forEach(function (annonce) {
                    containerAnnonces.append(htmlAnnonce);
                    var divAnnonce = containerAnnonces.children(".annonce:last");
                    divAnnonce.find(".TitreTypeService").html(annonce["sType" + $("#language  option:selected").val()]);
                    divAnnonce.find(".DescriptionService").html(annonce.sDescription);
                    divAnnonce.find(".PrixService").html(annonce.sTarif);
                    divAnnonce.find(".LocalisationService").html(annonce.sAddresse);
                    divAnnonce.find("input").rating("select", toInteger(divAnnonce.dlRating));
                    divAnnonce.find("input").rating('readOnly', true);
                });
            }
            else {
                containerAnnonces.css("text-align", "center");
                containerAnnonces.html("<h1>Aucun résultast</h1>");
            }
        },
        error: function (data) {
            console.log("error");
        }
    });
});


function changerLangue() {
    window.location = "recherche.htm?recherche=" + $("#valeur_recherche").text().trim() + "&language=" + $("#language  option:selected").val();

}
function toInteger(number) {
    return Math.round(Number(number));
}


