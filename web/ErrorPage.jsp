<%-- 
    Document   : ErrorPage
    Created on : 27 Dec, 2020, 9:25:40 PM
    Author     : vaibh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
   
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
        <div class="container text-center">
            
            <img src="img/error.png" class="img-fluid" > 
            <br>
            <h3 class="display-3">Sorry ! Something Went Wrong</h3>
            
             <%= exception %>
            
            
            <a href="index.jsp" class="btn btn-lg text-white bg-primary mt-5">Home Page </a>
            
        </div>
        
        
        
    </body>
</html>
