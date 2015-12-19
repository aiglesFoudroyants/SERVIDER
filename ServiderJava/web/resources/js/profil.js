var editMode = false;
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
var utilisateur;
var CLASS_CURRENT = "current";
var ANIMATION_DURATION = 300;


$(document).ready(function () {


    $("#tab1").bind("click", function (e) {
        if (!$(e.target).hasClass(CLASS_CURRENT)) {
            $("#tab2").removeClass(CLASS_CURRENT);
            $("#tab1").addClass(CLASS_CURRENT);
            $("#commentairesServices").hide(ANIMATION_DURATION);
            $("#commentairesClient").show(ANIMATION_DURATION);
        }
    });

    $("#tab2").bind("click", function (e) {
        if (!$(e.target).hasClass(CLASS_CURRENT)) {
            $("#tab1").removeClass(CLASS_CURRENT);
            $("#tab2").addClass(CLASS_CURRENT);
            $("#commentairesClient").hide(ANIMATION_DURATION);
            $("#commentairesServices").show(ANIMATION_DURATION);
        }
    });

    $("#btnModifier").bind("click", function (e) {
        toggleModificationProfil(e);

    });

    $("btnContact").bind("click", function () {
        console.log("contacter");
        $.post("nouveau_commentaire.htm", {idReceveur: 1, idContrat: 1,
            bClientOuService: false, idTypeDeService: 1});
    });

    if ($.cookie("servider-user-id")) {
        $.ajax({
            dataType: "json",
            type: 'Get',
            url: 'getUtilisateur.htm',
            data: {id: $.cookie("servider-user-id")},
            success: function (data) {
                utilisateur = data;
                $("#lblNom").html(" " + utilisateur.sNom);
                $("#lblPrenom").html(utilisateur.sPrenom);

                if (utilisateur.lDescription) {
                    $("#lblDescription").html(utilisateur.lDescription);
                }
                setStatusUtilisateur(utilisateur.statusUtilisateurId);
                setCommentaires();
                setEtoilesRating(utilisateur);
            },
            error: function (data) {
                console.log("error ajax: ", data);
            }
        });
    }
});

function toggleModificationProfil(e) {
    var btn = $(e.target);
    var lblDescription = $("#lblDescription");
    var lblPrenom = $("#lblPrenom");
    var lblNom = $("#lblNom");
    if (editMode) {

        btn.val($("#lblEdit").text().trim());
        lblDescription.css("border", "none");
        lblDescription.attr("contenteditable", false);
        lblPrenom.css("border", "none");
        lblPrenom.attr("contenteditable", false);
        lblNom.css("border", "none");
        lblNom.attr("contenteditable", false);
        utilisateur.lDescription = lblDescription.text().trim();
        utilisateur.sPrenom = lblPrenom.text().trim();
        utilisateur.sNom = lblNom.text().trim();
        sauvegarder();
    } else {
        btn.val($("#lblSave").text().trim());
        lblDescription.css("border", "1px solid black");
        lblDescription.attr("contenteditable", true);
        lblPrenom.css("border", "1px solid black");
        lblPrenom.attr("contenteditable", true);
        lblNom.css("border", "1px solid black");
        lblNom.attr("contenteditable", true);
        lblDescription.focus();
        lblDescription.selectText();
    }
    editMode = !editMode;

}
function sauvegarder() {
    $.ajax({
        dataType: "json",
        type: 'POST',
        url: 'updateUtilisateur.htm',
        data: {user: JSON.stringify(utilisateur)},
        success: function (data) {
            alert("Mise a jour Réussi");
        },
        error: function (data) {
            console.log("error ajax: ", data);
        }
    });

}

function setEtoilesRating(utilisateur) {
    if (utilisateur.dlRatingClient) {
        $("#rating_etoiles_client").show();
        setEtoiles('star1', utilisateur.dlRatingClient);
    }
    if (utilisateur.dlRatingService) {
        $("#rating_etoiles_service").show();
        setEtoiles('star2', utilisateur.dlRatingService);
    }
}

function setEtoiles(nomEtoiles, nbEtoiles) {
    var etoilesSelectionnees = $('input[name="' + nomEtoiles + '"]');
    etoilesSelectionnees.rating('readOnly', false);
    etoilesSelectionnees.rating('select', toInteger(nbEtoiles) - 1);
    etoilesSelectionnees.rating('readOnly', true);
}

function toInteger(number) {
    return Math.round(Number(number));
}

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






