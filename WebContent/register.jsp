<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
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

			<form action="./RegisterSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: rgba(255, 255, 255, 0.7); padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Registration Form</h2>
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
					<div class="col-md-6 form-group">
						<label for="first_name">Name</label> <input type="text"
							name="username" class="form-control" id="first_name"
							name="first_name" maxlength="15" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Email</label> <input type="email"
							name="email" class="form-control" id="last_name" name="last_name" maxlength="25"
							required>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Address</label>
					<textarea name="address" class="form-control" id="last_name"
						name="last_name" required maxlength="30"></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Mobile</label> <input type="number"
							name="mobile" class="form-control" id="last_name"
							name="last_name" max="9999999999" min="1000000000" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Pin Code</label> <input type="number"
							name="pincode" class="form-control" min="100000" max="999999" id="last_name"
							name="last_name" required>
					</div>

				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Password</label> <input type="password"
							name="password" class="form-control" maxlength="15" minlength="5" id="last_name"
							name="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Confirm Password</label> <input
							type="password" name="confirmPassword" class="form-control"
							id="last_name" name="last_name" maxlength="15" minlength="5" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6" style="margin-bottom: 2px;">
						<button type="Reset" class="btn btn-danger">Reset</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success">Register</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="footer.html"%>
</body>
</html>