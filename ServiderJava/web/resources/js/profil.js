var htmlCommentaire = '<div class="row col-xs-12 commentaire">';
htmlCommentaire += '<div class="media-photo-badge col-xs-2 " >';
htmlCommentaire += '<img  class="circular-profil-image-comment" alt="shared.user_profile_image" data-pin-nopin="true" src="resources/img/team/pikachu.jpg" title="image du profil" >';
htmlCommentaire += '<p id="commentaireNom"></p>';
htmlCommentaire += '</div> ';
htmlCommentaire += '<div class="media-photo-badge col-xs-10 col-xs-push-2 col-sm-push-0" >';
htmlCommentaire += '<p id="commentaireContenu"></p>';
htmlCommentaire += '</div> ';
htmlCommentaire += '</div>';
var htmlCommentaireReponse = '<div class="row col-xs-12 col-xs-push-1 commentaireReponse">';
htmlCommentaireReponse += '<div class="media-photo-badge col-xs-2 " >';
htmlCommentaireReponse += '<img  class="circular-profil-image-comment" alt="shared.user_profile_image" data-pin-nopin="true" src="resources/img/team/rebgar.jpg" title="image du profil" >';
htmlCommentaireReponse += '<p id="commentaireNom"></p>';
htmlCommentaireReponse += '</div> ';
htmlCommentaireReponse += '<div class="media-photo-badge col-xs-10 col-xs-push-2 col-sm-push-0" >';
htmlCommentaireReponse += '<p id="commentaireContenu"></p>';
htmlCommentaireReponse += '</div> ';
htmlCommentaireReponse += '</div>';

$(document).ready(function () {
    var utilisateur;

    if ($.cookie("servider-user-id")) {
        $.ajax({
            dataType: "json",
            type: 'Get',
            url: 'getUtilisateur.htm',
            data: {id: $.cookie("servider-user-id")},
            success: function (data) {
                utilisateur = data;
                $("#lblNom").html(utilisateur.sPrenom + " " + utilisateur.sNom);
                if (utilisateur.lDescription) {
                    $("#lblDescription").html(utilisateur.lDescription);
                }
                setStatusUtilisateur(utilisateur.statusUtilisateurId);
                setCommentaires();
            },
            error: function (data) {
                console.log("error ajax: ", data);
            }
        });

    }
});

function setCommentaires() {

    $.ajax({
        dataType: "json",
        type: 'Get',
        url: 'getCommentairesClient.htm',
        data: {id: $.cookie("servider-user-id")},
        success: function (data) {
            ajouterCommentairesAElement($("#commentairesClient"), data);
        },
        error: function (data) {
            console.log("error ajax: ", data);
        }
    });
    $.ajax({
        dataType: "json",
        type: 'Get',
        url: 'getCommentairesService.htm',
        data: {id: $.cookie("servider-user-id")},
        success: function (data) {
            ajouterCommentairesAElement($("#commentairesServices"), data);
        },
        error: function (data) {
            console.log("error ajax: ", data);
        }
    });
}

function ajouterCommentairesAElement(blocCommentaires, commentaires) {
    commentaires.forEach(function (commentaire) {
        blocCommentaires.append(htmlCommentaire);
        if (commentaire.lReponse) {
            blocCommentaires.append(htmlCommentaireReponse);
        }
    });
    var compteur = 0;
    blocCommentaires.children(".commentaire").each(function () {
        $(this).find("#commentaireNom").html(commentaires[compteur].sPrenom + " " + commentaires[compteur].sNom);
        $(this).find("#commentaireContenu").html(commentaires[compteur].lCommentaire);
        if (commentaires[compteur].lReponse) {
            $(this).next(".commentaireReponse").find("#commentaireNom").html($("#lblNom").text());
            $(this).next(".commentaireReponse").find("#commentaireContenu").html(commentaires[compteur].lReponse);
        }
        compteur++;
    });
}

function setStatusUtilisateur(idStatus) {
    var statusUtilisateur;
    console.log("log function", idStatus);
    $.ajax({
        dataType: "json",
        type: 'Get',
        url: 'getStatusUtilisateur.htm',
        data: {id: idStatus},
        success: function (data) {
            console.log("log succes", data);
            statusUtilisateur = data;
            $("#lblStatus").html($("#language  option:selected").val() === "fr" ? statusUtilisateur.sStatutFr : statusUtilisateur.sStatutEn);
        },
        error: function (data) {
            console.log("error ajax: ", data);
        }
    });
}






