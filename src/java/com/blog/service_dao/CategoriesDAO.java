/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.service_dao;

import com.blog.DBUtil.DBConnection;
import com.blog.entity.Categories;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author vaibh
 */
public class CategoriesDAO {
 private static Connection conn;
public static ArrayList<Categories> getAllCategorieses()
{
    ArrayList<Categories> categorieses=new ArrayList<>();
   try{
   conn= DBConnection.getConnection();
    Statement st= conn.createStatement();
       ResultSet rs= st.executeQuery("select * from categories");
       while(rs.next())
       {   
          int cid= rs.getInt("CID");
          String name=rs.getString("NAME");
          String desc=rs.getString("DESCRIPTION");
           Categories c=new Categories(cid,name,desc);
           categorieses.add(c);
           
       }
       
       
       
   }catch(Exception e)
   {
       e.printStackTrace();
   }
    
    
    return categorieses;
}






}



