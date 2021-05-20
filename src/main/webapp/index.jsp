
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
                 src="https://media0.giphy.com/media/nGtOFccLzujug/giphy.webp?cid=ecf05e4728czwc05wqv3qcs8fcro0yp9qz0379s34807v845&rid=giphy.webp&ct=g">
<!--            <img src="Taking notes-amico.png" alt=""/>-->
<h1 class="text-primary  text-center" style="color: #673ab7!important">
				<% if(uname==null){%>
				Welcome  user!Login and start your note journey!
				<%}else{ %>
				
                Start Taking Your Notes <%= uname  %>!
                
                <div style="text-align:center">
		       		<a class="btn btn-outline-primary text-center my-2 " href="/NoteTaker/createNoteBookForm.jsp">Add noteBook</a>
		        </div>
		        
                <%} %>
            </h1>
            
            <div class="container text-center my-2">
       
       
    </div>
        </div>
    
    
    
    
    </div>
  
  <!--i can use sweet alert and best card effects etc for more effects-->
  
        
        
        
        
  
  </body>
</html>