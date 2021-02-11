<%-- 
    Document   : Login
    Created on : 26 Dec, 2020, 1:02:55 PM
    Author     : vaibh
--%>

<%@page import="com.blog.entity.ErrorMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
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
        
        <!--navbarr-->
        
        <%@include file="nav_bar.jsp" %>
        
        <main class="d-flex align-items-center bg-primary banner-back" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 offset-md-4">
                        <div class="card">
                            <div class="card-header  bg-primary text-white text-center">
                                <i class="fas fa-sign-in-alt fa-3x "></i> <br> Login Here 
                                
                            </div>
                            
                            <%  
                               ErrorMessage em= (ErrorMessage) session.getAttribute("error");
                               if(em!=null){
                            %>
                            <div class="alert  <%= em.getCssClass() %>" role="alert">
                            
                             <%= em.getContent() %>
                             
                            </div>
                            <%
                                session.removeAttribute("error");
                               } 
                             %>   
                            
                            <div class="card-body">
                                
                                <form  action="LoginServlet" method="POST">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input type="email" required="true" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input type="password" required="true" name="pass" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="form-group form-check">
                                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1">Remember Me</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                                    
                                    <div class="text-center  mt-4 " >  New To the Site <a href="SignUp.jsp" class="deco-none" >  Click here to register </a></div>
                                </form>       
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
        </div>
        
        </main>
            
      
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    </body>
</html>
