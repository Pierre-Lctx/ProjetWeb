<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/b-footer2.css">
    <title>My Profile</title>
</head>
<body>


    <div class="hero" id="heroProfile">
        <nav id="homenav">
    
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
    </div>    
       
        
       
        </nav>
    
        <div class="hero-textProfile">
          <h1>My Profile </h1> <br> <br>
        </div>

        <div id="profileBoxes">
            
    <div class="boxes" id="infoProfile">
        <div class="picture">
        <img id="employerPic" src="https://cdn-icons-png.flaticon.com/512/40/40323.png" alt="employerPic" />
    </div>

<h2>Edit your profile here</h2>
<p>You can create your company below </p>
<p>Edit your posted offers</p>

    </div>

    <div class="boxes" id="personnalInfo">
        <div id="personnalNav">
            <p>Personnal Information</p>
        </div>

<form id="formEmployerInfo" class="form-inline" method="POST" action="">
        <div id="formPersInfo">
            <ul>
                <div id="row">
        <div class="sub-entry" id="sub-entry1">
                    <label for="firstName">First Name</label>
                    <input id="firstName" class ="postInput" type="text" required/> 

                    <label for="lastName">Last Name</label>
                    <input id="lastName" class ="postInput" type="text" required/> 

                    <label for="birthdate">Birthdate</label>
                    <input id="birthdate" class ="postInput" type="date" required/> 

                    <label for="email">E-mail</label>
                    <input id="email" class ="postInput" type="email" required/> 

                    <label for="phoneNumber">Phone Number</label>
                    <input id="phoneNumber" class ="postInput" type="text" required/> 

                    <label for="password">Change Password ? </label>
                    <input id="password" class ="postInput" type="password" /> 

                    <label for="passwordConfirm">Confirm Password</label>
                    <input id="passwordConfirm" class ="postInput" type="password"/> 

        </div>
<div class="sub-entry">

                    <label for="street">Street</label>
                    <input id="street" class ="postInput" type="text" required/> 

                    <label for="number">Number</label>
                    <input id="number" class ="postInput" type="text" required/> 

                    <label for="complement">Complement</label>
                    <input id="complement" class ="postInput" type="text" /> 



                    <label for="zipcode">Zipcode</label>
                    <input id="zipcode" class ="postInput" type="text" required/> 

                    <label for="town">Town</label>
                    <input id="town" class ="postInput" type="text" required/> 




                </div>




</div>
<div class= "post">
    <input id="postPersInfo" class="postButtons" type="submit" value="Save Informations" ></input>
    <button id="cancelPersInfo"class="postButtons" type="reset" id="Cancel"> Reset</button> 
  </div>
            </ul>

        </div>
    
    </div>

        </div>
      </form>




  <div class="boxes info info2">

    <div id="companyInfo">
        <p>Company Info</p>
    </div>

    

    <form id="formCompanyInfo" class="form-inline" method="POST" action="">
      <div id="formCInfo">
          <ul>
              <div id="row">
      <div class="sub-entry" id="sub-entry1">
                  <label for="compName">Company Name</label>
                  <input id="firstName" class ="postInput" type="text" required/> 

                  <label for="actSector">Activity Sector</label>
                  <input id="actSector" class ="postInput" type="text" required/> 

                  <label for="numInters">Number of interns</label>
                  <input id="numInters" class ="postInput" type="number" required/> 

                  <label for="email">E-mail</label>
                  <input id="email" class ="postInput" type="email" required/> 

                  <label for="phoneNumber">Phone Number</label>
                  <input id="phoneNumber" class ="postInput" type="text" required/> 

                  <label for="trust">Pilot's trust </label>  <br> <br>
                  <label for="trustGood">Good</label>
                  <input name="trust" id="trustGood" type="radio" value="Good" /> 
                  <label for="trustNeutral">Neutral</label>
                  <input name="trust" id="trustNeutral" type="radio" value="Neutral" />
                  <label for="trustBad">Bad</label>
                  <input name="trust" id="trustBad" type="radio" value="Bad" />

      </div>
<div  class="sub-entry">

                  <label for="compStreet">Street</label>
                  <input id="compStreet" class ="postInput" type="text" required/> 

                  <label for="compNumber">Number</label>
                  <input id="compNumber" class ="postInput" type="text" required/> 

                  <label for="compComplement">Complement</label>
                  <input id="compComplement" class ="postInput" type="text" /> 

                  <label for="compZipcode">Zipcode</label>
                  <input id="compZipcode" class ="postInput" type="text" required/> 

                  <label for="compTown">Town</label>
                  <input id="compTown" class ="postInput" type="text" required/> 

                  <p>Have another address ? Click here -> </p> 
                  <input id="showAddress" type="button" value="Add second address">


              </div>

              <div id="addSecondAddress" class="sub-entry address2 hidden">

                <label for="compStreet2">Street</label>
                <input id="compStreet2" class ="postInput" type="text" required/> 

                <label for="compNumber2">Number</label>
                <input id="compNumber2" class ="postInput" type="text" required/> 

                <label for="compComplement2">Complement</label>
                <input id="compComplement2" class ="postInput" type="text" /> 

                <label for="compZipcode2">Zipcode</label>
                <input id="compZipcode2" class ="postInput" type="text" required/> 

                <label for="compTown2">Town</label>
                <input id="compTown2" class ="postInput" type="text" required/> 

                <p>Have another address ? Click here -> </p> <input id="showAddress2"
                type="button"
                value="Add third address">


            </div>


            <div id="addThirdAddress" class="sub-entry address3 hidden">

              <label for="compStreet3">Street</label>
              <input id="compStreet3" class ="postInput" type="text" required/> 

              <label for="compNumber3">Number</label>
              <input id="compNumber3" class ="postInput" type="text" required/> 

              <label for="compComplement3">Complement</label>
              <input id="compComplement3" class ="postInput" type="text" /> 

              <label for="compZipcode3">Zipcode</label>
              <input id="compZipcode3" class ="postInput" type="text" required/> 

              <label for="compTown3">Town</label>
              <input id="compTown3" class ="postInput" type="text" required/> 


          </div>





</div>
<div class= "post">
  <input id="postCompInfo" class="postButtons" type="submit" value="Save Informations"></input>
  <button id="cancelCompInfo"class="postButtons" type="reset"> Reset</button> 
</div>
          </ul>

      </div>
  
  </div>

      </div>
    </form>


</div>

    

<div class="boxes info ">

  <div id="companyInfo">
      <p>Posted Offers</p>
  </div>

<div class="postedOffers">

<div class="postedOfferCard">
  <div class="card">
    <div class="card_image"><img src="https://cdn.webnews.it/QnTWEyYTWDq8ynWxQODvb35dQUM=/2160x1350/smart/https://www.webnews.it/app/uploads/sites/2/2022/03/evento-apple-8-marzo-2022.jpg" alt="img"></div>
    <div class="card_content">
      <h2 class="card_title">Apple - iOS Developper</h2>
      <p class="card_text">We are looking for new talents, come join us !</p>
      <p class="btn card_btn">Edit Offer</p> <p class="btn card_btn">Delete Offer</p><br>
    </div>
  </div>

</div>


</div>



</div>
  
<br> <br> <br> <br>


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
                          <a href="a-home.html">Home</a>
                        </li>
                        
                        <li>
                          <a href="offers.html">Offers</a>
                        </li>
                        
                        <li>
                          <a href="wishlist.html">Wishlist</a>
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
    <script src="jquery/addresses.js"></script>
      <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    
</body>
</html>