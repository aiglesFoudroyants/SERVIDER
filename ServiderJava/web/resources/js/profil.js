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
                setStatusUtilisateur(utilisateur.statusUtilisateurId)
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






