<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - Foodie Express</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <style>
        body {
            background: #fff5ec;
            font-family: 'Segoe UI', sans-serif;
        }
        .register-container {
            max-width: 450px;
            margin: 80px auto;
            padding: 30px;
            border-radius: 15px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 500;
        }
        .btn-primary {
            background-color: #ff5722;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e64a19;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #ff5722;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
    
</head>
<body>
<!-- <h2>Register</h2>
<form action="register" method="post">
    <label>Name: <input type="text" name="name" required></label><br><br>
    <label>Email: <input type="email" name="email" required></label><br><br>
    <label>Password: <input type="password" name="password" required></label><br><br>
    <input type="submit" value="Register">
</form>
<p>Already have an account? <a href="login.jsp">Login here</a></p> -->

<div class="container">
    <div class="register-container">
        <h2>Register</h2>
        <form action="register" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" required placeholder="Enter your name">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required placeholder="Create a password">
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
