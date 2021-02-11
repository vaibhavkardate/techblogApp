/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.service_dao;

import com.blog.DBUtil.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author vaibh
 */
public class LikesDao {
    
   private static Connection conn=null ;
    
    public static boolean insertlikewithpiduid(int pid,int uid)
    {
        try {
               conn=DBConnection.getConnection();
             Statement st=conn.createStatement();
            ResultSet rs= st.executeQuery("select max(lid) from likes");
                rs.next();
            int id=rs.getInt(1);
          PreparedStatement ps=conn.prepareStatement("insert into likes values(?,?,?)");
            ps.setInt(1, id+1);
            ps.setInt(2, pid);
            ps.setInt(3, uid);
           int q= ps.executeUpdate();
           if(q>0)
           return true;
        } catch (Exception e) {
        e.printStackTrace();
        }
       
        return false;
    }
    
    
    public static int countlikebyPostid(int pid)
    {
        int count=0;
        try{
             conn=DBConnection.getConnection();
            PreparedStatement ps=conn.prepareStatement("select count(*) from likes where pid=?");
            ps.setInt(1, pid);
           ResultSet rs= ps.executeQuery();
            rs.next();
          count=  rs.getInt(1);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
                
    return count;
    }
    
    public static boolean islikePostbyUser(int pid,int uid)
    {
        boolean f=false;
        try {
             conn=DBConnection.getConnection();
              PreparedStatement ps=conn.prepareStatement("select * from likes where pid=? and userid=?");
         
            ps.setInt(1, pid);
            ps.setInt(2, uid);
        ResultSet rs=    ps.executeQuery();
            if(rs.next())
            {
                f=true;
            }
          
        } catch (Exception e) {
        }
        return f;
    }
    
        public static boolean dislike(int pid,int uid) {
            boolean f=false;
        try {
             conn=DBConnection.getConnection();
              PreparedStatement ps=conn.prepareStatement("delete from likes where pid=? and userid=?");
         
            ps.setInt(1, pid);
            ps.setInt(2, uid);
        int  rs=    ps.executeUpdate();
            if(rs>0)
            {
                f=true;
            }
          
        } catch (Exception e) {
        }
        return f;
        
    }

}
