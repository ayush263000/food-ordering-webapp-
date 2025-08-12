<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodie.model.CartItem" %>
<%@ page import="java.util.ArrayList" %>

<%
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    double total = 0;
    for (CartItem item : cart) {
        double price = Double.parseDouble(item.getPrice().replace("₹", ""));
        total += price * item.getQuantity();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment - Foodie Express</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center mb-4">💳 Payment Page</h3>

        <form action="processPayment" method="post">
            <div class="mb-3">
                <label for="cardName" class="form-label">Cardholder Name</label>
                <input type="text" class="form-control" id="cardName" name="cardName" required>
            </div>

            <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" id="cardNumber" name="cardNumber" maxlength="16" required>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="expiry" class="form-label">Expiry Date</label>
                    <input type="month" class="form-control" id="expiry" name="expiry" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="cvv" class="form-label">CVV</label>
                    <input type="password" class="form-control" id="cvv" name="cvv" maxlength="3" required>
                </div>
            </div>

            <h5 class="mt-3">Total Amount: <span class="text-success">₹<%= String.format("%.2f", total) %></span></h5>

            <div class="d-flex justify-content-between mt-4">
                <a href="cart.jsp" class="btn btn-outline-secondary">← Back to Cart</a>
                <button type="submit" class="btn btn-success">Pay & Place Order</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
