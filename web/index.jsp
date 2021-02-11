<%-- 
    Document   : index
    Created on : 12 Dec, 2020, 6:08:17 PM
    Author     : vaibh
--%>

<%@page import="java.util.List"%>
<%@page import="com.blog.entity.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.service_dao.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
      <%@include file="nav_bar.jsp" %>
      <div class="container-fluid p-0 m-0">
          <div class="jumbotron bg-info text-white  banner-back">
              <div class="container">
                  <h3 class="display-3">Welcome to Tech Blog App</h3>
                  <p>Computer programming is the process of designing and building an executable computer program to accomplish a 
                      specific computing result or to perform a specific task. Programming involves tasks such as: analysis, generating algorithms,
                      profiling algorithms' accuracy and resource consumption, and the implementation of algorithms in a chosen
                      programming language (commonly referred to as coding).</p>
                  
                  <a  href="SignUp.jsp" class="btn btn-outline-light btn-lg"><i class="fas fa-user-plus"></i> Start for free</a>
                  <a href="Login.jsp" class="btn btn-outline-light btn-lg"><i class="fas fa-sign-in-alt "></i> Login</a>
                  </div>
          </div>   
      </div>
      
      <!--cards-->
      
      
      <% 
          
          List<Post>  allpost =PostDAO.getAllPostOnLyfrist6(); 
      
      %>
      
      <div class="container">
          <div class="row mb-5">
              <%   for(Post p:allpost){ %> 
              <div class="col-md-4 col-sm-12"> 
                
              <div class="card" style="width: 18rem; height: 200px">
                
                     <div class="card-body">
                    <h5 class="card-title"><%= p.getTITLE() %> </h5>
                    <p class="card-text"><%= p.getCONTENT() %> </p>
                    <a href="show_full_blog.jsp?pos_id=<%= p.getPID() %>" class="btn btn-outline-info text-dark mt-3">Read More..</a>
                  </div>
             </div>
                  
                
             </div>   
              <% } %>  
              
           
              
          </div>
      </div>
    
  
      
      
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

</body>
</html>
