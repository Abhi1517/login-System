<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Welcome</title>
</head>
<body>

<h2>Welcome ${name}</h2>

<h3>Registered Employees</h3>

<table border="1" cellpadding="5">
    <tr>
        <th>Name</th>
        <th>City</th>
        <th>State</th>
        <th>Login ID</th>
    </tr>

    <c:forEach var="emp" items="${list}">
        <tr>
            <td>${emp.name}</td>
            <td>${emp.city}</td>
            <td>${emp.state}</td>
            <td>${emp.login_id}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
