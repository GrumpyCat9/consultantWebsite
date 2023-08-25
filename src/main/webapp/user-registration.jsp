<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>

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
		if (feedbackMessage === "Registered") {
			Swal.fire({
				icon : 'success',
				title : 'Registration Successful',
				text : 'You have been successfully registered!',
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
	<div>

		<div
			style="display: flex; flex-direction: column; justify-content: center; background: #f7fafc; align-items: center; height: 100vh">

			<div style="width: 900px; margin-bottom: 10px;">
				<h2 style="margin-left: 30px">Sign up or Sign in</h2>
			</div>

			<form action="usermanager" method="post">
				<div
					style="display: flex; justify-content: space-Between; background-color: white; width: 900px; padding: 25px; box-shadow: 5px 5px 5px #0313D; border-radius: 12px">
					<div style="width: 400px;">
						<div class="form-group" style="padding-top: 15px">
							<label for="exampleInputEmail1">First Name</label> <input
								type="text" class="form-control" id="firstName" name="firstName"
								placeholder="First Name" required>
						</div>
						<div class="form-group" style="padding-top: 15px">
							<label for="exampleInputPassword1">Last Name</label> <input
								type="text" class="form-control" id="lastName" name="lastName"
								placeholder="Last Name" required>
						</div>
						<div class="form-group" style="padding-top: 15px">
							<label for="exampleInputEmail1">Age</label> <input type="number"
								class="form-control" id="age" name="age" placeholder="Age"
								required>
						</div>
						<div class="form-group" style="padding-top: 15px">
							<label for="exampleInputPassword1">Gender</label> <select
								class="form-select" id="gender" name="gender"
								aria-label="Default select example" required>
								<option disabled selected value="">Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="NotMentioned">Prefer not to say</option>
							</select>
						</div>
					</div>
					<div style="width: 400px;">
						<div class="form-group" style="padding-top: 15px">
							<label for="exampleInputEmail1">Email</label> <input type="email"
								class="form-control" id="email" name="email" placeholder="Email"
								required>
						</div>
						<div class="form-group" style="padding-top: 15px">
							<label for="exampleInputPassword1">Phone Number</label> <input
								type="number" class="form-control" id="phoneNumber"
								name="phoneNumber" placeholder="Phone Number" required>
						</div>
						<div class="form-group" style="padding-top: 15px">
							<label for="exampleInputEmail1">Role</label> <select
								class="form-select" name="role"
								aria-label="Default select example" required>
								<option disabled selected value="">Role</option>
								<option value="1">Job Seeker</option>
								<option value="2">Consultant</option>
							</select>

						</div>
						<div class="form-group"
							style="padding-top: 15px; padding-bottom: 15px">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="password"
								name="password" placeholder="Password" required>
						</div>
					</div>
				</div>

				<div
					style="display: flex; justify-content: center; padding-top: 10px;">
					<input type="hidden" name="actiontype" value="add" />
					<button type="submit" class="btn btn-primary"
						style="width: 100%; background-color: #e27a39; border: none;">Register</button>
				</div>

			</form>
		</div>

	</div>

</body>
</html>