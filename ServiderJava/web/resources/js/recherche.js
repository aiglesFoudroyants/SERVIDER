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
htmlAnnonce += '<div class="col-md-12" style="text-align: center; margin-bottom: 10px;">'; 
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += '<input name="star3" type="radio" class="star"/>'; 
htmlAnnonce += '<input name="star3" type="radio" class="star"/>';
htmlAnnonce += '<input name="star3" type="radio" class="star"/>';
htmlAnnonce += '<input name="star3" type="radio" class="star"/>';
htmlAnnonce += '<input name="star3" type="radio" class="star"/>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += '<button class="form-control btn btn-color submit" type="submit" style="height: 34px !important"><fmt:message key="btnContacter"/></button>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';
htmlAnnonce += '</div>';

$( document ).ready(function() {
    $.ajax({
        dataType: "json",
        type: 'Get',
        contentType: 'text/plain; charset=UTF-8',
        url: 'getResultatRecherche.htm',
        data: {entree: $("#valeur_recherche").text().trim(), langue: $("#language  option:selected").val()},
        success: function (annonces) {
            var containerAnnonces = $("#annonces");
            annonces.forEach(function(annonce){
                containerAnnonces.append(htmlAnnonce);
                var divAnnonce = containerAnnonces.children(".annonce:last");
                divAnnonce.find(".TitreTypeService").html($("#valeur_recherche").text().trim());
                divAnnonce.find(".DescriptionService").html(annonce.sDescription);
                divAnnonce.find(".PrixService").html(annonce.sTarif);
                divAnnonce.find(".LocalisationService").html(annonce.sAddresse);
                divAnnonce.find("input").rating("select", divAnnonce.dlRating);
                
            });
        },
        error: function (data) {
            console.log("error");
        }
    });
});


