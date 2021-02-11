/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.entity;

/**
 *
 * @author vaibh
 */
public class Post {
    private  int     PID ;  
 private  String TITLE  ;                                        
 private  String CONTENT;                                           
private  String CODE   ;                                          
private  String PIC ;                                               
private  int  CID;
private int userid;

    public Post() {
    }

    public Post(int PID, String TITLE, String CONTENT, String CODE, String PIC, int CID,int userid) {
        this.PID = PID;
        this.TITLE = TITLE;
        this.CONTENT = CONTENT;
        this.CODE = CODE;
        this.PIC = PIC;
        this.CID = CID;
        this.userid=userid;
    }

    public Post(String TITLE, String CONTENT, String CODE, String PIC, int CID,int userid) {
        this.TITLE = TITLE;
        this.CONTENT = CONTENT;
        this.CODE = CODE;
        this.PIC = PIC;
        this.CID = CID;
       this.userid=userid;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    public String getCODE() {
        return CODE;
    }

    public void setCODE(String CODE) {
        this.CODE = CODE;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getPIC() {
        return PIC;
    }

    public void setPIC(String PIC) {
        this.PIC = PIC;
    }

    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }





    
}
