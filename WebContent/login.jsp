<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('https://th.bing.com/th/id/R.47a54046a8a0bf77b047d4189313297b?rik=nS6lOk06Bx9NEA&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f8%2f9%2f2%2f1520340-amazing-medical-wallpaper-backgrounds-1920x1200.jpg&ehk=YlJxKN9%2fiU8UGAXA1itG5a4Nd%2fOJedKuXi7BNNMeXMg%3d&risl=&pid=ImgRaw&r=0');">

	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./LoginSrv" method="post"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
				style=" background-color: rgba(255, 255, 255, 0.7); border: 2px solid black; border-radius: 10px;  padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Login Form</h2>
					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Email</label> <input type="email"
							placeholder="Enter Username" name="username" class="form-control"
							id="last_name" maxlength="25" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Password</label> <input type="password"
							placeholder="Enter Password" name="password" class="form-control"
							id="last_name"  maxlength="25" minlength="5" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="userrole">Login As</label> <select name="usertype"
							id="userrole" class="form-control" required>
							<option value="customer" selected>CUSTOMER</option>
							<option value="admin">ADMIN</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<button type="submit" class="btn btn-success">Login</button>
					</div>
				</div>
			</form>

		</div>
	</div>

	<%@ include file="footer.html"%>

</body>
</html>