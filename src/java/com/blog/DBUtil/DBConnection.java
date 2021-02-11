/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author vaibh
 */
public class DBConnection {
    
    private  static Connection conn=null;
    
    static {
        try{
        Class.forName("oracle.jdbc.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@//DESKTOP-L6G2U19:1521/xe","blog","JEE");
        }
        catch(ClassNotFoundException cnf)
        {
            cnf.printStackTrace();
        }catch(SQLException sql)
        {
            sql.printStackTrace();
        }
        
        }
    public static Connection getConnection()
    {
        return conn;
    }
    
    public static  void closeConnection()
    {
        try
        {
            if(conn!=null)
            conn.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
