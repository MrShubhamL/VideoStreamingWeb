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
<title>Employee Management</title>
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
			<%@include file="registration.jsp"%>
			<%@include file="login.jsp"%>
			<div class="col-lg-12">
				<div class="row">
				
				 <%
				  try{
				  	VideoRepo vip = new VideoRepo(DBConnection.getConnection());
					List<Videos> vid = vip.allVideos();


					for(Videos v:vid){
						%>
							<div class="col-lg-4 mt-4">
								<iframe width="400" height="300"
								src="<%= v.getVideo_url() %>" 
								title="<%= v.getVideo_name() %>"
								frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media;
								 gyroscope; picture-in-picture" allowfullscreen></iframe>
								<p class="text-white"><%= v.getVideo_name() %></p>
							</div>
						<%

					}
				  }catch(Throwable t){
					  System.out.println(t.getMessage());
				  }
				  %>
				
					
				</div>

				<%
				String failed = (String) session.getAttribute("failed");
				String success = (String) session.getAttribute("success");
				String login_failed = (String) session.getAttribute("login_failed");
				if (failed != null) {
				%>
				<h5 class="text-danger">You are already register!</h5>
				<%
				}
				session.removeAttribute("failed");

				if (login_failed != null) {
					%>
					<h5 class="text-warning">Username or Password is not correct!</h5>
					<%
					}
					session.removeAttribute("login_failed");
					
				if (success != null) {
					%>
					<h5 class="text-white">Congratulation!, You have been successfully register.</h5>
					<%
				}
				session.removeAttribute("success");
				%>



			</div>
		</div>
	</div>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>
