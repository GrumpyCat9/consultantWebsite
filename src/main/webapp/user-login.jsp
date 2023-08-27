<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<title>User Login</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<!-- Sweet alert -->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var feedbackMessage = "${feedbackMessage}";
		if (feedbackMessage === "User not Found") {
			Swal.fire({
				icon : 'error',
				title : 'User not Found',
				text : 'Wrong Email or Password',
			});
		} else if (feedbackMessage.startsWith("Error")) {
			Swal.fire({
				icon : 'error',
				title : 'Registration Error',
				text : 'An error occurred during registration.',
			});
		}
	});
</script>

</head>
<body>

	<div
		style="display: flex; justify-content: center; align-items: center; background-color: #f7fafc; height: 100vh">

		<form action= "usermanager">
		<h2 style="margin-left: 30px">Sign in</h2>
			<div style="display: flex; flex-direction: column; justify-content: center; background-color: white; width: 500px; padding: 25px; box-shadow: 5px 5px 5px #0313D; border-radius: 12px">
				<div class="form-group" style="padding-top: 15px">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="exampleInputEmail1" name="email"
						aria-describedby="emailHelp" placeholder="Enter email" required>
				</div>
				<div class="form-group" style="padding-top: 15px">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="password" name="password"
						placeholder="Password" required>
				</div>
				<input type="hidden" name="actionType" value="login" />
				<button type="submit" class="btn btn-primary" style="margin-top: 15px; margin-bottom: 15px; background-color: #e27a39; border: none">Submit</button>
				<div style="display:flex; justify-content: center; ">
					<a href="user-registration.jsp" style="color: black">Don't have an account? Register here.</a>
				</div>
			</div>

		</form>

	</div>

</body>
</html>