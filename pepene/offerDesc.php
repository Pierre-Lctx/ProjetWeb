<?php

include "classes.php";

$recipe = new Offer();

$descdOffer = $recipe->offerDesc();

foreach ($descdOffer as $row)       
{         
  $offer["ID_OFFER"] = $row["ID_OFFER"];         
  $offer["COMPANY_NAME"] = $row["COMPANY_NAME"];         
  $offer["OFFER_NAME"] = $row["OFFER_NAME"];         
  $offer["SKILL_NAME"] = $row["SKILL_NAME"];         
  $offer["MISSION"] = $row["MISSION"];         
  $offer["SALARY"] = $row["SALARY"];         
  $offer["TOWN_NAME"] = $row["TOWN_NAME"];         
  $offer["MIN_DURATION"] = $row["MIN_DURATION"];         
  $offer["MAX_DURATION"] = $row["MAX_DURATION"];  
  $offer["NUMBER_OF_PLACES"] = $row["NUMBER_OF_PLACES"]; 
  $offer["TRUST"] = $row["TRUST"]; 
     }


    ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offers Description</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/b-footer2.css">
</head>
<body>

    <div class="hero" id="heroOfferDesc">
    <nav>
  
        <h2 class="logo">Un Pepene Internship</h2>
  
        <ul>
  
          <li><a href="a-home.php">Home</a></li>
          <li><a href="offers.php">Offers</a></li>
          <li><a href="wishlist.php">Wishlist</a></li>
  
          <li id="deroulant"> <a id="cache" href="#">Employer</a>
          <ul>
            <li ><a class="employer hidden" href="post.php">Post an offer</a></li>
            <li ><a class="employer hidden" href="profileEmployer.php">Profile</a></li>
          </ul>
        </li>
        <li><a href="profileCandidate.php">My Profile </a> <ion-icon id="profileicon" name="person-circle-outline"></ion-icon></li> 
      </ul>
       
      </nav>

    </div>



    <div class="hero-text">
        
        <h1 id="offerCompName"><?php print_r($offer['OFFER_NAME']. ' ' ) ?> - <?php print_r(' '.$offer['COMPANY_NAME'] ) ?></h1>

    </div>


      <div id="offerDesc">
          <h1> Description:</h1>
          <hr class="solid">
      </div>


      <div id="wholeDesc">
<form method="POST" action="">
        <div id="imgOffer">
          <img id="" src="" alt="logo company"/>
        </div>

<div id="Offersname">
  <h2> <?php print_r($offer['OFFER_NAME'] ) ?></h2>
</div>

<div id="companyname">
  <h2><?php print_r($offer['COMPANY_NAME'] ) ?></h2>
  <p></p>
</div>


<div id="requiredskills">
  <h2><?php print_r($offer['SKILL_NAME'] ) ?></h2>
  <p></p>
</div>

<div id="salary">
  <h2><?php print_r($offer['SALARY'].' ') ?>€</h2>
  <p></p>
</div>

<div id="offerdescription">
  <h2>Offer Description</h2>
  <div id="descBox">
      <p><?php print_r($offer['MISSION'] ) ?></p>
    </div>

</div>


<div id="cityLocation">
  <h2>City / Location</h2>
  <p><?php print_r($offer['TOWN_NAME'] ) ?></p>
</div>

<div id="startingdate">
  <h2>Starting date</h2>
  <p><?php print_r($offer['MIN_DURATION'] ) ?></p>
</div>

<div id="endingdate">
  <h2>Ending date</h2>
  <p><?php print_r($offer['MAX_DURATION'] ) ?></p>
</div>

<div id="numberofinterns">
  <h2>Number of Interns</h2>
  <p><?php print_r($offer['NUMBER_OF_PLACES'] ) ?></p>
</div>


<div id="trust">
  <h2>Pilot's Trust</h2>
  <p><?php print_r($offer['TRUST'] ) ?></p>
</div>

<div class= "post">

  <input type="submit" id="Apply" class="postButtons" value="Apply"></input>
  <input class="postButtons" type="button" value="Go back!" onclick="history.back()">
</div>
<br> <br> <br> <br> <br>

</form>
      </div>


  

  <footer>

    <div class="footer">  
    <div id="button"></div>
    <footer1 class="footer1">


          <div class="footer_address">

              <h1 class="footer_logo">UN PEPENE INTERNSHIP</h1>
                  
              <h2>Contact</h2>
              
              <address>
                80 avenue Edmund Halley , 76800 Saint-Étienne-du-Rouvray
                    
                <a class="footer_btn" href="mailto:unpepeneinternship@gmail.com">Email Us</a>
              </address>
          </div>

          <ul class="footer_nav">

              <li class="nav_item">

                  <h2 class="nav_title">Media</h2>

                  <ul class="nav_ul">

                      <li>
                        <a href="#"><ion-icon name="logo-linkedin"></ion-icon> Linkedin

                        </a>
                      </li>

                      <li>
                        <a href="#"><ion-icon name="logo-instagram"></ion-icon> Instagram</a>
                      </li>
                          
                      <li>
                        <a href="#"><ion-icon name="logo-twitter"></ion-icon> Twitter</a> 
                      </li>

                  </ul>

              </li>

              <li class="nav_item">

                  <h2 class="nav_title">Navigation</h2>
                  
                  <ul class="nav_ul">

                    <li>
                      <a href="a-home.php">Home</a>
                    </li>
                    
                    <li>
                      <a href="offers.php">Offers</a>
                    </li>
                    
                    <li>
                      <a href="wishlist.php">Wishlist</a>
                    </li>

                  </ul>
              </li>
              

               <li class="nav_item">

                  <h2 class="nav_title">Legal</h2>
                  
                  <ul class="nav_ul">

                    <li>
                      <a href="#">Privacy Policy</a>
                    </li>

                  </ul>
              </li>
             
          </ul>
            
          <div class="legal">

            <p>&copy; 2022 UN PEPENE INTERNSHIP. All rights reserved.</p>
            
            <div class="legal_links"></div>

          </div>

    <div id="container"></div>
    <div id="cont"></div>
    <div class="footer_center"> </div>
    </footer1>
    </div>
  </footer>

    
  <script src="jquery/jquery.js"></script>
  <script src="jquery/main.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>


</html>