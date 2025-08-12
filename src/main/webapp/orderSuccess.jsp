<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodie.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    String item = request.getParameter("item");
%>
<html>
<head>
    <title>Order Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- Lottie Animation Script -->
    <script>
    </script>
    
	<style>
	
        body {
            background: linear-gradient(to right, #fff5ec, #ffe9e1);
            font-family: 'Segoe UI', sans-serif;
        }
        .confirmation-box {
            max-width: 600px;
            margin: 60px auto;
            padding: 40px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }
        .confirmation-box:hover {
            transform: scale(1.01);
        }
        h2 {
            color: #ff5722;
            font-weight: 700;
        }
        .btn-orange {
            background-color: #ff5722;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 8px;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        .btn-orange:hover {
            background-color: #e64a19;
        }
        .thank-you {
            font-size: 1.2rem;
            margin-top: 10px;
        }
    </style>

</head>
<body>
<%-- <% if (user != null) { %>
    <h2>Thank you, <%= user.getName() %>!</h2>
    <p>Your order for <b><%= item %></b> has been placed successfully.</p>
    <a href="index.jsp">Back to Home</a>
<% } else { %>
    <p>Please <a href="login.jsp">login</a> first to place an order.</p>
<% } %> --%>

<div class="container">
	
    <div class="confirmation-box">
        <lottie-player
            src="https://lottie.host/4edc0f31-cbcb-41f0-84cd-d4930a4ce331/MEMRmgLu7J.json"
            background="transparent"
            speed="1"
            style="width: 200px; height: 200px; margin: 0 auto;"
            autoplay>
        </lottie-player>

        <% if (user != null) { %>
            <h2>Thank you, <%= user.getName() %>! 🎉</h2>
            <p class="thank-you">Your delicious <strong>Order</strong> is on its way! 🚀</p>
            <a href="index.jsp" class="btn btn-orange mt-4">Back to Home</a>
        <% } else { %>
            <p>Please <a href="login.jsp">login</a> first to place an order.</p>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
