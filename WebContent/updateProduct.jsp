<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.medihub.service.impl.*,com.medihub.service.*,com.medihub.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('https://th.bing.com/th/id/R.47a54046a8a0bf77b047d4189313297b?rik=nS6lOk06Bx9NEA&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f8%2f9%2f2%2f1520340-amazing-medical-wallpaper-backgrounds-1920x1200.jpg&ehk=YlJxKN9%2fiU8UGAXA1itG5a4Nd%2fOJedKuXi7BNNMeXMg%3d&risl=&pid=ImgRaw&r=0');">
	<%
	/* Checking the user credentials */
	String utype = (String) session.getAttribute("usertype");
	String uname = (String) session.getAttribute("username");
	String pwd = (String) session.getAttribute("password");
	String prodid = request.getParameter("prodid");
	ProductBean product = new ProductServiceImpl().getProductDetails(prodid);
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
		return;
	} else if (utype == null || !utype.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
		return;
	} else if (uname == null || pwd == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>

	<jsp:include page="header.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./UpdateProductSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: rgba(255, 255, 255, 0.7);
 padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<img src="./ShowImage?pid=<%=product.getProdId()%>"
							alt="Product Image" height="100px" />
						<h2 style="color: green;">Product Update Form</h2>
					</div>

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
				<div class="row">
					<input type="hidden" name="pid" class="form-control"
						value="<%=product.getProdId()%>" id="last_name" required>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Product Name</label> <input type="text"
							placeholder="Enter Product Name" name="name" class="form-control"
							value="<%=product.getProdName()%>" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<%
						String ptype = product.getProdType();
						%>
						<label for="producttype">Product Type</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="Syrups"
								<%="Syrups".equalsIgnoreCase(ptype) ? "selected" : ""%>>Syrups</option>
							<option value="Antibioetics"
								<%="Antibioetics".equalsIgnoreCase(ptype) ? "selected" : ""%>>Antibioetics</option>
							<option value="Surgical"
								<%="Surgical".equalsIgnoreCase(ptype) ? "selected" : ""%>>Surgical Instruments</option>
							<option value="Diagnostic"
								<%="Diagnostic".equalsIgnoreCase(ptype) ? "selected" : ""%>>Diagnostic Equipments</option>
							<option value="Skincare"
								<%="Skincare".equalsIgnoreCase(ptype) ? "selected" : ""%>>Skincare</option>
							<option value="speaker"
								<%="vitamins".equalsIgnoreCase(ptype) ? "selected" : ""%>>vitamins</option>
							<!--  <option value="other"
								<%="other".equalsIgnoreCase(ptype) ? "selected" : ""%>>Some
								Other Appliances</option> -->
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Product Description</label>
					<textarea name="info" class="form-control text-align-left"
						id="last_name" required><%=product.getProdInfo()%></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Unit Price</label> <input type="number"
							value="<%=product.getProdPrice()%>"
							placeholder="Enter Unit Price" name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Stock Quantity</label> <input type="number"
							value="<%=product.getProdQuantity()%>"
							placeholder="Enter Stock Quantity" class="form-control"
							id="last_name" name="quantity" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4" style="margin-bottom: 2px;">
						<button formaction="adminViewProduct.jsp" class="btn btn-danger">Cancel</button>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn btn-success">Update
							Product</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>