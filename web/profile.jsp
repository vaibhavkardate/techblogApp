<%-- 
    Document   : profile
    Created on : 27 Dec, 2020, 10:31:15 PM
    Author     : vaibh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entity.Categories"%>
<%@page import="com.blog.service_dao.CategoriesDAO"%>
<%@page import="com.blog.entity.ErrorMessage"%>
<%@page import="com.blog.entity.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="ErrorPage.jsp" %>
<!DOCTYPE html>

<%
    Users users=(Users)session.getAttribute("currentUser");
    if(users==null)
    {
        response.sendRedirect("Login.jsp");
    }
    
ArrayList<Categories> catlist = CategoriesDAO.getAllCategorieses();

    %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <!-- CSS only -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
   <script src="js/likethepost.js" ></script> 
<style>
    
    .banner-back{
     clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 73% 94%, 36% 99%, 0 96%, 0 0);
    }
     body{
        background: url(img/bg.jpeg);
        background-size: cover;
        background-attachment: fixed;
    }
    
</style>
 
    </head>
    <body>
       
        <!--navbar start-->
        
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #2196f3;">
            <a class="navbar-brand" href="profile.jsp"> <span class="fas fa-blog"></span> TECH BLOG</a>
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
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
         
              <a class="dropdown-item" onclick="getPosts(0,this)"   href="#">All Post</a>
            <% for(Categories ci:catlist)
            {
                %>
            <a class="dropdown-item"    href="#"><%=  ci.getName() %></a>
            <%
                }
                %>
         
        </div>
      </li>
     
      
       <li class="nav-item">
           <a class="nav-link " href="#" data-toggle="modal" data-target="#newPostModel" tabindex="-1" aria-disabled="true"><i class="far fa-asterisk"></i>Do Post</a>
      </li>
    </ul>
      
      
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
              <a  href="#!" class="nav-link"  data-toggle="modal" data-target="#profile-model"  ><i class="fas fa-users"></i><%= users.getName() %></a>
              
             
          </li>
          
           <li class="nav-item">
              <a href="LogoutServlet" class="nav-link" ><i class="fas fa-sign-out-alt"></i>LOGOUT</a>
              
              
          </li>

      </ul>
    
      
      
      
  </div>
</nav>
 <!--end of navbar-->
<!--message-->
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
 
 
 
 <!--profile Model-->
 

<!-- Modal -->
<div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title" id="exampleModalLabel">Tech Blog App</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/<%= users.getImage()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px " >
              <br>
              <h5 class="modal-title" id="exampleModalLabel"><%= users.getName()%></h5>
              
              <!--Details-->
              <div id="profile-details">
              <table class="table">
                  <tbody>  
                      <tr>
                          <th>Email :</th>
                          <td><%= users.getEmail() %> </td>
                          
                      </tr>
                       <tr>
                          <th>Gender :</th>
                          <td><%= users.getGender()%> </td>
                          
                      </tr>
                       <tr>
                          <th>About :</th>
                          <td><%= users.getAbout() %> </td>
                          
                      </tr>
                      
                  
                  </tbody>
              </table>
              </div>   
                   
              <!--Profile edit-->            
              <div id="profile-edit" style="display: none">
                  <h4 class="mt-4">Please Edit carefully</h4>  
                  <form method="post" action="EditProfileServlet" enctype="multipart/form-data">
                      <table class="table">
                                <tr>
                                    <td> ID</td>
                                    <td><%= users.getId()%></td>
                                </tr>
                                  <tr>
                                    <td> Email</td>
                                    <td><input type="email" class="form-control"  name="email" value="<%= users.getEmail()%>"> </td>
                                </tr>
                                
                                 <tr>
                                    <td> Name</td>
                                    <td><input type="text" class="form-control"  name="name" value="<%= users.getName()%>"> </td>
                                </tr>
                                
                                
                                 <tr>
                                    <td> Password</td>
                                    <td><input type="password" class="form-control"  name="password" value="<%= users.getPassword()%>"> </td>
                                </tr>
                                
                                  <tr>
                                    <td> Gender</td>
                                    <td>
                                        <input type="text"  class="form-control"  name="optradio" value="<%= users.getGender()%>" >
                                            </td>
                                  </tr>
                               
                                
                                 <tr>
                                    <td> About</td>
                                    <td><input  type="text" class="form-control"  name="about" value="<%= users.getAbout()%>">     </td>
                                </tr>
                              
                                   <tr>
                                    <td>Select Image</td>
                                    <td><input type="file" class="form-control"  name="image"  value="<%= users.getImage()%>" > </td>
                                </tr>
                               
                                
                      </table>
                                <div class="container">
                                    <button class="btn btn-outline-success" >Save</button>
                                </div>
                                
                  </form>
                    
                  
                  
                  
              </div>            
                          
                          
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
 
 
 
 <!-- end of profile Model -->
 
 
 <!--Add post Model-->
 
<!-- Modal -->
<div class="modal fade" id="newPostModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide Post Detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="AddPostServlet" id="postform"  method="post"enctype="multipart/form-data">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>--select Category --</option> 
                      <%
                          
                            
                          for(Categories c:catlist)
                          {
                      %>
                      <option value="<%= c.getCID()%>"><%= c.getName() %></option>
                     
                      <%
                         } 
                       %>   
                  </select>
              </div>
              <div class="form-group">
                  <input type="text" class="form-control" required placeholder="Enter post Title" name="title">
                  
              </div>
               <div class="form-group">
                   <textarea rows="6" class="form-control" required placeholder="Enter main Content" name="content"></textarea>
                  
              </div>
              
        <div class="form-group">
            <textarea  rows="6" class="form-control" required placeholder="Enter Code (if any)" name="code"></textarea>
                  
              </div>
      <div class="form-group">
          <label for="image">Choose Pic</label>
          <br>
          <input id="image"  class="form-control" type="file" name="image"></textarea>
                  
              </div>
                  <div class="text-center">
                       <input type="submit" class="btn btn-outline-info btn-lg">
                      
                  </div>
                 
          </form>
      </div>
     
    </div>
  </div>
</div>
      <!--Main Content-->       
           <!--Main Content-->       
           <main>
               <div class="container">
                   <div class="row">
                       <!--Frist (categories Type)Coloumn-->
                       <div class="col-md-4 mt-4">
                             <div class="list-group">
                                 <a href="#"  onclick="getPosts(0,this)" class="list-group-item list-group-item-action active c-link">All Post </a>
                                  
                                   <%
                                    ArrayList<Categories> arr= CategoriesDAO.getAllCategorieses();
                                     for(Categories c:arr)
                                     {
                                         
                                     
                                   %>
                                   <a href="#"  onclick="getPosts(<%= c.getCID()%>,this)" class="list-group-item list-group-item-action c-link"><%= c.getName() %></a>
                            
                                   <%
                                       }
                                       %>
                             </div> 
                           
                           
                       </div>
                        <!--Secound (Post) Coloumn-->
                        <div class="col-md-8" >
                           <div class="container text-center mt-4" id="loader">
                               <i class="fas fa-sync fa-4x fa-spin text-muted"></i>
                              
                               <h3 class="mt-2 text-muted">Loading..</h3>
                           </div>
                           
                            
                             <div class="container-fluid" id="post_container">
                              
                           </div>
                           
                       </div>
                   </div>
               </div>
           </main>
           <!--End of main Content-->       
                  
 
 
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

 <!--Loading Post With Ajax--> 
    <script type="text/javascript">
   
    function getPosts(catid,temp){
      //  alert("Hello")
        $("#loader").show()
        $("#post_container").hide(),
        $(".c-link").removeClass("active"),
        
         $.ajax({
               url: "PostLoader.jsp",
               data:{cid: catid},
              success: function (data, textStatus, jqXHR) {
                    // console.log(data);   
                     $("#loader").hide()
                      $("#post_container").show()       
                     $("#post_container").html(data),
                     $(temp).addClass('active')
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error")
                    }
           })    
    }
    
    
    
        $(document).ready(function (e){
           
         //   alert("Document loaded")
         let allpostref=$('.c-link')[0]
          getPosts(0,allpostref)
           
        })
</script>


 <!--javascript for editing the profile detail-->
<script>
    $(document).ready(function (){
        let editStatus=false

        $("#edit-profile-btn").click(function (){
            //             alert("button click")
               
        if(editStatus==false)
        {
           
                $("#profile-details").hide()
                $("#profile-edit").show()
                editStatus=true
                $(this).text("Back")
        }
        
        else
        {
            
                $("#profile-details").show()
                $("#profile-edit").hide()
                 editStatus=false
                $(this).text("Edit")
        }
             
        })
       
    })
</script>


<!--javascript for submitting post data-->
<script>
    $(document).ready(function (e){
      //  alert("document loaded succesfully")
        $("#postform").on("submit",function (event){
            event.preventDefault();
            //console.log("posting data");
            let form= new FormData(this);
            $.ajax({
                url: "AddPostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                     //   console.log(data);
                    swal("Good job!", "Post Save Successfully !", "success");
                    $('#newPostModel').modal('hide');
                    
                    },
                 error: function (jqXHR, textStatus, errorThrown) {
                     Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
                footer: '<a href>Why do I have this issue?</a>'
                })
                    },
                    processData:false,
                    contentType: false
            })
        })
    })
    
    
</script>

   


    </body>
</html>
