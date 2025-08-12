<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodie.model.FoodItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Food List - Foodie Express</title>
</head>
<body>
<h2>🍱 Food Items</h2>

<!-- Search + Filter + Sort Form -->
<form method="get" action="foods">
    Search Name:
    <input type="text" name="name" value="${param.name}">

    Type:
    <select name="type">
        <option value="">All</option>
        <option value="veg" <c:if test="${param.type == 'veg'}">selected</c:if>>Veg</option>
        <option value="non-veg" <c:if test="${param.type == 'non-veg'}">selected</c:if>>Non-Veg</option>
    </select>

    Sort By:
    <select name="sort">
        <option value="">None</option>
        <option value="price" <c:if test="${param.sort == 'price'}">selected</c:if>>Price</option>
        <option value="rating" <c:if test="${param.sort == 'rating'}">selected</c:if>>Rating</option>
    </select>

    <input type="submit" value="Apply">
</form>

<br>

<!-- Food Table -->
<c:choose>
    <c:when test="${not empty foods}">
        <table border="1" cellpadding="10">
            <tr>
                <th>Name</th>
                <th>Price (₹)</th>
                <th>Type</th>
                <th>Rating</th>
                <th>Restaurant</th>
            </tr>
            <c:forEach var="food" items="${foods}">
                <tr>
                    <td>${food.name}</td>
                    <td>${food.price}</td>
                    <td>${food.type}</td>
                    <td>${food.rating}</td>
                    <td>${food.restaurantName}</td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p>No food items found matching your criteria.</p>
    </c:otherwise>
</c:choose>

<br>
<a href="index.jsp">⬅ Back to Home</a>
</body>
</html>
