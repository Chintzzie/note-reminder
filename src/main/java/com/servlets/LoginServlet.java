package com.servlets;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.persistence.criteria.*;
import org.hibernate.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.*;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    public void loginUser(String uname,String id,HttpServletResponse response) throws Exception {
    	
    	System.out.println("ID:"+id);
    	Cookie cuid=new Cookie("uid",id);
    	Cookie cuname=new Cookie("uname",uname);
    	
    	response.addCookie(cuid);
    	response.addCookie(cuname);
    	
    	response.sendRedirect("index.jsp");
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name,pass;
		name=request.getParameter("uname");
		pass=request.getParameter("pass");
		
		System.out.println(name+","+pass);
		
        Session s=FactoryProvider.getFactory().openSession();
        
        /*CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> crt = builder.createQuery(User.class);
        Root<User> root = crt.from(User.class);
        crt.select(root).where(builder.isNotNull(root.get("content")));
        //crt.orderBy(builder.desc(root.get("addedDate")));
        Query<User> q = s.createQuery(crt);
        List<User> list=q.getResultList();*/
        
        Query qry = s.createQuery("select name,pass,id from User where name='"+name+"'");

		List l =qry.list();
		System.out.println("Total Number Of Records : "+l.size());
		Iterator it = l.iterator();
		

		while(it.hasNext())
		{
			Object o[] = (Object[])it.next();

			String actualPass=String.valueOf(o[1]);
			String uname=String.valueOf(o[0]);
			
			if (actualPass.equals(pass)) {
				System.out.println("Login Success");
				this.loginUser(uname,String.valueOf(o[2]),response);
				return;
				
			}
			else {
				System.out.println("Login Fail");
				ErrorLogger.log("Login Failed because incorrect password!","login.jsp", request,response);
			}
			return;
		}
		
		System.out.println("Invalid Username");
		ErrorLogger.log("Login Failed because invalid username","login.jsp", request,response);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
