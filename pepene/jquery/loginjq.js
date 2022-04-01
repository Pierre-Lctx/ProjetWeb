jQuery(document).ready(function($) {
    // Votre code ici avec les appels à la fonction $()

    $("#signUp").click(function() {
        $("#container").addClass("right-panel-active");
    });

    $("#signIn").click(function() {
        $("#container").removeClass("right-panel-active");
    });


 });



// const signUpButton = document.getElementById('signUp');
// const signInButton = document.getElementById('signIn');
// const container = document.getElementById('container');

// signUpButton.addEventListener('click', () => {
// 	container.classList.add("right-panel-active");
// });

// signInButton.addEventListener('click', () => {
// 	container.classList.remove("right-panel-active");
// });