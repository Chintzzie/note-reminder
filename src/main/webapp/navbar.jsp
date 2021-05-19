<nav class="navbar navbar-expand-md navbar-dark primary-bg">
  <a class="navbar-brand" href="index.jsp">Note Taker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

	
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/NoteTaker/index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <link href="/NoteTaker/css/style.css" rel="stylesheet" type="text/css"/>
      
      <li class="nav-item">
          <a class="nav-link" href="/NoteTaker/NoteBooks/listAll" tabindex="-1" aria-disabled="true">Show noteBooks</a>
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
          		<a class="nav-link" href="/NoteTaker/profile.jsp" tabindex="-1" aria-disabled="true"><%= uname %></a>
      		</li>
      		
      	<li class="nav-item">
          		<a class="nav-link" href="/NoteTaker/NoteBooks/getRemainders?userId=<%=uid %>" tabindex="-1" aria-disabled="true">Get Remainders</a>
      		</li>
      		
      	<li class="nav-item">
          		<a class="nav-link" href="/NoteTaker/logout.jsp" tabindex="-1" aria-disabled="true">Logout</a>
      		</li>
      
      <%}else { %>
            <li class="nav-item">
          		<a class="nav-link" href="/NoteTaker/login.jsp" tabindex="-1" aria-disabled="true">Login</a>
      		</li>
      		<li class="nav-item">
          		<a class="nav-link" href="/NoteTaker/signup.jsp" tabindex="-1" aria-disabled="true">Signup</a>
      		</li>
      
      <%} %>

    </ul>
   
  </div>
</nav>