<%-- 
    Document   : index
    Created on : 21 Aug, 2020, 5:02:08 PM
    Author     : ashut
--%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.User"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <title>Edit</title>
  </head>
  <body class="bg">
   
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
    </div>
  
    <%
  			int userId=Integer.parseInt(uid);
            Session s=FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            User user=s.get(User.class, userId);
       
  %>
  <div class="container">
      
   <form  action="profileEdit.jsp" method="post">
  <div class="form-group">
    
    <input value="<%=user.getId()%>" name="userId" type="hidden"/>
    
    <br>
    <label for="title">User Profile</label><br><br>
    UserName:<input type="text" name="uname" value="<%=user.getName()%>"/><br/><br/> 
	Mob:<input type="text" name="mobno" value="<%=user.getMobno()%>"/><br/><br/>  
    
   
  </div>
  
 
     
   <div class="container  mt-2">
       <button type="submit" class="btn " style="background-color: #673ab7;color: white" >Update user profile</button>
       
    </div>
  </form>
  
  <br>
  <br>
	  <div id="changePass">
	  <form  action="profileEdit.jsp" method="post">
		  <div class="form-group">
		    
		    
		    <label for="title">Change Password</label><br><br>
		    New Password:<input type="password" name="pass" /><br/><br/>  
		    
		   
		  </div>
		 
		   <div class="container  mt-2">
		       <button type="submit" class="btn " style="background-color: #673ab7;color: white" >Change Password</button>
		       
		    </div>
		  </form>
	  </div>
  
  
  </div>
  
  </body>
</html>