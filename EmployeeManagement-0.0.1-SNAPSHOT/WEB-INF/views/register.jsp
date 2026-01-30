<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Employee Registration</title>
</head>
<body>

<h2>Employee Registration</h2>

<form action="save" method="post">
    Name: <input type="text" name="name" required /><br><br>

    Date of Birth: <input type="date" name="dob" required /><br><br>

    Gender:
    <input type="radio" name="gender" value="Male"> Male
    <input type="radio" name="gender" value="Female"> Female
    <br><br>

    Address: <input type="text" name="address" /><br><br>

    City: <input type="text" name="city" /><br><br>

    State: <input type="text" name="state" /><br><br>

    Login ID: <input type="text" name="login_id" required /><br><br>

    Password: <input type="password" name="password" required /><br><br>

    <input type="submit" value="Register" />
</form>

<br>
<a href="/">Go to Login</a>

</body>
</html>
