<%-- 
    Document   : index
    Created on : 21 Aug, 2020, 5:02:08 PM
    Author     : ashut
--%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
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
   
      	<%@ include file="base.jsp" %>
    <div class="container">
        <%@include file="navbar.jsp" %> 
    </div>
  
    <%
  int noteId=Integer.parseInt(request.getParameter("note_id"));
            Session s=FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            Note note=s.get(Note.class, noteId);
       
  %>
  <div class="container">
      
   <form  id="updateNote" action="UpdateServlet" method="post">
  <div class="form-group">
      <input value="<%=note.getId()%>" name="noteId" type="hidden"/>
    <label for="title">Note Title</label>
    <input name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" required="true"
      value="<%=note.getTitle()%>"/>
   
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
   <textarea name="content" id="content" placeholder="Enter your content here.." class="form-control" style="height: 300px;"
      ><%=note.getContent()%></textarea>
  </div>
 
     
   <div class="container text-center mt-2">
       
       <button type="submit" class="btn " style="background-color: #673ab7;color: white" >Save note</button>
    </div>
  </form>
  </div>
  
  

  </body>
</html>