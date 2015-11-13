

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
                if(utilisateur.sCheminImgProfile){
                    $("#imgUser,#imgUserMobile").attr("src", utilisateur.sCheminImgProfile);
                }
            },
            error: function (data) {
                console.log("error ajax: ", data);
            }
        });
    }
    
    $("#btnLogin").bind("click", function () {
        $.get("login.htm", {email: $("#txtEmail").val(), password: $("#txtPass").val()}).done(function(data){
           if (data !== "-1"){
               $.cookie("servider-user-id", data);
               location.reload();
               //alert($("#loginValide").text());
           } else {
               alert($("#loginInvalide").text());               
           }
        });
    });
    
    $("#btnDisconnect,#btnDisconnectMobile").bind("click", function(){
        $.removeCookie('servider-user-id');
        location.reload();
    });
});