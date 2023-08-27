<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>

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
							<li class="nav-item"><a class="nav-link active"
								href="getuser?actionType=all"
								style="background-color: white; border-radius: 50px; padding-left: 20px; padding-right: 20px">Users</a></li>
							<li class="nav-item"><a class="nav-link"
								href="user-login.jsp"
								style="padding-left: 20px; padding-right: 20px">Reports</a></li>

						</ul>

						<a href="user-login.jsp" class="btn btn-primary"
							style="background-color: white; color: black; border: none; border-radius: 50px; padding-left: 20px; padding-right: 20px">Logout</a>
					</div>
				</div>
			</nav>

		</div>
		<div
			style="display: flex; flex-direction: column; margin-left: 100px; margin-right: 100px; margin-top: 50px">
			<h2>Users</h2>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">User ID</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Age</th>
						<th scope="col">Gender</th>
						<th scope="col">Role</th>
						<th scope="col">Email</th>
						<th scope="col">Phone Number</th>
					</tr>
				</thead>
				<tbody>
					<tag:forEach var="user" items="${userList}">
						<tr>
							<td>${user.userId}</td>
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.age}</td>
							<td>${user.gender}</td>
							<td>${user.role}</td>
							<td>${user.email}</td>
							<td>${user.phoneNumber}</td>
						</tr>
					</tag:forEach>


				</tbody>
			</table>
		</div>

	</div>

</body>
</html>