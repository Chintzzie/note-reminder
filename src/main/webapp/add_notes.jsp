<%-- 
    Document   : index
    Created on : 21 Aug, 2020, 5:02:08 PM
    Author     : ashut
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>add-notes</title>
    </head>
    <body class="bg">
        <!-- Optional JavaScript -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

        <div class="container">
            <%@include file="navbar.jsp" %> 
            <br>


            <h1>Please fill your note details</h1>
            <!--forms-->
            <form id="addNote" action="SaveNoteServlet" method="post">
                <div class="form-group">
                    <label for="title">Note Title</label>
                    <input name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" required="true">

                </div>
                <div class="form-group">
                    <label for="content">Note Content</label>
                    <textarea name="content" id="content" placeholder="Enter your content here.." class="form-control" style="height: 300px;"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="tag">Note TAG</label>
                    <select name="tag">
                    	<option value="important">Important</option>
                    	<option value="urgent">Urgent</option>
                    	<option value="info">Info</option>
                    </select>
                
                </div>
                
                
                
                <textarea name="noteBookId" id="noteBookId"  hidden placeholder="Enter your noteBookId here.." class="form-control"  style="height: 300px;"><%= request.getParameter("noteBookId") %></textarea>

                <div class="container text-center">
                    <button type="submit"  class="btn btn-primary">Add Note</button>
                </div>
            </form>

        </div>



        



    </body>
</html>