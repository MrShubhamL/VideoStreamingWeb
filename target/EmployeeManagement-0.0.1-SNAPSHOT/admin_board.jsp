<%@page import="com.model.Videos"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.repo.VideoRepo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Videos</title>
<link rel="icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/512/6491/6491579.png">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link href="style.css" rel="stylesheet">
</head>
<body>
<%
Employee login_emp3 = (Employee) session.getAttribute("login_user");
if(login_emp3==null){
	response.sendRedirect("admin_login.jsp");
}
%>
<div class="container-fluid bgImg">
	<div class="row">
		<%@include file="Navbar.jsp"%>
		<%
				String success = (String) session.getAttribute("upload_successfull");
				String failed = (String) session.getAttribute("upload_error");
				String success1 = (String) session.getAttribute("update_successfull");
				String failed1 = (String) session.getAttribute("update_error");
				if (success != null) {
				%>
				<h5 class="text-success">Video Successfully Uploaded.</h5>
				<%
				}
				session.removeAttribute("upload_successfull");
				if (failed != null) {
					%>
					<h5 class="text-danger">Video Not Uploaded!</h5>
					<%
				}
				session.removeAttribute("upload_error");
				
				if (success1 != null) {
					%>
					<h5 class="text-success">Video Successfully Updated.</h5>
					<%
					}
					session.removeAttribute("update_successfull");
					if (failed1 != null) {
						%>
						<h5 class="text-danger">Video Not Updated!</h5>
						<%
					}
					session.removeAttribute("update_error");
				
		%>
			<div class="col-lg-6 offset-lg-3">
				<h3 class="text-white">Upload Video</h3>
				<form action="upload_video" method="post" >
				
		    	<div class="col-lg-12 mt-2">
		    		<input class="form-control" type="text" name="v_name" placeholder="Enter Video Title">
		    	</div>
		    	
		    	<div class="col-lg-12 mt-2">
		    		<input class="form-control" type="text" name="v_desc" placeholder="Enter Video Description">
		    	</div>
		    	
		    	<div class="col-lg-12 mt-2">
		    		<input class="form-control" type="text" name="v_url" placeholder="Enter Video URL">
		    	</div>
		    	
		 

		    	<div class="col-lg-12 mt-2">
		    		<button class="btn btn-outline-primary" type="submit">Upload Now</button>
		    		<button class="btn btn-outline-secondary" type="reset">Reset</button>
		    	</div>
		    </form>
			</div>
			
			
			
			<div class="col-lg-12 mt-3">
			<h3 class="text-white">All Uploaded Videos</h3>
				<table class="table table-bordered text-white">
				  <thead>
				    <tr>
				      <th scope="col">Sr.No</th>
				      <th scope="col">Video Title</th>
				      <th scope="col">Video Description</th>
				      <th scope="col">Upload Date</th>
				      <th scope="col">Video URL</th>
				      <th scope="col">Action</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				  <%
				  try{
				  	VideoRepo vip = new VideoRepo(DBConnection.getConnection());
					List<Videos> vid = vip.allVideos();
					int id=1;
					for(Videos v:vid){
						%>
						<tr>
					      <th scope="row"><%=id%></th>
					      <td><%= v.getVideo_name() %></td>
					      <td><%= v.getVideo_description() %></td>
					      <td><%= v.getVideo_upload_date() %></td>
					      <td><%= v.getVideo_url() %></td>
					      <td>
					      	<a href="update_video.jsp?id=<%= v.getId() %>" class="btn btn-outline-warning btn-sm">Update</a>
					      	<a href="delete_video?id=<%= v.getId() %>" class="btn btn-outline-danger btn-sm">Delete</a>
					      </td>
					    </tr>
						<%
						id++;
					}
				  }catch(Throwable t){
					  System.out.println(t.getMessage());
				  }
				  %>
				  </tbody>
				</table>
			</div>
		
	</div>
</div>



</body>
</html>