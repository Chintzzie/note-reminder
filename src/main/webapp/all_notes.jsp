<%-- 
    Document   : index
    Created on : 21 Aug, 2020, 5:02:08 PM
    Author     : ashut
--%>

<%@page import="org.hibernate.query.Query"%>
<%@page import="javax.persistence.criteria.Root"%>
<%@page import="javax.persistence.criteria.CriteriaQuery"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.*"%>

<%@page import="org.hibernate.Session"%>
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

    <title>Show Notes</title>
    
    
    
  </head>
  <body class="bg">
  
 	<%@ include file="base.jsp" %>
    <div class="container ">
        <%@include file="navbar.jsp" %> 
        
        <br>
        <a  href="/NoteTaker/NoteBooks/listAll" class="btn btn-info"> Back</a>
        <div  style="text-align:center">
        <a  href="/NoteTaker/add_notes.jsp?noteBookId=<%=request.getParameter("noteBookId")%>" class="btn btn-primary">Add new note</a>
        </div>
   
        <div class="row mx-5 ">
            <div class="col-12 ">
                
                <% 
    
    Session s=FactoryProvider.getFactory().openSession();
 //  Query q= s.createQuery("from Note");
//    List<Note> list=q.list();

// Create CriteriaBuilder
CriteriaBuilder builder = s.getCriteriaBuilder();

// Create CriteriaQuery
CriteriaQuery<Note> crt = builder.createQuery(Note.class);
    
 Root<Note> root = crt.from(Note.class);
   // crt.select(root);
   crt.select(root).where(builder.isNotNull(root.get("content"))).where(builder.equal(root.get("noteBookId"), request.getParameter("noteBookId")));
   crt.orderBy(builder.desc(root.get("addedDate")));
    Query<Note> q = s.createQuery(crt);
   List<Note> list=q.getResultList();
 
    for(Note notes:list){
       // out.println(notes.getId()+":"+notes.getTitle()+":"+notes.getContent()+"<br>");
   

    %>
    
     <% 

	  	String tagClass="" ;
      String tag=notes.getTag();
      
      if(tag.equals("important"))
        tagClass="bg-primary";
      else if(tag.equals("urgent"))
        tagClass="bg-danger";
      else if(tag.equals("info"))
        tagClass="bg-info";  

 	 %>   
    
    <div class="card mt-5 <%=tagClass %>" >
        <img src="notes.jpg" class="card-img-top m-2 p-2 mx-auto" alt="note image" style="max-width: 200px">
        
        <% SimpleDateFormat fmt=new SimpleDateFormat("E dd-MMM,yyyy");
        
          String date=fmt.format(notes.getAddedDate());
        
        %> 
        
    
  <div class="card-body px-5 chints" id="<%= notes.getId() %>">
     
      <p><%=date%></p>
    <h5 class="card-title"><%=notes.getTitle()%></h5>
    <p class="card-text "><%=notes.getContent()%></p>
   
   <div class="container text-center  mt-2 ">
      
    <a href="edit.jsp?note_id=<%=notes.getId()%>" class="btn btn-primary">Update</a>
   
    
      <a href="DeleteServlet?note_id=<%=notes.getId()%>" class="btn btn-danger">Delete</a>
    
   
  </div>
  <form id="updateRemainder" action="/NoteTaker/NoteBooks/updateRemainder" method="post">
                <div class="form-group">
                
                
                    <label for="remainderTS">Remainder Time</label>
                    <input name="remainderTS" type="datetime-local" value=<%= notes.getReminderTS().toString().replace(" ", "T") %> class="form-control" id="remainderTS" aria-describedby="emailHelp" required="true">
					<input hidden name="noteId" type="number"  value =<%= notes.getId() %> class="form-control" id="noteId" aria-describedby="emailHelp" required="true">
                </div>
                
                <% String submitRemainder="set Remainder";
                    		if(notes.isReminderSet())
                    			submitRemainder="Unset Remainder";
                    		
                %>
                
                <div class="container text-center">
                    <button type="submit"  class="btn btn-primary"><%= submitRemainder%>></button>
                </div>
                
            </form>
</div>
    
    
    
    
    
    
    <%
    }
    s.close();
    
   %>
                
                
                
            </div>
        </div>  
        
        
        
    
    
    
        </div>
    
    
  
    </div>
  </body>
</html>