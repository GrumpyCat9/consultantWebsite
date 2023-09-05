<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<tag:if test="${cookie.userRole.value ne 'JobSeeker'}">
	<tag:redirect url="user-login.jsp" />
</tag:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>

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
		if (feedbackMessage === "No Appointments Scheduled") {
			Swal.fire({
				icon : 'error',
				title : 'No appointments',
				text : 'No appointments scheduled or completed',
			});
		} else if (feedbackMessage.startsWith("Error")) {
			Swal.fire({
				icon : 'error',
				title : 'Appointments',
				text : 'An error occurred retriving appointment List',
			});
		}
	});
</script>

</head>
<body>
	<div>
		<div>
			<nav class="navbar navbar-expand-lg navbar-light"
				style="background-color: #e27a39">
				<div class="container-fluid">
					<div class="collapse navbar-collapse" id="navbarNav"
						style="display: flex; justify-content: space-between">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link "
								href="getuser?actionType=consultants">Consultants Available</a></li>
							<li class="nav-item"><a class="nav-link active" href="#"
								style="background-color: white; font-weight: 600; border-radius: 50px; padding-left: 20px; padding-right: 20px; padding-left: 20px; font-weight: 600; padding-right: 20px">Appointments</a></li>

						</ul>

						<div>
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#popup"
								style="background-color: white; color: black; border: none; margin-right: 10px; font-weight: 600; border-radius: 50px">
								Update User</button>
							<a href="user-login.jsp" class="btn btn-primary"
								style="background-color: white; color: black; font-weight: 600; border: none; border-radius: 50px; padding-left: 20px; padding-right: 20px">Logout</a>
						</div>

					</div>
				</div>
			</nav>
		</div>
		<div>
			<div
				style="margin-left: 100px; margin-right: 100px; margin-top: 50px">

				<div
					style="display: flex; justify-content: space-between; text-align: center; align-items: center; margin-bottom: 20px">
					<h3>Appointments</h3>

					<form action="appointmentmanager" method="post">
						<input type="hidden" name="actionType"
							value="fetchAppointmentsForJobSeeker"> <input
							type="hidden" name="jobSeekerId" value="${cookie.userId.value}">
						<button type="submit" style=" border-radius:25px; padding-right: 25px; border: none; background-color:#e27a39 ; padding-left: 25px; padding-top: 5px; padding-bottom: 5px">Show all</button>
					</form>

				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Appointment ID</th>
							<th scope="col">Start Time</th>
							<th scope="col">End Time</th>
							<th scope="col">Duration</th>
							<th scope="col">Appointment Date</th>
							<th scope="col">Job Seeker ID</th>
							<th scope="col">Consultant ID</th>
						</tr>
					</thead>
					<tbody>
						<tag:forEach var="appointment" items="${appointmentList}">
							<tr>
								<td>${appointment.appointmentId}</td>
								<td>${appointment.startTime}</td>
								<td>${appointment.endTime}</td>
								<td>${appointment.duration}</td>
								<td>${appointment.appointmentDate}</td>
								<td>${appointment.jobSeekerId}</td>
								<td>${appointment.consultantId}</td>
							</tr>
						</tag:forEach>
					</tbody>
				</table>

			</div>
		</div>
		<div class="modal fade" id="popup" tabindex="-1" role="dialog"
		aria-labelledby="userModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"
			style="width: 100%; display: flex; justify-content: center; align-items: center">
			<div class="modal-content" style="width: fit-content;">
				<div class="modal-header">
					<h5 class="modal-title" id="userModalLabel">User Details</h5>
					<button type="button" data-ds-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="usermanager" method="post">
						<div
							style="display: flex; justify-content: space-Between; background-color: white; width: 900px; padding: 25px; box-shadow: 5px 5px 5px #0313D; border-radius: 12px">
							<div style="width: 400px;">
								<div class="form-group">
									<label for="exampleInputEmail1">User ID</label> <input
										type="text" class="form-control" id="userId" name="userId"
										placeholder="User ID" value="${cookie.userId.value}" required
										readonly>
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputEmail1">First Name</label> <input
										type="text" class="form-control" id="firstName"
										name="firstName" placeholder="First Name"
										value="${cookie.userFirstName.value}" required>
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputPassword1">Last Name</label> <input
										type="text" class="form-control" id="lastName" name="lastName"
										placeholder="Last Name" required
										value="${cookie.userLastName.value}">
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputEmail1">Age</label> <input
										type="number" class="form-control" id="age" name="age"
										placeholder="Age" required value="${cookie.userAge.value}">
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
								<div class="form-group">
									<label for="exampleInputEmail1">Email</label> <input
										type="email" class="form-control" id="email" name="email"
										placeholder="Email" required value="${cookie.userEmail.value}">
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputPassword1">Phone Number</label> <input
										type="number" class="form-control" id="phoneNumber"
										name="phoneNumber" placeholder="Phone Number" required
										value="${cookie.userPhoneNumber.value}">
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputEmail1">Role</label> <select
										class="form-select" name="role"
										aria-label="Default select example" required>
										<option readonly selected value="${cookie.userRole.value}">${user.role}
										</option>
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
							<input type="hidden" name="actiontype" value="updateSingleUser" />
							<button type="submit" class="btn btn-primary"
								style="width: 100%; background-color: #e27a39; border: none;">Update</button>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>