<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		    <!-- Bootstrap CSS -->
		    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		
		<title>Sign UP!</title>
	</head>
	
<body>
 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>
      
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 

	<div class="container">
        <%@include file="navbar.jsp" %> 
        
        <br>
        <br>
        <form action="SignupServlet" method="post">  
			UserName:<input type="text" name="name"/><br/><br/>  
			Password:<input type="password" name="pass"/><br/><br/> 
			Email:<input type="text" name="email"/><br/><br/>  
			Mob:<input type="text" name="mobno"/><br/><br/>  
			<input type="submit" value="signup!"/>  
		</form>

	</div>

</body>
</html>