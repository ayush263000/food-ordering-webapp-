<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodie.model.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
    double total = 0;
    DecimalFormat df = new DecimalFormat("#.00");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout - Foodie Express</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">🧾 Checkout</h2>

    <% if (cart == null || cart.isEmpty()) { %>
        <div class="alert alert-info text-center">Your cart is empty. Please <a href="index.jsp">add items</a> first.</div>
    <% } else { %>
        <!-- Order Summary -->
        <div class="card mb-4">
            <div class="card-header bg-warning text-dark"><strong>Order Summary</strong></div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Price (₹)</th>
                            <th>Qty</th>
                            <th>Subtotal (₹)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CartItem item : cart) {
                            double price = Double.parseDouble(item.getPrice().replace("₹", ""));
                            double subtotal = price * item.getQuantity();
                            total += subtotal;
                        %>
                        <tr>
                            <td><%= item.getItemName() %></td>
                            <td><%= item.getPrice() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td><%= df.format(subtotal) %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <h5 class="text-end mt-3">Total: ₹<%= df.format(total) %></h5>
            </div>
        </div>

        <!-- Checkout Form -->
        <form action="checkoutServlet" method="post" class="card p-4 shadow">
            <h5 class="mb-3">Delivery Details</h5>
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Delivery Address</label>
                <textarea name="address" id="address" rows="3" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Contact Number</label>
                <input type="tel" name="phone" id="phone" class="form-control" required pattern="[0-9]{10}" maxlength="10">
            </div>

            <div class="d-flex justify-content-between">
                <a href="cart.jsp" class="btn btn-outline-secondary">← Back to Cart</a>
                <button type="submit" class="btn btn-success">Place Order</button>
            </div>
        </form>
    <% } %>
</div>
</body>
</html>
