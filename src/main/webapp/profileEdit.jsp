<%-- 
    Document   : index
    Created on : 21 Aug, 2020, 5:02:08 PM
    Author     : ashut
--%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.User"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
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
    
    		String newuname=null,newmobno=null,newpass=null;
    		newuname=request.getParameter("uname");
    		newmobno=request.getParameter("mobno");
    		
    		newpass=request.getParameter("pass");
    		
  			int userId=Integer.parseInt(uid);
            Session s=FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            User user=s.get(User.class, userId);
            
            if(newpass==null){
            	System.out.println("Updating other");
            	user.setName(newuname);
            	user.setMobno(newmobno);
            }else{
            	System.out.println("Updating pass");
            	user.setPass(newpass);
            }
            
            
            System.out.println("User Profile Updated");
            tx.commit();
            s.close();
            
            response.sendRedirect("index.jsp");
       
  %>
  
  
  

  </body>
</html>