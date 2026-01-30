---<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>Employee Login</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', Arial, sans-serif;
	background: linear-gradient(135deg, #0f1024, #1b1f3b);
	display: flex;
	align-items: center;
	justify-content: center;
}

/* Card */
.login-card {
	width: 460px;
	padding: 67px 20px;
	border-radius: 20px;
	background: #1c1f3a;
	box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6);
	color: #fff;
}

/* Title */
.login-card h2 {
	margin-bottom: 30px;
	font-weight: 600;
	font-size: 30px;
}

/* Input box */
.input-box {
	position: relative;
	
	margin-bottom: 30px;
}

.input-box input {
	width: 100%;
	padding: 14px 16px;
	border-radius: 30px;
	border: 1px solid #ff3f6c;
	background: transparent;
	color: #fff;
	outline: none;
	font-size: 14px;
}

.input-box input::placeholder {
	color: #fff;
}

.options {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 13px;
	margin-bottom: 20px;
}

.options label {
	display: flex;
	align-items: center;
	gap: 6px;
}

.options a {
	color: #ff3f6c;
	text-decoration: none;
}

/* Button */
.login-btn {
	width: 100%;
	padding: 14px;
	border: none;
	border-radius: 30px;
	background: linear-gradient(135deg, #ff416c, #ff4b2b);
	color: white;
	font-size: 15px;
	cursor: pointer;
	font-weight: 600;
}

.login-btn:hover {
	opacity: 0.9;
}

/* Error */
.error {
	color: #ff8080;
	text-align: center;
	margin-bottom: 15px;
}

/* Footer */
.footer-text {
	text-align: center;
	margin-top: 25px;
	font-size: 13px;
}

.footer-text a {
	color: #ff3f6c;
	text-decoration: none;
}

.password-box {
	position: relative;
}

.password-box .eye {
	position: absolute;
	right: 18px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #ff3f6c;
	font-size: 14px;
}
</style>

</head>
<body>

	<div class="login-card">

		<h2>Log In</h2>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>

		<form action="login" method="post">

			<div class="input-box">
				<input type="text" name="login_id" placeholder="Username" required>
			</div>

			<div class="input-box password-box">
				<input type="password" id="password" name="password"
					placeholder="Password" required> <span class="eye" id="eye"
					onclick="togglePassword()">Show</span>
			</div>


			<div class="options">
				
				 <a href="#">Forgot Password</a>
			</div>

			<button class="login-btn" type="submit">Log In</button>

		</form>

		<div class="footer-text">
			Don’t have an account? <a href="register">Sign up</a>
		</div>

	</div>

</body>
	<script>
	function togglePassword() {
	    const pwd = document.getElementById("password");
	    const eye = document.getElementById("eye");
	
	    if (pwd.type === "password") {
	        pwd.type = "text";
	        eye.innerText = "Hide";
	    } else {
	        pwd.type = "password";
	        eye.innerText = "Show";
	    }
	}
	</script>


</html>
