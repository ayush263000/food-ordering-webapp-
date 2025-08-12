<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodie.model.User" %>
<%@ page import="com.foodie.model.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%
    User user = (User) session.getAttribute("user");

	ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
	int cartCount = (cart != null) ? cart.size() : 0;


    String[][] foodItems = {
        {"Pizza", "₹249"},
        {"Burger", "₹149"},
        {"Fries", "₹99"},
        {"Biryani", "₹199"},
        {"Pasta", "₹179"},
        {"Momos", "₹129"},
        {"Sandwich", "₹89"},
        {"Ice Cream", "₹79"}
    };
%>
<html>
<head>
    <title>Foodie Express - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<style>
        body {
            background-color: #fff5ec;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h2 {
            color: #ff5722;
        }
        .user-info {
            text-align: right;
            margin-bottom: 20px;
        }
        .table thead {
            background-color: #ff5722;
            color: white;
        }
        .order-section {
            margin-top: 30px;
        }
        .btn-orange {
            background-color: #ff5722;
            border: none;
            color: white;
        }
        .btn-orange:hover {
            background-color: #e64a19;
        }
    </style>

</head>
<body>
<%-- <h2>🍽 Welcome to Foodie Express</h2>
<% if (user != null) { %>
    <p>Hello, <%= user.getName() %>! | <a href="logout.jsp">Logout</a></p>
<% } else { %>
    <p><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></p>
<% } %>

<hr>
<h3>📋 Available Food Items</h3>
<table border="1" cellpadding="10">
    <tr><th>Item</th><th>Price</th></tr>
    <% for (String[] item : foodItems) { %>
        <tr>
            <td><%= item[0] %></td>
            <td><%= item[1] %></td>
        </tr>
    <% } %>
</table>

<% if (user != null) { %>
    <h4>🛒 Place Your Order</h4>
    <form action="order.jsp" method="post">
        <label>Choose Item:
            <select name="item">
                <% for (String[] item : foodItems) { %>
                    <option value="<%= item[0] %>"><%= item[0] %> - <%= item[1] %></option>
                <% } %>
            </select>
        </label>
        <input type="submit" value="Order Now">
    </form>
<% } else { %>
    <p>👉 <a href="login.jsp">Login</a> to place an order.</p>
<% } %> --%>


<!-- BEFORE ADDING CART FEATURE -->

<%-- <div class="container">
    <div class="header">
        <h2>🍽 Welcome to Foodie Express</h2>
    </div>

    <div class="user-info">
        <% if (user != null) { %>
            <p>Hello, <strong><%= user.getName() %></strong>! | <a href="logout.jsp">Logout</a></p>
        <% } else { %>
            <p><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></p>
        <% } %>
    </div>

    <h4>📋 Available Food Items</h4>
    <table class="table table-striped table-bordered mt-3">
        <thead>
            <tr>
                <th>Item</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <% for (String[] item : foodItems) { %>
                <tr>
                    <td><%= item[0] %></td>
                    <td><%= item[1] %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <% if (user != null) { %>
        <div class="order-section">
            <h5>🛒 Place Your Order</h5>
            <form action="order.jsp" method="post" class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="item" class="form-label">Choose Item:</label>
                    <select name="item" id="item" class="form-select" required>
                        <% for (String[] item : foodItems) { %>
                            <option value="<%= item[0] %>"><%= item[0] %> - <%= item[1] %></option>
                        <% } %>
                    </select>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-orange mt-4">Order Now</button>
                </div>
            </form>
        </div>
    <% } else { %>
        <p class="mt-4">👉 <a href="login.jsp">Login</a> to place an order.</p>
    <% } %>
</div> --%>

<div class="container mt-4">
    <div class="header d-flex justify-content-between align-items-center">
        <h2>🍽 Foodie Express</h2>
        <div>
            <% if (user != null) { %>
                Hello, <strong><%= user.getName() %></strong> |
                <a href="cart.jsp" class="btn btn-light btn-sm">🛒 View Cart (<%= cartCount %>)</a>
                <a href="logout.jsp" class="btn btn-warning btn-sm">Logout</a>
            <% } else { %>
                <a href="login.jsp" class="btn btn-light btn-sm">Login</a>
                <a href="register.jsp" class="btn btn-warning btn-sm">Register</a>
            <% } %>
        </div>
    </div>

    <h3 class="mt-5">📋 Available Food Items</h3>
    <div class="row mt-4">
        <% for (String[] item : foodItems) { %>
            <div class="col-md-3">
                <div class="food-card">
                    <h5><%= item[0] %></h5>
                    <p class="text-muted"><%= item[1] %></p>

                    <% if (user != null) { %>
                        <!-- Add to Cart Form -->
                        <form action="addToCart" method="post">
                            <input type="hidden" name="item" value="<%= item[0] %>">
                            <input type="hidden" name="price" value="<%= item[1] %>">
                            <input type="hidden" name="redirect" value="index">
                            <button type="submit" class="btn btn-orange btn-sm mt-2">Add to Cart</button>
                        </form>
                    <% } else { %>
                        <a href="login.jsp" class="btn btn-outline-secondary btn-sm mt-2">Login to Order</a>
                    <% } %>
                </div>
            </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
