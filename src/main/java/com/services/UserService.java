package com.services;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class UserService {
	public static int getLoggedInUserId(HttpServletRequest request) {
		int uid=-1;
		
      	Cookie[] cookies=request.getCookies();
      	Cookie cookie;
      for (int i = 0; i < cookies.length; i++) {
          cookie = cookies[i];
          if(cookie.getName().equals("uid")){
        	  uid=Integer.parseInt(cookie.getValue());
          }
       }
      return uid;
	}
}
