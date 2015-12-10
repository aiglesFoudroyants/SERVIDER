var htmlAnnonce = '<div class="annonce col-md-12">';
htmlAnnonce += '<div class="col-md-10" style="padding:10px;align-items: center;">';
htmlAnnonce += '<div class="row">';
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += '<h3 id="TitreTypeService">Type de service</h3>';                                   
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
htmlAnnonce += '<img class="col-md-12" src="resources/img/team/team-member-1.jpg" style="margin-bottom: 10px;"/>';
htmlAnnonce += '<div class="col-md-12" style="text-align: center; margin-bottom: 10px;">'; 
htmlAnnonce += '<div class="col-md-12">';
htmlAnnonce += '<input name="star3" type="radio" class="star" disabled="disabled"/>'; 
htmlAnnonce += '<input name="star3" type="radio" class="star" disabled="disabled"/>';
htmlAnnonce += '<input name="star3" type="radio" class="star" disabled="disabled" checked="checked"/>';
htmlAnnonce += '<input name="star3" type="radio" class="star" disabled="disabled"/>';
htmlAnnonce += '<input name="star3" type="radio" class="star" disabled="disabled"/>';
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
});


