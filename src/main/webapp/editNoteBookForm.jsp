<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.services.*"%>
<%@page import="com.entities.*"%>

<%
	int noteBookId=Integer.parseInt(request.getParameter("noteBookId"));
	System.out.println("editNoteBookForm: id="+noteBookId);
	NoteBook noteBook=NoteBookService.getNoteBookObject(noteBookId);
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Note Taker : Edit NoteBook</title>
    
   
    
    
    
  </head>
  <body class="bg">
  <%@ include file="base.jsp" %>
    
    <div class="container">
        <%@include file="navbar.jsp" %> 
    
        <br>
        
           <h1>Please change your notebook details</h1>
            <!--forms-->
            <form id="updateNoteBook" action="NoteBooks/edit" method="post">
                <div class="form-group">
                    <label for="title">NoteBook Title</label>
                    <input name="noteBookId" type="number"  hidden value=<%= noteBook.getId() %> >
                    <input name="title" type="text" value="<%=noteBook.getTitle() %>"
                    class="form-control" id="title" aria-describedby="emailHelp" required="true">

                </div>

                <div class="container text-center">
                    <button type="submit"  class="btn btn-primary">Update NoteBook</button>
                </div>
            </form>
    
    </div>
  
  </body>
</html>