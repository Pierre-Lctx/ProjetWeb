
  ////////////////////////////////////////////////////////////// ::: NAVBAR ///////////////////////////////////////////////////////////////////////////////

jQuery(document).ready(function($) {
    // Votre code ici avec les appels à la fonction $()

    $("#cache").hover(function() {
        $(".employer").removeClass("hidden");
    }, setTimeout(function(){
        $(".employer", "").addClass("hidden");
      }, 3000));

 });

  ////////////////////////////////////////////////////////////// ::: TAGS BOX ///////////////////////////////////////////////////////////////////////////////


 $(function(){ // DOM ready

  
  
    $("#tags input").on({
      focusout : function() {
        var txt = this.value.replace(/[^a-z0-9\+\-\.\#]/ig,''); // allowed characters
        if(txt) $("<span/>", {text:txt.toLowerCase(), insertAfter:this});
        this.value = "";
      },
      keyup : function(ev) {
        // if: comma|enter (delimit more keyCodes with | pipe)
        if(/(188|13)/.test(ev.which)) $(this).focusout(); 
      }
    });
    $('#tags').on('click', 'span', function() {
      if(confirm("Remove "+ $(this).text() +"?")) $(this).remove(); 
    });
  
  });




