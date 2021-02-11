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
public class Categories {
                                          
private  int CID;
  private  String Name;
private  String description;  

    public Categories(int CID, String Name, String description) {
        this.CID = CID;
        this.Name = Name;
        this.description = description;
    }

    public Categories(String Name, String description) {
        this.Name = Name;
        this.description = description;
    }

    public Categories() {
    }

    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
