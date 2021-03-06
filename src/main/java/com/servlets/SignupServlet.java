package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SignupServlet
 */

public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		String name,pass,email,mobno;
		name=request.getParameter("name");
		pass=request.getParameter("pass");
		email=request.getParameter("email");
		mobno=request.getParameter("mobno");
		
		System.out.println(name+pass+email+mobno);
		
		try {
			User user=new User(name,pass,email,mobno);
			
			try (Session s = FactoryProvider.getFactory().openSession()) {
                Transaction tx=s.beginTransaction();
                s.save(user);
                tx.commit();
                System.out.println("Done registration");
                
            }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("login.jsp");
		
		
       
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
