/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $.ajax({
        dataType: "text",
        type: 'Get',
        contentType: 'text/html; charset=UTF-8',
        url: 'typesServices.htm',
        data: {entree: "", langue: $("#language option:selected").val()},
        success: function (data) {
            var select = $("#typeDeService");
            data = $("<textarea/>").html(data).text();
            data = data.split(",");
            var i = 1;
            data.forEach(function (typeService) {
                select.append('<option value="' + i + '">' + typeService + '</option>');
                i++;
            });
        },
        error: function (data) {
            console.log("error");
        }
    });
    $("#buttonPublishOffer").bind("click", function (e) {
        if ($.cookie("servider-user-id")) {
            var annonce = {
                utilisateurID: $.cookie("servider-user-id"),
                bActif: true,
                sDescription: $("#txtDescription").val().trim(),
                sTarif: $("#txtPrix").val().trim(),
                sAddresse: $("#txtAddres").val().trim()
            };
            console.log(" houra  "+annonce.utilisateurID);
            console.log(" id service " + $("#typeDeService option:selected").val());
            $.ajax({
                dataType: "text",
                type: 'Get',
                contentType: 'text/html; charset=UTF-8',
                url: 'insertOffer.htm',
                data: {sAnnonce: JSON.stringify(annonce), idTypeServiceString: $("#typeDeService option:selected").val(), userId: annonce.utilisateurID},
               
                success: function (data) {
                    alert("insertion reussie");
                    window.location = "index.htm";
                },
                error: function (data) {
                    alert("erreur");
                }
            }
            );
        } else {
            alert("vous devez être connecter pour publier un annonce");
        }

    });
});



