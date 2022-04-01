<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wish-List</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/b-footer2.css">
</head>
<body>

  <?php
    $servername = 'localhost';
    $username = 'root';
    $password = '';

    //On essaie de se connecter
    try{
      $conn = new PDO("mysql:host=$servername;dbname=projetweb", $username, $password);
      //On définit le mode d'erreur de PDO sur Exception
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $query = $conn->prepare("SELECT user.ID_USER FROM user WHERE user.email = '" . $_COOKIE['E-mail'] . "' LIMIT 1");
      $query->execute();

      $data = $query->fetchAll(PDO::FETCH_BOTH);

      foreach ($data as $row)
      {
        $idPerson["ID_USER"] = $row["ID_USER"];
      }

      
      

      $queryNumber = $conn->prepare("SELECT COUNT(ID_USER) as NUMBER FROM `whishlist` where ID_USER = " . intval($idPerson['ID_USER'], 10));
      $queryNumber->execute();

      $data1 = $queryNumber->fetchAll(PDO::FETCH_BOTH);

        foreach ($data1 as $row)
        {
          $number["NUMBER"] = $row['NUMBER'];
        }

      $queryWish = $conn->prepare("SELECT final_offer.COMPANY_NAME, final_offer.OFFER_NAME, final_offer.MISSION from whishlist inner join final_offer on final_offer.ID_OFFER = whishlist.ID_OFFER where whishlist.ID_USER = " . intval($idPerson['ID_USER'], 10));
      $queryWish->execute();

      $data2 = $queryWish->fetchAll();

      
    }

    catch(PDOException $e){
      echo "Erreur : " . $e->getMessage();
    }

  
    
  ?>

    <div class="hero" id="heroWishlist">
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
        
        <h1>✨ Your favorite offers ✨</h1>
      </div>
      <script src="jquery/jquery.js"></script>
      <script src="jquery/main.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
      <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

      <div id="yourOffer">
          <h1> Wish-list :</h1>
          <hr class="solid">
      </div>

      <div class="cardwishlist"></div>
      <div class="cardwishlist"></div>
      <div class="cardwishlist"></div>
      <div class="cardwishlist"></div>
      
      <div class="main">

      <ul class="cards">
        <?php

        foreach ($data2 as $row)
        {
          $wish["COMPANY_NAME"] = $row["COMPANY_NAME"];
          $wish["OFFER_NAME"] = $row["OFFER_NAME"];
          $wish["MISSION"] = $row["MISSION"];
          
          
        
        ?>
        <li class="cards_item">
          <div class="card">
            <div class="card_image"><button class="favorite-button"><ion-icon class="addFavorites" name="star-outline"></ion-icon> Add to wishlist</button><img src="https://cdn.webnews.it/QnTWEyYTWDq8ynWxQODvb35dQUM=/2160x1350/smart/https://www.webnews.it/app/uploads/sites/2/2022/03/evento-apple-8-marzo-2022.jpg"></div>
            <div class="card_content">
              <h2 class="card_title">
                <?php 
                  echo $wish['COMPANY_NAME'];
                  echo(" - "); 
                  echo($wish['OFFER_NAME']); 
                ?>
              </h2>
              <p class="card_text"><?php echo($wish['MISSION']); ?></p>
              <button onclick="window.location.href='offerDesc.php';" class="btn card_btn">Read More</button>
            </div>
          </div>
        </li>
        <?php
        }
        ?>
      </ul>
    </div>

      

</body>

<footer>


    <div class="pagination"> 
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
    </div>

    <br> <br>
    <br> <br>

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

</html>