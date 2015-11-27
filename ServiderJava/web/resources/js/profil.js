$(document).ready(function () {

    var utilisateur;
    var commentaires;
    var htmlCommentaire = '<div class="row col-xs-12 commentaire">';
    htmlCommentaire += '<div class="media-photo-badge col-xs-2 " >';
    htmlCommentaire += '<img  class="circular-profil-image-comment" alt="shared.user_profile_image" data-pin-nopin="true" src="resources/img/team/team-member-1.jpg" title="image du profil" >';
    htmlCommentaire += '<p id="commentaireNom"></p>';
    htmlCommentaire += '</div> ';
    htmlCommentaire += '<div class="media-photo-badge col-xs-10 col-xs-push-2 col-sm-push-0" >';
    htmlCommentaire += '<p id="commentaireContenu"></p>';
    htmlCommentaire += '</div> ';
    htmlCommentaire += '</div>';
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
                setStatusUtilisateur(utilisateur.statusUtilisateurId)
            },
            error: function (data) {
                console.log("error ajax: ", data);
            }
        });
        $.ajax({
            dataType: "json",
            type: 'Get',
            url: 'getCommentaires.htm',
            data: {id: $.cookie("servider-user-id"), serviceOrClient: "service"},
            success: function (data) {
                commentaires = data;
                console.log("commentaires :", data);
                var blocCommentaires = $("#commentaires");
                commentaires.forEach(function () {
                    blocCommentaires.append(htmlCommentaire);
                });
                var compteur = 0;
                blocCommentaires.children(".commentaire").each(function () {
                    $(this).find("#commentaireNom").html(commentaires[compteur].sPrenom + " " + commentaires[compteur].sNom);
                    $(this).find("#commentaireContenu").html(commentaires[compteur].lCommentaire);
                    compteur++;
                });
            },
            error: function (data) {
                console.log("error ajax: ", data);
            }
        });
    }
});
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






