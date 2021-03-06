<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

<html>
	<head>
		<title>Login</title>
	</head>
	
<body>
 	<%@ include file="base.jsp" %>
 

	<div class="container">
        <%@include file="navbar.jsp" %> 
        
        
        <br>
        <br>
        <form action="LoginServlet" method="post">  
			Name:<input type="text"  name="uname"/><br/><br/>  
			Password:<input type="password" name="pass"/><br/><br/>  
			<input type="submit" value="login"/>  
		</form>

	</div>

</body>
</html>