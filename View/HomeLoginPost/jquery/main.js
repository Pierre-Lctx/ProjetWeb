jQuery(document).ready(function($) {
    // Votre code ici avec les appels à la fonction $()

    $("#cache").hover(function() {
        $(".employer").removeClass("hidden");
    }, setTimeout(function(){
        $(".employer", "").addClass("hidden");
      }, 3000));


 });