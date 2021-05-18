/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.util.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Random;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author ashut
 */
@Entity
@Table(name="notes")
public class Note {    

     
    @Id 
    private int id;
    private String title;
    @Column(length = 2000)
    private String content;
    private int noteBookId;
    private boolean isReminderSet;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date addedDate;
    private Timestamp reminderTS;
 
    
  
    public Note() {
    }
    
    
    
     public Note(String title, String content, Date addedDate,int noteBookId) {
        this.id = new Random().nextInt(10000);
        this.title = title;
        this.content = content;
        this.addedDate = addedDate;
        this.noteBookId = noteBookId;
        this.isReminderSet=false;
        this.reminderTS=Timestamp.valueOf(LocalDateTime.now());
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

    public int getNoteBookId() {
		return noteBookId;
	}

	public void setNoteBookId(int noteBookId) {
		this.noteBookId = noteBookId;
	}
   
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }



	public boolean isReminderSet() {
		return isReminderSet;
	}



	public void setReminderSet(boolean isReminderSet) {
		this.isReminderSet = isReminderSet;
	}



	public Timestamp getReminderTS() {
		return reminderTS;
	}



	public void setReminderTS(Timestamp reminderTS) {
		this.reminderTS = reminderTS;
	}
   
}
