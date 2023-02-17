<%@page import="com.model.Employee"%>
<%
Employee login_emp2 = (Employee) session.getAttribute("login_user");
%>
<nav class="navbar navbar-expand-lg sticky-top" style="background: transparent;">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#">Web-Interview</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
      <%
      if(login_emp2==null){
    	  %>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active text-white" aria-current="page" href="admin_login.jsp">(Author: Shubham Lohar)</a>
	        </li>
			<li class="nav-item">
				<a class="nav-link active text-white" aria-current="page" href="index.jsp">Home</a>
			  </li>
	      </ul>
			      <form class="d-flex" role="search">
			        <a class="btn btn-outline-warning me-2" data-bs-toggle="modal" data-bs-target="#exampleModal" style="font-weight: bold;">Register</a>
			        <a class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal1" style="font-weight: bold;">Login</a>
			      </form>
	    </div>
    	  <%
      }
      else{
    	  %>
    	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="Welcome.jsp">Home</a>
        </li>
        <% String success = (String) session.getAttribute("success");
			if(success!=null){
				%>
				 <li class="nav-item">
          <a class="nav-link active text-success" aria-current="page" href="Welcome.jsp">
          Your registration has been successfully completed.</a>
        </li>
				<%
			}
			session.removeAttribute("success");
		%>
      </ul>
	      <form action="logoutController" method="post" class="d-flex">
			  <a class="nav-link active text-white me-3">
			    <%= login_emp2.getEmpEmail() %>
			  </a>
			     <button class="dropdown-item text-white" type="submit" 
	       			 style="font-weight: bold;">Logout</button>
	      </form>
	   </div>
	  <%
      }
      %>
  </div>
</nav>