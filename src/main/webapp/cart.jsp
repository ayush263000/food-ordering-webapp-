
<!-- AFTER CHANGES : -->

<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodie.model.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>

<%
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    double total = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - Foodie Express</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4 text-center">🛒 Your Cart</h2>

    <% if (cart.size() == 0) { %>
        <div class="alert alert-warning text-center">Your cart is empty.</div>
        <div class="text-center">
            <a href="index.jsp" class="btn btn-primary">Continue Ordering</a>
        </div>
    <% } else { %>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Item</th>
                    <th>Price (₹)</th>
                </tr>
            </thead>
            <tbody>
            <% for (CartItem item : cart) {
                double price = Double.parseDouble(item.getPrice().replace("₹", ""));
                total += price;
            %>
                <tr>
                    <td><%= item.getItemName() %></td>
                    <td><%= item.getPrice() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h5>Total: <span class="text-success">₹<%= String.format("%.2f", total) %></span></h5>
            <div>
                <a href="index.jsp" class="btn btn-outline-secondary me-2">Continue Ordering</a>
                <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
            </div>
        </div>
    <% } %>
</div>
</body>
</html> --%>



<!-- CHANGES - 02 -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodie.model.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
    double total = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h2 class="mb-4">🛒 Your Cart</h2>

    <% if (cart == null || cart.isEmpty()) { %>
        <div class="alert alert-info">Your cart is empty.</div>
        <a href="index.jsp" class="btn btn-primary">← Back to Menu</a>
    <% } else { %>
        <%-- <table class="table table-bordered">
            <thead class="table-warning">
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th style="width: 120px;">Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (CartItem item : cart) {
                int price = Integer.parseInt(item.getPrice().replace("₹", ""));
                total += price;
            %>
                <tr>
                    <td><%= item.getItemName() %></td>
                    <td><%= item.getPrice() %></td>
                    <td>
                        <form action="removeFromCart" method="post">
                            <input type="hidden" name="name" value="<%= item.getItemName() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                        </form>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table> --%>
        
        <table class="table table-bordered">
		    <thead>
		        <tr>
		            <th>Item</th>
		            <th>Price (each)</th>
		            <th>Quantity</th>
		            <th>Subtotal</th>
		            <th>Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		        <% 
		        total = 0;
		        if (cart != null && !cart.isEmpty()) {
		            for (CartItem item : cart) {
		                double itemPrice = Double.parseDouble(item.getPrice().replace("₹", ""));
		                double subtotal = itemPrice * item.getQuantity();
		                total += subtotal;
		        %>
		        <tr>
		            <td><%= item.getItemName() %></td>
		            <td><%= item.getPrice() %></td>
		            <td><%= item.getQuantity() %></td>
		            <td>₹<%= subtotal %></td>
		            <td class="d-flex">
		                <!-- -1 button -->
		                <form action="removeFromCart" method="post" class="me-1">
		                    <input type="hidden" name="name" value="<%= item.getItemName() %>">
		                    <input type="hidden" name="redirect" value="cart">
		                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
		                </form>
		
		                <!-- +1 button -->
						<form action="addToCart" method="post">
						    <input type="hidden" name="item" value="<%= item.getItemName() %>">
						    <input type="hidden" name="price" value="<%= item.getPrice() %>">
						    <input type="hidden" name="redirect" value="cart">
						    <button type="submit" class="btn btn-success btn-sm">Add</button>
						</form>

		            </td>
		        </tr>
		        <% 
		            }
		        } else {
		        %>
		        <tr><td colspan="5" class="text-center">🛒 Your cart is empty.</td></tr>
		        <% } %>
		    </tbody>
		</table>
		
		<% if (cart != null && !cart.isEmpty()) { %>
		    <h4 class="text-end me-4">Total: ₹<%= total %></h4>
		<% } %>

        

        <div class="d-flex justify-content-between align-items-center">
            <h5>Total: <strong>₹<%= total %></strong></h5>
            <div>
                <a href="index.jsp" class="btn btn-secondary me-2">← Continue Shopping</a>
                <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
            </div>
        </div>
    <% } %>
</div>
</body>
</html>





