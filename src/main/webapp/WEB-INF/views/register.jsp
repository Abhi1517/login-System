<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Employee Registration</title>

<style>
* { box-sizing: border-box; }

body {
	margin: 0;
	height: 100vh;
	font-family: 'Segoe UI', Arial, sans-serif;
	background: linear-gradient(135deg, #0f1024, #1b1f3b);
	display: flex;
	align-items: center;
	justify-content: center;
}

.register-card {
	width: 470px;
	padding: 40px 20px;
	border-radius: 20px;
	background: #1c1f3a;
	box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6);
	color: #fff;
}
	
.register-card h2 {
	margin-bottom: 25px;
	font-weight: 600;
}

.input-box {
	position: relative;
	margin-bottom: 15px;
}

.input-box input,
.input-box select {
	width: 100%;
	padding: 14px 16px;
	border-radius: 30px;
	border: 1px solid #ff3f6c;
	background: transparent;
	color: #fff;
	outline: none;
	font-size: 14px;
}

.input-box input::placeholder { color: #ddd; }

.eye {
	position: absolute;
	right: 18px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #ff3f6c;
	font-size: 13px;
}

.error-msg {
	color: #ff8080;
	font-size: 12px;
	display: none;
	margin-top: 5px;
}

.register-btn {
	width: 100%;
	padding: 14px;
	border: none;
	border-radius: 30px;
	background: linear-gradient(135deg, #ff416c, #ff4b2b);
	color: white;
	font-size: 15px;
	cursor: pointer;
	font-weight: 600;
	margin-top: 10px;
}

.footer-text {
	text-align: center;
	margin-top: 20px;
	font-size: 13px;
}

.footer-text a {
	color: #ff3f6c;
	text-decoration: none;
}
</style>
</head>

<body>

<div class="register-card">
	<h2>Registration</h2>

	<!-- SERVER-SIDE ERROR -->
	<c:if test="${not empty error}">
		<div class="error-msg" style="display:block">${error}</div>
	</c:if>

	<form action="save" method="post"
	      onsubmit="return validateName() && validatePassword()">

		<div class="input-box">
			<input type="text" id="name" name="name"
			       placeholder="Full Name" required autocomplete="off">
			<div id="nameError" class="error-msg">
				Name must contain only alphabets
			</div>
		</div>

		<div class="input-box">
			<input type="date" name="dob" required>
		</div>

		<div class="input-box">
			<select name="gender" required>
				<option value="">Select Gender</option>
				<option>Male</option>
				<option>Female</option>
			</select>
		</div>

		<div class="input-box">
			<input type="text" name="address" placeholder="Address">
		</div>

		<div class="input-box">
			<input type="text" name="city" placeholder="City">
		</div>

		<div class="input-box">
			<input type="text" name="state" placeholder="State">
		</div>

		<div class="input-box">
			<input type="text" name="login_id"
			       placeholder="Login ID" required autocomplete="off">
		</div>

		<div class="input-box">
			<input type="password" id="password" name="password"
			       placeholder="Password" required autocomplete="new-password">
			<span class="eye"
			      onclick="togglePassword('password', this)">Show</span>
			<div id="pwdError" class="error-msg">
				Password must be at least 4 characters
			</div>
		</div>

		<div class="input-box">
			<input type="password" id="confirmPassword"
			       placeholder="Confirm Password" required>
			<span class="eye"
			      onclick="togglePassword('confirmPassword', this)">Show</span>
			<div id="matchError" class="error-msg">
				Passwords do not match
			</div>
		</div>

		<button class="register-btn" type="submit">
			Sign Up
		</button>
	</form>

	<div class="footer-text">
		Already have an account? <a href="login">Sign in</a>
	</div>
</div>

<script>
function togglePassword(id, el) {
	const input = document.getElementById(id);
	if (input.type === "password") {
		input.type = "text";
		el.innerText = "Hide";
	} else {
		input.type = "password";
		el.innerText = "Show";
	}
}

function validateName() {
	const name = document.getElementById("name").value.trim();
	const error = document.getElementById("nameError");
	const regex = /^[A-Za-z ]+$/;

	if (!regex.test(name)) {
		error.style.display = "block";
		return false;
	}
	error.style.display = "none";
	return true;
}

function validatePassword() {
	const pwd = document.getElementById("password").value;
	const cpwd = document.getElementById("confirmPassword").value;

	const pwdError = document.getElementById("pwdError");
	const matchError = document.getElementById("matchError");

	if (pwd.length < 4) {
		pwdError.style.display = "block";
		return false;
	} else {
		pwdError.style.display = "none";
	}

	if (pwd !== cpwd) {
		matchError.style.display = "block";
		return false;
	} else {
		matchError.style.display = "none";
	}

	return true;
}
</script>

</body>
</html>
