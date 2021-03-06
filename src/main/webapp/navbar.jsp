<nav class="navbar navbar-expand-md navbar-dark primary-bg">
  <a class="navbar-brand" href="index.jsp">Note Taker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

	
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="add_notes.jsp"> Add note</a>
      </li>
      <link href="css/style.css" rel="stylesheet" type="text/css"/>
      <li class="nav-item">
          <a class="nav-link" href="all_notes.jsp" tabindex="-1" aria-disabled="true">Show notes</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="NoteBooks/listAll" tabindex="-1" aria-disabled="true">Show noteBooks</a>
      </li>
      <%
      	String uid=null;
      	String uname=null;
      	Cookie[] cookies=request.getCookies();
      	Cookie cookie;
      for (int i = 0; i < cookies.length; i++) {
          cookie = cookies[i];
          if(cookie.getName().equals("uid")){
        	  uid=cookie.getValue();
          }else if(cookie.getName().equals("uname")){
        	  uname=cookie.getValue();
          }
       }
      %>
      
      <%if(uid!=null){ %>
      	<li class="nav-item">
          		<a class="nav-link" href="profile.jsp" tabindex="-1" aria-disabled="true"><%= uname %></a>
      		</li>
      		
      	<li class="nav-item">
          		<a class="nav-link" href="logout.jsp" tabindex="-1" aria-disabled="true">Logout</a>
      		</li>
      
      <%}else { %>
            <li class="nav-item">
          		<a class="nav-link" href="login.jsp" tabindex="-1" aria-disabled="true">Login</a>
      		</li>
      		<li class="nav-item">
          		<a class="nav-link" href="signup.jsp" tabindex="-1" aria-disabled="true">Signup</a>
      		</li>
      
      <%} %>

    </ul>
   
  </div>
</nav>