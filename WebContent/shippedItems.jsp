<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.medihub.service.impl.*,com.medihub.beans.*,com.medihub.service.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('https://th.bing.com/th/id/R.47a54046a8a0bf77b047d4189313297b?rik=nS6lOk06Bx9NEA&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f8%2f9%2f2%2f1520340-amazing-medical-wallpaper-backgrounds-1920x1200.jpg&ehk=YlJxKN9%2fiU8UGAXA1itG5a4Nd%2fOJedKuXi7BNNMeXMg%3d&risl=&pid=ImgRaw&r=0');">
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	%>

	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">Shipped
		Orders</div>
	<div class="container-fluid">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead
					style="background-color: #115884; color: white; font-size: 18px;">
					<tr>
						<th>TransactionId</th>
						<th>ProductId</th>
						<th>Username</th>
						<th>Address</th>
						<th>Quantity</th>
						<th>Amount</th>
						<td>Status</td>
					</tr>
				</thead>
				<tbody style="background-color: white;">

					<%
					OrderServiceImpl orderdao = new OrderServiceImpl();

					List<OrderBean> orders = new ArrayList<OrderBean>();
					orders = orderdao.getAllOrders();
					int count = 0;
					for (OrderBean order : orders) {
						String transId = order.getTransactionId();
						String prodId = order.getProductId();
						int quantity = order.getQuantity();
						int shipped = order.getShipped();
						String userId = new TransServiceImpl().getUserId(transId);
						String userAddr = new UserServiceImpl().getUserAddr(userId);
						if (shipped != 0) {
							count++;
					%>

					<tr>
						<td><%=transId%></td>
						<td><a href="./updateProduct.jsp?prodid=<%=prodId%>"><%=prodId%></a></td>
						<td><%=userId%></td>
						<td><%=userAddr%></td>
						<td><%=quantity%></td>
						<td>Rs. <%=order.getAmount()%></td>
						<td class="text-success" style="font-weight: bold;">SHIPPED</td>

					</tr>

					<%
					}
					}
					%>
					<%
					if (count == 0) {
					%>
					<tr style="background-color: grey; color: white;">
						<td colspan="7" style="text-align: center;">No Items
							Available</td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>