/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.security.Timestamp;
import java.util.Date;
import java.util.Random;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="users")
public class User {    

     
    @Id 
    private int id;
    private String name,pass,email,mobno;

    public User() {
    }
    
     public User(String name, String pass,String email,String mobno) {
        this.id = new Random().nextInt(10000);
        this.name=name;
        this.pass=pass;
        this.email=email;
        this.mobno=mobno;
    }



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPass() {
		return pass;
	}



	public void setPass(String pass) {
		this.pass = pass;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
    
    
    
   
}
