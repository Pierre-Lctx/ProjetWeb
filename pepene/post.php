<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post an Offer</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/b-footer2.css">
</head>
<body>

    <div class="hero" id="heroPost">
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
        <li><a href="profile.php">My Profile </a> <ion-icon id="profileicon" name="person-circle-outline"></ion-icon></li> 
      </ul>
       
      </nav>

    </div>



    <div class="hero-text">
        <h1>Sow the seeds of your company</h1> <br> <br>
        <h2>Find an intern now by posting your offer</h2>
      </div>
      <script src="jquery/jquery.js"></script>
      <script src="jquery/main.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
      <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

      <div id="yourOffer">
          <h1>Your Offer :</h1>
          <hr class="solid">
      </div>

      
      <form id="postOfferForm" method="POST" action="">
<div id="formPOST">
        <ul>
            
                <label>Offer's name</label>
                <input id="offerName"class ="postInput" type="text" required/> <br> <br>

                <label>Company Name</label>
                <input id="companyName" class ="postInput" type="text" required/> <br> <br> 
       
                <label>Job Function</label>
                <input id="jobFunction" class ="postInput" type="text" required/> <br> <br> 

                <label>Required Skill</label>
                <textarea class ="postInput" id="postDesc"name="textarea" cols="40" rows="5" required></textarea>

                <label>Salary</label>
                <input class ="postInput" type="text" required/> <br> <br> 

                <label>City / Location</label>
                <input class ="postInput" type="text" required/> <br> <br> 

                <label>Starting Date</label>
                <input class ="postInput" type="date" id="start" name="trip-start"
                value="2022-01-01"
                min="2022-03-29" max="2023-12-31" required> <br> <br> 


                <label>Ending Date</label>
                <input class ="postInput" type="date" id="start" name="trip-start"
                value="2022-12-31"
                min="2022-12-31" max="2030-12-31" required> <br> <br> 

                <label>Number of interns</label>
                <input class ="postInput" type="number" name="interns"
                 min="1" max="100" required>
               <br> <br> 

                <label>Offer description</label>
                <textarea class ="postInput" id="postDesc"name="textarea" cols="40" rows="5" required></textarea>

                <div class= "post">
                  <p>Import a Logo (png, jpeg)</p>
                  <input type="file"
                  id="upload" name="upload"
                  accept="image/png, image/jpeg">
                  <input id="postOfferButton" class="postButtons" type="submit" value="Post"></input>
                  <button class="postButtons" type="reset" id="Cancel"> Reset</button> 
                </div>

        </ul>

    </div>



      </form>
<br> <br> <br> <br>

</body>

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
                        <a href="https://twitter.com/PepeneCorp"><ion-icon name="logo-twitter"></ion-icon> Twitter</a> 
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