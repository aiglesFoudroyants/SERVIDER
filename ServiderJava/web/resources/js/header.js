$(document).ready(function () {
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
});