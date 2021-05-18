package com.services;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;
import com.entities.*;
import com.helper.FactoryProvider;


public class NoteBookService {
	static Criteria criteria = null;
    static Criteria criteria1 = null;
	
	static SessionFactory sessionFactory=FactoryProvider.getFactory();
	static Session session=sessionFactory.openSession();
	static Transaction tx;
	

	
	public static void createNoteBook(NoteBook notebook) {
		tx=session.beginTransaction();
		session.save(notebook);
		tx.commit();
	}

	
	public static void updateNoteBook(Integer id, String notebookName) {
		tx=session.beginTransaction();
		NoteBook noteBook = (NoteBook) session.get(NoteBook.class, id);
		noteBook.setTitle(notebookName);
		session.update(noteBook);
		tx.commit();
	}
	
	public static void updateNote(Integer id, Timestamp remainderTS) {
		
		tx=session.beginTransaction();
		
		Note note = (Note) session.get(Note.class, id);
		if(!note.isReminderSet())
			note.setReminderTS(remainderTS);
		note.setReminderSet(!note.isReminderSet());
		
		System.out.println("NBS: "+note.getReminderTS().toString());
	
		session.update(note);
		tx.commit();
		
	}

	
	public static List<NoteBook> listOfNoteBook(int userId) {
		criteria = session.createCriteria(NoteBook.class);
		criteria.add(Restrictions.eq("userId", userId));
		List<NoteBook> list = criteria.list();
		return list;
	}

	
	public static NoteBook getObject(Integer id) {
		criteria = session.createCriteria(NoteBook.class);
		criteria.add(Restrictions.eq("id", id));
		return (NoteBook) criteria.uniqueResult();
	}

	
	public static NoteBook getNoteBookObject(Integer id) {
		criteria = session.createCriteria(NoteBook.class);
		criteria.add(Restrictions.eq("id", id));
		return (NoteBook) criteria.uniqueResult();
	}

	
	public static void deleteNoteBook(int noteBookId) {
		tx=session.beginTransaction();
		session.delete(getNoteBookObject(noteBookId));
		tx.commit();
	}

}
