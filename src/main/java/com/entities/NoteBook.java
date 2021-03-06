package com.entities;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="noteBooks")
public class NoteBook {
	
	@Id 
    private int id;
    private String title;
    private int userId;
    
	public NoteBook(String title, int userId) {
		//super();
		this.id = new Random().nextInt(10000);;
		this.title = title;
		this.userId = userId;
	}

	public NoteBook() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
    

}
