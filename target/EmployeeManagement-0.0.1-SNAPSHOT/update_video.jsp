<%@page import="com.model.Videos"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.repo.VideoRepo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Video</title>
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
<div class="container-fluid bgImg">
	<div class="row">
		<%@include file="Navbar.jsp"%>
		
		<div class="col-lg-6 offset-lg-3">
				<h3 class="text-white">Update Video</h3>
				<form action="update_video" method="post" >
				<%
					try{
						String id = request.getParameter("id");
						VideoRepo vp = new VideoRepo(DBConnection.getConnection());
						Videos vs = vp.get_video(id);
						%>
						<input name="id" type="text" value="<%= vs.getId() %>">
						<div class="col-lg-12 mt-2">
				    		<input class="form-control" type="text" name="v_name" 
				    		value="<%= vs.getVideo_name() %>"
				    		placeholder="Enter Video Title">
				    	</div>
				    	
				    	<div class="col-lg-12 mt-2">
				    		<input class="form-control" type="text" name="v_desc"
				    		value="<%= vs.getVideo_description() %>"
				    		 placeholder="Enter Video Description">
				    	</div>
				    	
				    	<div class="col-lg-12 mt-2">
				    		<input class="form-control" type="text" name="v_url" 
				    		value="<%= vs.getVideo_url() %>"
				    		placeholder="Enter Video URL">
				    	</div>
						<%
					}catch(Throwable t){
						System.out.println(t.getMessage());
					}
				%>
		    	<div class="col-lg-12 mt-2">
		    		<button class="btn btn-outline-primary" type="submit">Upload Now</button>
		    		<button class="btn btn-outline-secondary" type="reset">Reset</button>
		    	</div>
		    </form>
			</div>
		
	</div>
</div>
</body>
</html>