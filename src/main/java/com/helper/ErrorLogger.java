package com.helper;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ErrorLogger {
	static String error="errorMessage",success="successMessage";
	static String Msg=error;
	
	public static void log(String errorMsg,String redirectURL ,HttpServletRequest request,HttpServletResponse response,boolean isError) {
		if(!isError) {
			Msg=success;
		}
		
		log(errorMsg, redirectURL, request, response);
		
		Msg=error;
	}
	
	public static void log(String errorMsg,String redirectURL ,HttpServletRequest request,HttpServletResponse response) {
		System.out.println("Logging Msg:"+errorMsg);
		try {
			errorMsg=URLEncoder.encode( errorMsg, "UTF-8" );
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			Cookie c=new Cookie(Msg,errorMsg);
			c.setPath("/");
			response.addCookie(c);
			response.sendRedirect(redirectURL);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void unlog(HttpServletRequest request,HttpServletResponse response) {
		try {
			Cookie[] cookies=request.getCookies();
		  	Cookie cookie;
		  for (int i = 0; i < cookies.length; i++) {
		      cookie = cookies[i];
		      if(cookie.getName().equals("errorMessage") ){
		    	  cookie.setMaxAge(0);
		    	  response.addCookie(cookie);
		      }
		   }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
