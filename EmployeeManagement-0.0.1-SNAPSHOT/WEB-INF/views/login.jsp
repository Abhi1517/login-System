<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h2>Employee Login</h2>

<form action="login" method="post">
    Login ID: <input type="text" name="login_id" required /><br><br>
    Password: <input type="password" name="password" required /><br><br>

    <input type="submit" value="Login" />
</form>

<p style="color:red">${error}</p>

<br>
<a href="register">New User? Register Here</a>

</body>
</html>
