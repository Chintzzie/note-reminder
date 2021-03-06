package com.servlets;

import java.io.IOException;
import java.util.List;

import com.entities.*;
import com.services.*;
import com.helper.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class createNoteBookServlet
 */
@WebServlet(value = "/NoteBooks/*") 
public class NoteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void  doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(request.getContextPath()+","+request.getPathInfo());
		String path=request.getPathInfo();
		
		switch(path) {
			case "/new":	this.createNoteBook(request, response);break;
			case "/listAll":this.getAllNoteBooks(request, response);break;
			case "/edit":	this.editNoteBook(request, response);break;
			case "/delete": this.deleteNoteBook(request, response);break;
			
			
			default: 
				ErrorLogger.log("Invalid Url entry for Notebooks Servlet", "/NoteTaker/index.jsp", request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void createNoteBook(HttpServletRequest request, HttpServletResponse response) {
		
		String title=request.getParameter("title");
		
		try {
		
		int uid=UserService.getLoggedInUserId(request);
      
		
		NoteBook noteBook=new NoteBook(title,uid);
		NoteBookService.createNoteBook(noteBook);
		ErrorLogger.log("NoteBook created!", "/NoteTaker/index.jsp", request, response);
		
		}catch(Exception e) {
			ErrorLogger.log(e.getMessage(), "/NoteTaker/index.jsp", request, response,false);
		}
	}
	
	protected void getAllNoteBooks(HttpServletRequest request, HttpServletResponse response) {
		int uid=UserService.getLoggedInUserId(request);
		
		List<NoteBook> noteBooks=NoteBookService.listOfNoteBook(uid);
		
		request.setAttribute("noteBooks", noteBooks);
		try {
			System.out.println("Forwarding to getNotebOOks");
			request.getRequestDispatcher("/getNoteBooks.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void editNoteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int noteBookId=Integer.parseInt(request.getParameter("noteBookId"));
		String title=request.getParameter("title");
		
		try {
			NoteBookService.updateNoteBook(noteBookId, title);
			ErrorLogger.log("NoteBook Updated!", "listAll", request, response,false);
		}catch(Exception e) {
			System.out.println("Exception"+e.getMessage());
			ErrorLogger.log(e.getMessage(), "listAll", request, response);
		}
		
		
		
	}
	
	protected void deleteNoteBook(HttpServletRequest request, HttpServletResponse response) {
		int noteBookId=Integer.parseInt(request.getParameter("noteBookId"));
		try {
			NoteBookService.deleteNoteBook(noteBookId);
			ErrorLogger.log("NoteBook deleted!", "listAll", request, response,false);
		}catch(Exception e) {
			System.out.println("Exception"+e.getMessage());
			ErrorLogger.log(e.getMessage(), "listAll", request, response);
		}
	}
}
