<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reports</title>

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
							<li class="nav-item"><a class="nav-link"
								href="getuser?actionType=all"
								style="padding-left: 20px; padding-right: 20px; font-weight: 600;">Users</a></li>
							<li class="nav-item"><a class="nav-link active"
								href="admin-reports.jsp"
								style="padding-left: 20px; padding-right: 20px; font-weight: 600; background-color: white; border-radius: 50px;">Reports</a></li>
						</ul>
						<a href="user-login.jsp" class="btn btn-primary"
							style="background-color: white; color: black; border: none; font-weight: 600; border-radius: 50px; padding-left: 20px; padding-right: 20px">Logout</a>
					</div>
				</div>
			</nav>
		</div>
		<div style="margin-left: 100px; margin-right: 100px; margin-top: 50px">

			<div
				style="display: flex; justify-content: space-between; text-align: center; align-items: center; margin-bottom: 20px">
				<h3>Appointments</h3>
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
		<div></div>
	</div>


</body>
</html>