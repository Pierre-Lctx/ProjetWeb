<!DOCTYPE html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="When writing a meta description">
<link rel="stylesheet" type="text/css" href="css/login.css">
<title>Login / Sign Up</title>
</head>

<body>
	<a href="a-home.php" id="return"><ion-icon name="arrow-back-outline"></ion-icon> Return</a>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="login.php" method="post">
			<h1>Create an Account</h1> <br>

			<input type="email" name="n_email" placeholder="Email" />
			<input type="password" name="n_password" placeholder="Password" />
			<input type="submit" class="submit" value="Sign Up"/>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="login.php" method="post">
			<h1>Sign in</h1> <br>

			<input type="email" name="E-mail" placeholder="Email" />
			<input type="password" name="Password" placeholder="Password" />
			<a href="#">Forgot your password?</a>
			<input type="submit" class="submit" value="Sign In"/>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Already have an account ?</h1>
				<p>Please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Don't have an account ?</h1>
				<p>Click here to join us !</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

<!-- <script src = 'jquery/login.js'></script> -->
<script src="jquery/jquery.js"></script>
<script src="jquery/loginjq.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


<?php

include "classes.php";

$login= new Connexion();

$login->connecter_site();
$login->inscription_site();

    ?>
</body>
</html>
