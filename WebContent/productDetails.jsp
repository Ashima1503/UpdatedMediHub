<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
    import="com.medihub.service.impl.*,com.medihub.service.*,com.medihub.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Medihub</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/productDetailStyle.css">

</head>

<body style="background-image: url('https://th.bing.com/th/id/R.47a54046a8a0bf77b047d4189313297b?rik=nS6lOk06Bx9NEA&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f8%2f9%2f2%2f1520340-amazing-medical-wallpaper-backgrounds-1920x1200.jpg&ehk=YlJxKN9%2fiU8UGAXA1itG5a4Nd%2fOJedKuXi7BNNMeXMg%3d&risl=&pid=ImgRaw&r=0');">

    <%
    /* Checking the user credentials */
    String userName = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (userName == null || password == null) {

        response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
    }

    ProductServiceImpl prodDao = new ProductServiceImpl();
    ProductBean selectedProduct = null; // Initialize selectedProduct variable

    String productIdParam = request.getParameter("pid"); // Get the product ID parameter from the URL

    if (productIdParam != null) {
        // If product ID parameter is present, retrieve the details of the selected product
        selectedProduct = prodDao.getProductById(productIdParam);
    } else {
        // If no product ID parameter is present, show a message or handle the case as needed
        out.println("No product selected");
    }
    %>

    <jsp:include page="header.jsp" />

    <div class="container">
        <% if (selectedProduct != null) { %>
            <!-- Display details of the selected product -->
            <div class="row">
                <div class="col-md-6">
                    <img src="./ShowImage?pid=<%=selectedProduct.getProdId()%>"
                        class="img-responsive" alt="Product Image">
                </div>
                <div class="col-md-6" style="background-color: white">
                    <h2><%= selectedProduct.getProdName() %></h2>
                    <p><%= selectedProduct.getProdInfo() %></p>
                    <p style="font-size: 3rem;">Price: Rs <%= selectedProduct.getProdPrice() %></p>
                    <!-- Add to Cart Form -->
                    <form method="post" action="./AddtoCart">
                        <input type="hidden" name="uid" value="<%=userName%>">
                        <input type="hidden" name="pid" value="<%=selectedProduct.getProdId()%>">
                        <div class="form-group">
                            <label for="quantity">Quantity:</label>
                            <input type="number" class="form-control" id="quantity" name="pqty" value="1" min="1">
                        </div>
                        <button type="submit" class="btn btn-success">Add to Cart</button>
                    </form>
                </div>
            </div>
        <% } else { %>
            <!-- Handle case where no product is selected -->
            <div class="row">
                <div class="col-md-12">
                    <p>No product selected</p>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>
