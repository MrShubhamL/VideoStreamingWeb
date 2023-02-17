<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
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
				<%
				String login_failed = (String) session.getAttribute("login_failed");

				if (login_failed != null) {
					%>
					<h5 class="text-warning">Username or Password is not correct!</h5>
					<%
					}
					session.removeAttribute("login_failed");

				%>
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<div class="card p-2 mt-5">
				<form action="admin_login" method="post">
					<div class="col-lg-12">
						<label class="form-label">Username</label>
						<input class="form-control" name="emp_email" type="text">
					</div>
					<div class="col-lg-12">
						<label class="form-label">Password</label>
						<input class="form-control" name="emp_pass" type="password">
					</div>
					<div class="col-lg-12 mt-3">
						<button class="btn btn-primary" type="submit">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>