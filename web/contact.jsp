<%-- 
    Document   : contack
    Created on : 10 Jan, 2021, 12:05:41 PM
    Author     : vaibh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page </title>
             <link href="css/contact.css">      
        <script src="https://kit.fontawesome.com/890a382df2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  
         <!--<link href="css/contact.css">-->  
         
         <style>
             body{
                 background: whitesmoke
             }
             
             .card{
                  background: whitesmoke
             }
         </style>
    </head>
    <body>
      <!--navbar-->
      
      
      <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #2196f3;">
    <a class="navbar-brand" href="index.jsp"> <span class="fas fa-blog"></span> TECH BLOG</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="contact.jsp"><i class="far fa-address-book"></i>Contact</a>
      </li>
    
     
    </ul>
      
   
  </div>
</nav>
      
      
      
      
      
      
      
      
      <!--end of navbar-->
        
        
     <div class="container mt-5">
  <div class="contact-section">
    <h2 class="ct-section-head">CONTACT US</h2>
    <div class="row contact-fields">
      <div class="col-md-8 left-form">
          <form method="post" action= "contackservlet">
        <div class="form-group">
          <label class="sr-only" for="fname">First Name *</label>
          <input class="required form-control" id="fname" name="fname" placeholder="First Name&nbsp;*" type="text"  required>
        </div>
        <div class="form-group">
          <label class="sr-only" for="lname">Last Name *</label>
          <input class="required form-control" id="lname" name="lname" placeholder="Last Name&nbsp;*" type="text"  required>
        </div>
        <div class="form-group">
          <label class="sr-only" for="contactEmail">Email *</label>
          <input class="required form-control h5-email" id="contactEmail" name="contactEmail" placeholder="Email&nbsp;*" type="text"  required>
        </div>
        <div class="form-group">
          <label class="sr-only" for="contactPhone">Phone *</label>
          <input class="required form-control h5-phone" id="contactPhone" name="contactPhone" placeholder="Phone&nbsp;*" type="text"  required>
        </div>
        <div class="form-group">
          <label class="sr-only" for="comment" >Type your message here</label>
          <textarea class="required form-control" id="comment" name="comment" placeholder="Type your message here&nbsp;*" rows="6" required></textarea>
        </div>
        <button class="btn btn-outline-success "  type="submit">Submit</button>  
      </form>
    </div>
    <div class="col-md-4 contact-info">
      <div class="phone">
        <h2>Call</h2>
        <a href="tel:+919131479793">+919131479793</a>
      </div>
      <div class="email">
        <h2>Email</h2>
        <a href="mailto:vaibhavpawar789789@gmail.com">vaibhavpawar789789@gmail.com</a>
      </div>
      <div class="location">
        <h2>Visit</h2>
        <p>One Town Center </br>
        166 Anand Nagar </br>
        Bhopal MP </br>
        India, 	462022
        <br>
        <!--<a class="btn btn-accent" href="" target="_blank"><img src="https://www.solodev.com/assets/contact-us-page/map-marker.png" alt="Map Marker">Google Maps</a></p>-->
      </div>
       
    </div>
        
  </div>
</div>
         <footer>
      <div class="page-content page-container border-1 mt-5" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-title text-center ">
                        
                           <h4 class="card-title text-uppercase">Connect to social media </h4>
                    
                    </div>
                    <div class="card-body text-center p-3 ">
                       <a href="https://www.linkedin.com/in/vaibhavkardatejavadeveloper/" target="_blank" class="p-3 fa-2x  "><i class="fab fa-linkedin"></i></a>

                    <a href="https://github.com/vaibhavkardate/" target="_blank" class="p-3 fa-2x "><i class="fab fa-github"  style="color: f08c;"></i></a>

                    <a href="https://www.instagram.com/vah__biav/" target="_blank" class="p-3 fa-2x  "><i class="fab fa-instagram"></i></a>
       </div>
                </div>
            </div>
        </div>
    </div>
</div>
             
         </footer>
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
   
     </body>
</html>
