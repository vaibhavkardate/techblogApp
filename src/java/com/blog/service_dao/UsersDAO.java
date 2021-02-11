/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.service_dao;

import com.blog.DBUtil.DBConnection;
import com.blog.entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author vaibh
 */
public class UsersDAO {
    
    private static  Connection conn=null;
    
    
    //register User
    
    public static boolean saveUsers(Users users)
    {
        try{
        conn=DBConnection.getConnection();
            
            Statement st=conn.createStatement();
            ResultSet rs= st.executeQuery("select max(id) from users");
            
            rs.next();
            int id=rs.getInt(1);
       PreparedStatement ps= conn.prepareStatement("insert into users(ID,name,email,password,IMAGE) values(?,?,?,?,?)");
            ps.setInt(1, id+1);
            ps.setString(2, users.getName());
            ps.setString(3, users.getEmail());
            ps.setString(4, users.getPassword());
             ps.setString(5, "default.jpg");
            int  succ=ps.executeUpdate();
        
            return true;
        
        }catch(Exception e)
        {
            e.printStackTrace();
        }
       return false;       
    }
    
    
    //login User
    
    public static Users getUserName(String email,String Password)
    {
        Users users=null;
        try{
        conn=DBConnection.getConnection();
       PreparedStatement ps= conn.prepareStatement("select * from users where email=? and PASSWORD=?");
                            ps.setString(1, email);
                            ps.setString(2, Password);
                         ResultSet rs=   ps.executeQuery();
       if(rs.next())
       {
           users=new Users();
           users.setId(rs.getInt("ID"));
           users.setEmail(rs.getString("EMAIL"));
           users.setName(rs.getString("NAME"));
           users.setPassword(rs.getString("PASSWORD"));
           users.setGender(rs.getString("GENDER"));
           users.setAbout(rs.getString("about"));
           users.setImage(rs.getString("Image"));
     }
         }catch(Exception e)
        {
            e.printStackTrace();
        }
          return users;
    }
    
    
     public static boolean UpdateUser(Users users)
    {
        try{
        conn=DBConnection.getConnection();
            
           
       PreparedStatement ps= conn.prepareStatement("update users set name=?,email=?,PASSWORD=? ,ABOUT=?,GENDER=?,IMAGE=? where id=?");
           
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getPassword());
             ps.setString(4,users.getAbout());
              ps.setString(5,users.getGender());
              ps.setString(6, users.getImage());
              ps.setInt(7, users.getId());
            int  succ=ps.executeUpdate();
        
            return true;
        
        }catch(Exception e)
        {
            e.printStackTrace();
        }
       return false;       
    }
    
    public static Users getUserByUserId(int uid)
    {
        Users users=null;
        try{
        conn=DBConnection.getConnection();
       PreparedStatement ps= conn.prepareStatement("select * from users where id=? ");
                            ps.setInt(1, uid);
                            
                         ResultSet rs=   ps.executeQuery();
       if(rs.next())
       {
           users=new Users();
           users.setId(rs.getInt("ID"));
           users.setEmail(rs.getString("EMAIL"));
           users.setName(rs.getString("NAME"));
           users.setPassword(rs.getString("PASSWORD"));
           users.setGender(rs.getString("GENDER"));
           users.setAbout(rs.getString("about"));
           users.setImage(rs.getString("Image"));
     }
         }catch(Exception e)
        {
            e.printStackTrace();
        }
          return users;
    }
    
}
