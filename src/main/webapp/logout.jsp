<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies=request.getCookies();
	  	Cookie cookie;
	  for (int i = 0; i < cookies.length; i++) {
	      cookie = cookies[i];
	      if(cookie.getName().equals("uid") || cookie.getName().equals("uname")){
	    	  cookie.setMaxAge(0);
	    	  response.addCookie(cookie);
	      }
	   }
		response.sendRedirect("login.jsp");
      
      %>

</body>
</html>