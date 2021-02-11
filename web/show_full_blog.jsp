<%-- 
    Document   : show_full_blog
    Created on : 1 Jan, 2021, 10:52:27 AM
    Author     : vaibh
--%>




<%@page import="com.blog.service_dao.LikesDao"%>
<%@page import="com.blog.service_dao.UsersDAO"%>
<%@page import="com.blog.service_dao.CategoriesDAO"%>
<%@page import="com.blog.entity.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entity.Users"%>
<%@page import="com.blog.service_dao.PostDAO"%>
<%@page import="com.blog.entity.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<%
    Users users=(Users)session.getAttribute("currentUser");
    if(users==null)
    {
        response.sendRedirect("Login.jsp");
    }

    %>
    
    
<%
  int pid=Integer.parseInt(request.getParameter("pos_id"));

Post  p=PostDAO.getPostByPostId(pid);


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTITLE() %> </title>
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <!-- CSS only -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="s3XKQ1Si"></script>
<script src="js/likethepost.js" ></script> 
<style>
    
    .banner-back{
     clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 73% 94%, 36% 99%, 0 96%, 0 0);
    }
    
    .post-title{
        font-weight: 100;
        font-size: 300%;
    }
    
    .post-content{
        font-weight: 200;
        font-size: 170%;
    }
    
    .createdby{
        font-style:  italic;
        font-size: 20px;
         font-weight: 150;
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
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="contact.jsp"><i class="far fa-address-book"></i>Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
           <% ArrayList<Categories> catlist = CategoriesDAO.getAllCategorieses();
               for(Categories ci:catlist)
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
 
 
 
 <!--Main COntent of Body-->
  <main>
      <div class="container">
          <div class="row my-4">
              <div class="col-md-8 offset-md-3">
                  <div class="card">
                      <div class="card-header  bg-info">
                          
                          <h3 class="post-title"><%=p.getTITLE() %></h3> 
                      </div> 
                     
                      <div class="card-body">
                      <img src="blog_pics/<%= p.getPIC() %>" class="card-img-top  img-thumbnail mh-100 my-4" height="50px" alt="problem in loading pic">
                       <div class=" row border pt-2">
                                <div class="col-md-8">
                                   
                                    <!--for getting data about about user who  posted this post--> 
                                    <%
                                       Users postdoneuser= UsersDAO.getUserByUserId(p.getUserid());
                                        
                                    
                                    %>
                                    
                                    <p class="createdby">Created By :<a href="#!"> <%=postdoneuser.getName() %></a></p>
                                </div>
                                <div class="col-md-4">
                                    <!--creation Date-->
                                </div>
                        </div>
                      
                          
                          <p class="post-content"><%= p.getCONTENT() %></p>
                          <br>
                          <br>
                          <code class="post-code">
                              <%=p.getCODE()%>
                          </code>
                         
                          
                        
                      </div>
                      <div class="card-footer text-center bg-white">
                          <%
                           int likecount=   LikesDao.countlikebyPostid(pid);
                          
                          %>
                          <a   onclick="dolike(<%=p.getPID() %>,<%= users.getId()%>)" class="btn btn-outline-info btn-lg mx-4"><i class="fa fa-thumbs-up" aria-hidden="true"></i><span class="likecounter"><%= likecount %></span></a>
         
                        
         
                        <a href="#comm" class="btn btn-outline-info btn-lg mx-4" ><i class="fa fa-comment" aria-hidden="true"></i></a>
      
                          
                      </div>
                          <div class="card-footer bg-white" id="comm">
                              
                              <div class="fb-comments" data-href="http://localhost:8084/BlogApp/show_full_blog.jsp?pos_id=<%= p.getPID() %>" data-width="" data-numposts="5"></div>
                          </div>
                  </div>
             </div>
          </div>

      </div>                 
     
  </main>

 
 <!--Model-->
 
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
          <form action="AddPostServlet" id="postform"   method="post"enctype="multipart/form-data">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>--select Category --</option> 
                      <%
                         // ArrayList<Categories> catlist = CategoriesDAO.getAllCategorieses();
                            
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
 
 
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    
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
