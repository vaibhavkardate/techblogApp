/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.service_dao;

import com.blog.DBUtil.DBConnection;
import com.blog.entity.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vaibh
 */
public class PostDAO {
   private static Connection conn=null;
    public static boolean savePost(Post post)
    {
        
        try {
        
         conn=DBConnection.getConnection();
            
            Statement st=conn.createStatement();
            ResultSet rs= st.executeQuery("select max(pid) from post");
            
            rs.next();
            int id=rs.getInt(1);
            PreparedStatement ps=conn.prepareStatement("insert into post values(?,?,?,?,?,?,?)");
            ps.setInt(1, id+1);
            ps.setString(2, post.getTITLE());
            ps.setString(3,post.getCONTENT());
            ps.setString(4, post.getCODE());
            ps.setString (5,post.getPIC());
            ps.setInt(6, post.getCID());
            ps.setInt(7, post.getUserid());
            ps.executeUpdate();
 return true;
        } catch (Exception e) {
        
        e.printStackTrace();
        }
        
        
        return false;
    }
    

    
    //get ALL POST
    public static List<Post> getAllPost()
    {
     List<Post> post=new ArrayList<>();
        try {
            conn=DBConnection.getConnection();
         PreparedStatement ps=conn.prepareStatement("select * from post order by pid asc ");
                 ResultSet rs=          ps.executeQuery();
            while(rs.next())
            {
                Post p=new Post(rs.getInt("PID"), rs.getString("TITLE"), rs.getString("CONTENT"),rs.getString("CODE"), rs.getString("PIC"),rs.getInt("CID"), rs.getInt("USERID"));
             post.add(p);
            }
        } catch (Exception e) {
        
        e.printStackTrace();
        }
    
    
        return post;
    }

    
      public static List<Post> getAllPostOnLyfrist6()
    {
     List<Post> post=new ArrayList<>();
        try {
            conn=DBConnection.getConnection();
         PreparedStatement ps=conn.prepareStatement("select * from post where rownum <= 6 order by pid desc");
                 ResultSet rs=          ps.executeQuery();
            while(rs.next())
            {
                Post p=new Post(rs.getInt("PID"), rs.getString("TITLE"), rs.getString("CONTENT"),rs.getString("CODE"), rs.getString("PIC"),rs.getInt("CID"), rs.getInt("USERID"));
             post.add(p);
            }
        } catch (Exception e) {
        
        e.printStackTrace();
        }
    
    
        return post;
    }

    
     public static List<Post> getAllPostByCID(int cid)
    {
    List<Post> post=new ArrayList<>();
        try {
            conn=DBConnection.getConnection();
         PreparedStatement ps=conn.prepareStatement("select * from post where cid=? order by pid asc");
         ps.setInt(1, cid);
                 ResultSet rs=          ps.executeQuery();
            while(rs.next())
            {
                Post p=new Post(rs.getInt("PID"), rs.getString("TITLE"), rs.getString("CONTENT"),rs.getString("CODE"), rs.getString("PIC"),rs.getInt("CID"), rs.getInt("USERID"));
             post.add(p);
            }
        } catch (Exception e) {
        
        e.printStackTrace();
        }
    
    
        return post;
    }

     
     
     public static Post getPostByPostId(int pid)
     {
         Post p=null;
         try {
            conn=DBConnection.getConnection();
         PreparedStatement ps=conn.prepareStatement("select * from post where pid=? ");
         ps.setInt(1, pid);
                 ResultSet rs=          ps.executeQuery();
            while(rs.next())
            {
                 p=new Post(rs.getInt("PID"), rs.getString("TITLE"), rs.getString("CONTENT"),rs.getString("CODE"), rs.getString("PIC"),rs.getInt("CID"), rs.getInt("USERID"));
             
            }
        } catch (Exception e) {
        
        e.printStackTrace();
        }
         return p;
     }
}
