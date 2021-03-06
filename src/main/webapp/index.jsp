
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Note Taker : Home Page</title>
    
   
    
    
    
  </head>
  <body class="bg">
  <%@ include file="base.jsp" %>
    
    <div class="container">
        <%@include file="navbar.jsp" %> 
    
        <br>
        
        <div class="card my-4 bg">
            <img class="img-fluid mx-auto mt-3" style="max-width: 450px;z-index:2"
                 src="https://i.ibb.co/pjG01Lf/oie-23103231-Uro9-Ewqw.gif">
<!--            <img src="Taking notes-amico.png" alt=""/>-->
<h1 class="text-primary  text-center" style="color: #673ab7!important">
                Start Taking Your Notes CHints!
            </h1>
            
            <div class="container text-center my-2">
       
       <a class="btn btn-outline-primary text-center my-2 " href="createNoteBookForm.jsp">Start here by adding notebook</a>
        <a class="btn btn-outline-primary text-center my-2 " href="add_notes.jsp">Start here</a>
    </div>
        </div>
    
    
    
    
    </div>
  
  <!--i can use sweet alert and best card effects etc for more effects-->
  
        
        
        
        
  
  </body>
</html>