<!doctype html>
<html lang="en">

<head>  

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="When writing a meta description">

    <title>Un Pepene Internship</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css"> 
    <link rel="stylesheet" type="text/css" href="css/b-footer2.css">
    <meta name="theme-color" content="#ff0000"/>
    <link rel="manifest" href="manifest.json">
    <link rel="apple-touch-icon" href="/media/icon192.png">
    <meta name="apple-mobile-web-app-status-bar" content="white">
    <script>
 
      if('serviceWorker' in navigator) {
        navigator.serviceWorker.register('sw.js');
      };
    </script> 


</head>

<body>  

  <div class="hero" id="heroHome">
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
      <li><a href="#">Student</a></li>
      <li><a href="profileCandidate.php">My Profile </a> <ion-icon id="profileicon" name="person-circle-outline"></ion-icon></li> 
    </ul>
     
   
    
   
    </nav>

<div class = "middletext">
    <div class="hero-text">
      <h1>Sow the seeds of your future</h1> <br> <br>
      <h2>Find your internship right now</h2>
    </div>

      <div class="search">
        <form meyhod="POST" action="">
          <input class="input" type="text" name="s" placeholder="Job, skills, company, person...">
          <input class="input" type="text" name="s" placeholder="City, area...">
          <button type="submit" class="searchbtn"> Search <i class="fa fa-search"></i></button>
       
      </div>

        <div class="filters">
          <div class="toggle">
            <label for="sel1">Salary :</label>
            <select class="toggle" id="sel1">
              <option>Minimum (600$)</option>
              <option>600 - 1200 </option>
              <option>1200 - 2400</option>
              <option>2400 +</option>
            </select>

            <label for="sel2">Professional Field :</label>
            <select class="toggle" id="sel2">
              <option>Engineering</option>
              <option>Computer Science</option>
              <option>Construction</option>
              <option>Healthcare</option>
            </select>

            <label for="sel3">Duration :</label>
            <select class="toggle" id="sel3">
              <option>1 Day</option>
              <option>1 Month</option>
              <option>2 Months</option>
              <option>1 Year</option>
            </select>
          </div>
        </form>
  
</div>

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
                80 avenue Edmund Halley , 76800 Saint-??tienne-du-Rouvray
                    
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

