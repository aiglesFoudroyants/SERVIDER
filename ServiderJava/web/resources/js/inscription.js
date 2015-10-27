var stateHtml = $("#state")[0].innerHTML;


$( document ).ready(function() {
    $("#state").prop('disabled', true);
    $("#chkService").prop('disabled', true);
    $("#txtCompagnie").hide();
    $("#txtService").hide();
    
    populateComboBoxes();
    bindInscription();
    bindChkCompagnie();
});

function populateComboBoxes(){
    populateCountry();
    bindState();
    populateGenre();
    populateLangue();
}

function populateCountry(){
    $.get("pays.htm",function(data){
        var select = $("#country");
        $(data).find("paysGroup").children("pays").each(function(){
            var pays = {
                id: $(this).children("id"),
                nomFr:$(this).children("nomFr"),
                nomEn:$(this).children("nomEn"),
                abreviation:$(this).children("abreviation")
            };
            select.append('<option value="' + pays.id.text() + '">' 
                    +($("#language  option:selected").val() === "fr" ? pays.nomFr.text() : pays.nomEn.text()) 
                    + '</option>');
        });
    });
}

function populateGenre(){
    $.get("genre.htm",function(data){
        var select = $("#gender");
        $(data).find("genres").children("genre").each(function(){
            var genre = {
                id: $(this).children("id"),
                genreFr:$(this).children("sexeFr"),
                genreEn:$(this).children("sexeEn")
            };
            select.append('<option value="' + genre.id.text() + '">' 
                    +($("#language  option:selected").val() === "fr" ? genre.genreFr.text() : genre.genreEn.text()) 
                    + '</option>');
        });
    });
}

function populateLangue(){
    $.get("langue.htm",function(data){
        var select = $("#preferredLanguage");
        $(data).find("langues").children("langue").each(function(){
            var langue = {
                id: $(this).children("id"),
                langueFr:$(this).children("langueFr"),
                langueEn:$(this).children("langueEn")
            };
            select.append('<option value="' + langue.id.text() + '">' 
                    +($("#language  option:selected").val() === "fr" ? langue.langueFr.text() : langue.langueEn.text()) 
                    + '</option>');
        });
    });
}

function bindState(){
    $("#country").bind('change', function(){
        $.get("province.htm",function(data){
            var select = $("#state");
            var paysId = $("#country  option:selected").val();
            select[0].innerHTML = stateHtml;
            if(paysId === "0"){
                select.prop('disabled', true);
            }
            else{
               select.prop('disabled', false); 
               $(data).find("provinces").children("province").each(function(){
                    var province = {
                        id: $(this).children("id"),
                        paysId: $(this).children("paysId"),
                        nomFr:$(this).children("nomFr"),
                        nomEn:$(this).children("nomEn"),
                        abreviation:$(this).children("abreviation")
                    };
                    if(province.paysId.text() === paysId){
                        select.append('<option value="' + province.id.text() + '">' 
                            +($("#language  option:selected").val() === "fr" ? province.nomFr.text() : province.nomEn.text()) 
                            + '</option>');
                    }
                });
            }
        });
    });
}

function bindInscription(){
    var data;
    $("#btnRegister").bind('click', function(){
        data = {
            paysID: $("#country option:selected").val(), 
            provinceID: $("#state option:selected").val(),
            sexeID: $("#gender option:selected").val(), 
            langueID: $("#preferredLanguage option:selected").val(),
            sNomCompagnie: $("#txtCompagnie").val(), 
            sNom: $("#txtNom").val(),
            sPrenom: $("#txtPrenom").val(), 
            sPassword: $("#txtPassword").val(),
            sCourriel: $("#txtConfirmerPass").val(), 
            sAdresse: $("#txtAdresse").val(),
            sCodePostal: $("#txtCode").val(), 
            sVille: $("#txtVille").val()
        };
        $.post('insertUtilisateur.htm',data).done(function(data){
            alert("Inscription Réussi");
        });
    });
}

function bindChkCompagnie(){
    $("#chkCompagnie").bind('change', function(){
        $("#txtCompagnie").slideToggle();
    });
}
