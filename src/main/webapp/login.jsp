<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Foodie Express</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<style>
        body {
            background: #fff5ec;
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            max-width: 400px;
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
        .register-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>

</head>
<body>
<!-- <h2>Login</h2>
<form action="login" method="post"> -->

    <!-- <label>Email: <input type="email" name="email" required></label><br><br>
	
    <label>Password: <input type="password" name="password" required></label><br><br>
    
    <input type="submit" value="Login"> 
    
</form> -->
    
    <div class="container">
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <div class="register-link">
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
