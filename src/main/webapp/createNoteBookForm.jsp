<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Note Taker : Create NoteBook</title>
    
   
    
    
    
  </head>
  <body class="bg">
  <%@ include file="base.jsp" %>
    
    <div class="container">
    
        <jsp:include page="navbar.jsp" />
    
           <h1>Please fill your notebook details</h1>
            <!--forms-->
            <form id="createNoteBook" action="NoteBooks/new" method="post">
                <div class="form-group">
                    <label for="title">NoteBOok Title</label>
                    <input name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" required="true">

                </div>

                <div class="container text-center">
                    <button type="submit"  class="btn btn-primary">Add NoteBook</button>
                </div>
            </form>
    
    </div>
  
  </body>
</html>