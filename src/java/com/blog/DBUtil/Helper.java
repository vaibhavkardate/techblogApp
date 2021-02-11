/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.DBUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author vaibh
 */
public class Helper {
    
    public static boolean deleteFile(String path)
    {
        try{
            File f=new File(path);
           return  f.delete();
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
    
     public static boolean saveFile(InputStream is, String path)
    {
        try{
           byte[]b= new byte[is.available()];
           is.read(b);
            FileOutputStream f=new FileOutputStream(path);
            f.write(b);
            f.flush();
            f.close();
            return true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
    
    
    
}
