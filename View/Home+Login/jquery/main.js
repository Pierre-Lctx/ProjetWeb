// utilisation de JQuery
$(document).ready(function(){

    // Afficher la popup 2 secondes après le load de la page
    $("#login").click(function() {
    $(".box").removeClass("hidden")
    });
          
    // Fermer la popup lorsqu'on appuie ailleurs que sur la popup
    
          $(".box").click(function(e){
            e.stopPropagation();
          });
    
});