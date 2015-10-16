$( document ).ready(function() {
    var stateHtml = $("#state")[0].innerHTML;
    $("#state").prop('disabled', true);
    
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
});

