
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page 
		import="java.util.*,
				com.entities.*,
				javax.servlet.http.*" 
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>All Notebooks</title>
    
  </head>
  <body class="bg">
  		<%@ include file="base.jsp" %>
    
    <div class="container">
        <%@include file="navbar.jsp" %> 
        
        <%
        	List<NoteBook> noteBooks= (List<NoteBook>)request.getAttribute("noteBooks");
        
        	for(NoteBook noteBook:noteBooks){
        %>
	    
	    <div class="card mt-5">
	        <img src="notes.jpg" class="card-img-top m-2 p-2 mx-auto" alt="note image" style="max-width: 200px">
	        
	        
			  <div class="card-body px-5">
			     
				<h5 class="card-title"><%=noteBook.getTitle()%></h5>
			   
				<div class="container text-center  mt-2 ">
				   
					<a href="/NoteTaker/editNoteBookForm.jsp?noteBookId=<%=noteBook.getId()%>" class="btn btn-primary">Update</a>
			
					<a href="delete?noteBookId=<%=noteBook.getId()%>" class="btn btn-danger">Delete</a>
		
				</div>
			</div>
	       
	                
		</div>
		
		<%} %>
		
	</div>

  </body>
</html>