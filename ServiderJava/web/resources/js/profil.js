$(document).ready(function () {
       
        var utilisateur;
    if($.cookie("servider-user-id")){
        $.ajax({
            dataType: "json",
            type: 'Get',
            url: 'getUtilisateur.htm',
            data: {id: $.cookie("servider-user-id")},
            success: function (data) {
                utilisateur = data;
                  $("#lblNom").html(utilisateur.sPrenom+" "+utilisateur.sNom);
                  
                  if (utilisateur.lDescription){
                    $("#lblDescription").html(utilisateur.lDescription);                      
                  }
            },
            error: function (data) {
                console.log("error ajax: ", data);
            }
        });
    }
});



