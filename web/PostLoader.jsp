<%@page import="com.blog.entity.Users"%>
<%@page import="com.blog.service_dao.LikesDao"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.service_dao.PostDAO"%>
<%@page import="com.blog.entity.Post"%>
<%@page import="java.util.ArrayList"%>



<div class="row">

<%
    
    Users users=(Users)session.getAttribute("currentUser");
    List<Post> posts=null;
 //Thread.sleep(1000);
  int cid=Integer.parseInt(request.getParameter("cid"));
  if(cid==0){
     posts=PostDAO.getAllPost();
  }
  else
  {
      posts=PostDAO.getAllPostByCID(cid);
  }
  
  if(posts.size()==0)
  {
      out.println("<h3 class='display-3 text-center' >No Post In this Catogories...</h3>");
      return ;
  }
      
    for(Post p:posts)
{
%>
<div class="col-lg-6  col-sm-6 col-md-6 col-12 mt-3">
    <div class="card">
       
        <img src="blog_pics/<%= p.getPIC() %>" style="height: 200px" class="card-img-top  img-thumbnail mh-100  img-fluid"   alt="problem in loading pic">
        <div class="card-header">
          
            <b><%= p.getTITLE() %></b>
        </div>
        
        <div class="card-body">
            <p><%= p.getCONTENT() %></p>
          
            
        </div>
        <div class="card-footer text-center bg-white">
           
<!--     <%
                           int likecount=   LikesDao.countlikebyPostid(p.getPID());
                          
                          %>
                          <a href="#"  onclick="dolike(<%=p.getPID() %>,<%= users.getId()%>)" class="btn btn-outline-info btn-sm "><i class="fa fa-thumbs-up" aria-hidden="true"></i><span class="likecounter"><%= likecount %></span></a>
          -->
         <a href="show_full_blog.jsp?pos_id=<%= p.getPID()%>" class="btn btn-outline-info btn-sm mr-auto">Read More..</a>
         
         <!--<a href="#" class="btn btn-outline-info btn-sm "><i class="fa fa-comment" aria-hidden="true"></i>5</a>-->
        
        </div>    
        
    </div>
</div>

<%
  } 
%>
</div>