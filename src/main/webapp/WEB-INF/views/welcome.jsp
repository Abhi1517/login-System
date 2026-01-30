<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #0f1024, #1b1f3b);
    display: flex;
    align-items: center;
    justify-content: center;
}


.welcome-card {
    width: 95%;
    background: #1c1f3a;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 30px 60px rgba(0,0,0,0.6);
    color: #fff;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.header h2 {
    margin: 0;
    font-weight: 500;
}


.logout-btn {
    background: linear-gradient(135deg, #ff416c, #ff4b2b);
    border: none;
    color: white;
    padding: 10px 20px;
    border-radius: 30px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
}

.logout-btn:hover {
    opacity: 0.9;
}


.section-title {
    margin-bottom: 15px;
    color: #ffb3c7;
}


table {
    width: 100%;
    border-collapse: collapse;
    background: transparent;
}

table th, table td {
    padding: 14px;
    text-align: left;
}

table th {
    background: #23265a;
    color: #fff;
    font-weight: 600;
}

table tr {
    border-bottom: 1px solid rgba(255,255,255,0.08);
}

table tr:nth-child(even) {
    background: rgba(255,255,255,0.03);
}

table tr:hover {
    background: rgba(255,255,255,0.07);
}

.no-data {
    text-align: center;
    padding: 20px;
    color: #ccc;
}
</style>

</head>
<body>

<div class="welcome-card">

    <div class="header">
        <h2>Welcome, ${name}</h2>

        <form action="logout" method="get">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <h3 class="section-title">Registered Employees</h3>

    <c:choose>
        <c:when test="${not empty list}">
            <table>
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
        </c:when>

        <c:otherwise>
            <div class="no-data">
                No employees registered yet.
            </div>
        </c:otherwise>
    </c:choose>

</div>

</body>
</html>
