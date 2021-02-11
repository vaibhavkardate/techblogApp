<%-- 
    Document   : SignUp
    Created on : 26 Dec, 2020, 7:50:29 PM
    Author     : vaibh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        
             <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <!-- CSS only -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
   
<style>
    
    .banner-back{
     clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 73% 94%, 36% 99%, 0 96%, 0 0);
    }
    
</style>

    </head>
    <body>
        
        <%@include  file="nav_bar.jsp" %>
        <main class="bg-primary banner-back p-3" style="height:80vh">
             <div class="container">
                 <div class="col-md-6 offset-md-3">
                     <div class="card">
                      
                         <div class="card-header bg-primary text-white text-center">
                             <h2>Register</h2>
		<p class="hint-text">Create your account. It's free and only takes a minute.</p>
       
                             
                         </div> 
                        
                         <div class="card-body">
                             
                             <div class="signup-form">
                                 <form  id="reg-form" action="RegisterServlet" method="post">
                                             <div class="form-group">
                                                    <div class="row">
                                                            <div class="col"><input type="text" class="form-control" name="first_name" placeholder="First Name" required="required"></div>
                                                            <div class="col"><input type="text" class="form-control" name="last_name" placeholder="Last Name" required="required"></div>
                                                    </div>        	
                                    </div>
                                    <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                                    </div>
                                            <div class="form-group">
                                        <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                                    </div>
                                            <div class="form-group">
                                        <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">
                                    </div>        
                                    <div class="form-group">
                                        <label class="form-check-label"><input type="checkbox" name="check" required="required" > I accept the <a href="#!" data-toggle="modal" data-target="#myModal">Terms of Use</a> &amp; <a href="#!"  data-toggle="modal" data-target="#myModal">Privacy Policy</a></label>
                                            </div>
                                     
                                     <div class="text-center " id="loader" style="display: none">
                                         <i class="fas fa-sync-alt fa-3x fa-spin"></i>
                                         <br>
                                         <h4>Please Wait</h4>
                                         
                                     </div>    
                                         
                                     
                                            <div class="form-group">
                                                <button id="submit-btn" type="submit" class="btn btn-info btn-lg btn-block">Register Now</button>
                                    </div>
                                </form>
                                                             <div class="text-center">Already have an account? <a href="Login.jsp">Sign in</a></div>
                            </div>

                             
                         </div>
                        
                         
                     </div>
                 </div>
            </div> 
        </main>
        
         <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">Privacy Heading</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <h3>Some text to enable scrolling..</h3>
          <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
              incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
              commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
             <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

          <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>      
<script>
    $(document).ready(function (){
        
        console.log("document loaded...")
        $('#reg-form').on('submit',function(event){
            event.preventDefault();
            let form=new FormData(this);
            $('#submit-btn').hide();
            $('#loader').show();
            
            
            $.ajax({
                url:"RegisterServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                        console.log(data)
                         $('#submit-btn').show();
                         $('#loader').hide();
                         if(data.trim()=== 'done'){
                         swal("Registrtion Done succesfully. <br> We are  re-directing to Login  Page ")
                            .then((value) => {
                              window.location="Login.jsp"
                        });
                    }else
                    {
                        swal(data)
                    }
            
                    },
                 error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR)
                          $('#submit-btn').show();
                         $('#loader').hide();
                         swal("Error Please input the same password")
            
                    },
                    processData: false,
                    contentType: false
                    
            });
            
            
        });
    });
   
    
</script>

    </body>
</html>
