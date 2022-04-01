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
        <img id="candidatePic" src="https://fr.fi-group.com/wp-content/uploads/2021/02/blue-icons-set_2-23.png" alt="candidatePicture" />
    </div>

<h2>Edit your profile here</h2>
<p>You can add your skills below </p>
<p>Soft Skills</p>
<p>Hard Skills</p>
<p>Languages</p>

    </div>

    <div class="boxes" id="personnalInfo">
        <div id="personnalNav">
            <p>Personnal Information</p>
        </div>

<form class="form-inline" method="POST" action="">
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

                    <div class="files">
                        <label for="uploadML">Cover Letter : </label>
                        <input type="file"
                         id="uploadML" name="upload"
                         accept="image/png, image/jpeg, image/*,.pdf, .doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                         <label for="uploadML">Resume : </label>
                            <input type="file"
                             id="uploadResume" name="upload"
                             accept="image/png, image/jpeg, image/*,.pdf, .doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                    </div>
                       


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

                    <label for="password">Change Password ? </label>
                    <input id="password" class ="postInput" type="password" /> 

                    <label for="passwordConfirm">Confirm Password</label>
                    <input id="passwordConfirm" class ="postInput" type="password"/> 

<div id="driver">
                    <label for="license">Driver's License : </label>  <br> <br>
                    <label for="licenseYes">Yes</label>
                    <input name="license" id="licenseYes" type="radio" value="Yes" /> 
                    <label for="licenseNo">No</label>
                    <input name="license" id="licenseNo" type="radio" value="No" />


</div>

                </div>

</div>
<div class= "post">
    <input id="postPersInfo" class="postButtons" type="submit" value="Save Informations"></input>
    <button id="cancelPersInfo"class="postButtons" type="reset" id="Cancel"> Reset</button> 
  </div>
            </ul>

        </div>
    </form>
    </div>

        </div>



  <div class="boxes info info2">

    <div id="infoNav">
        <p>Skills</p>
    </div>
    <div class="info">
<form id="formTags" method ="POST" action="">

    <div id="tags">
        <input type="text"  placeholder="Add a skill tag" /> <br>
        <span>php</span>
        <span>c++</span>
        <span>jquery</span>
      
      </div>
  
  </form>
</div>
</div>

<div class="boxes info info2">

  <div id="infoNav">
      <p>Internships completed</p>
  </div>
  <div class="info">
<form id="internships" method ="POST" action="">

  <div id="cardIntern" class="internCompleted">

    <div class="card">
    <div class="card_image"><img src="https://cdn.webnews.it/QnTWEyYTWDq8ynWxQODvb35dQUM=/2160x1350/smart/https://www.webnews.it/app/uploads/sites/2/2022/03/evento-apple-8-marzo-2022.jpg" alt="img"></div>
    <div class="card_content">
      <h2 class="card_title">Apple - iOS Developper</h2>
      <p class="card_text">We are looking for new talents, come join us !</p>
      <p class="btn card_btn">Rate this Offer</p> <br>
      <div class="rate">
        <input type="radio" id="star5" name="rate" value="5" />
        <label for="star5" title="text">5 stars</label>
        <input type="radio" id="star4" name="rate" value="4" />
        <label for="star4" title="text">4 stars</label>
        <input type="radio" id="star3" name="rate" value="3" />
        <label for="star3" title="text">3 stars</label>
        <input type="radio" id="star2" name="rate" value="2" />
        <label for="star2" title="text">2 stars</label>
        <input type="radio" id="star1" name="rate" value="1" />
        <label for="star1" title="text">1 star</label>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="card_image"><img src="https://cdn.webnews.it/QnTWEyYTWDq8ynWxQODvb35dQUM=/2160x1350/smart/https://www.webnews.it/app/uploads/sites/2/2022/03/evento-apple-8-marzo-2022.jpg" alt="img"></div>
    <div class="card_content">
      <h2 class="card_title">Apple - iOS Developper</h2>
      <p class="card_text">We are looking for new talents, come join us !</p>
      <p class="btn card_btn">Rate this Offer</p> <br>
      <div class="rate">
        <input type="radio" id="star5" name="rate" value="5" />
        <label for="star5" title="text">5 stars</label>
        <input type="radio" id="star4" name="rate" value="4" />
        <label for="star4" title="text">4 stars</label>
        <input type="radio" id="star3" name="rate" value="3" />
        <label for="star3" title="text">3 stars</label>
        <input type="radio" id="star2" name="rate" value="2" />
        <label for="star2" title="text">2 stars</label>
        <input type="radio" id="star1" name="rate" value="1" />
        <label for="star1" title="text">1 star</label>
      </div>
    </div>
  </div>



  </div>


</form>
</div>
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
      <script src="jquery/jquery.js"></script>
    <script src="jquery/main.js"></script>
      <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    
</body>
</html>