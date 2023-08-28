<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Seeker home Page</title>

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
							<li class="nav-item"><a class="nav-link active" href="#"
								style="background-color: white; font-weight: 600; border-radius: 50px; padding-left: 20px; padding-right: 20px">Consultants
									Available</a></li>
							<li class="nav-item"><a class="nav-link" href="#"
								style="padding-left: 20px; font-weight: 600; padding-right: 20px">Appointments</a></li>

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
		<div
			style="display: flex; flex-direction: column; justify-content: center; text-align: center; padding: 100px">
			<div>
				<form>
					<input type="hidden" name="actionType" value="consultants">
					<Button type="submit"
						style="height: 50px; padding-right: 25px; padding-left: 25px; border: none; border-radius: 50px; background: black; color: white">Show
						All Consultants</Button>
				</form>


			</div>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">User ID</th>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Email</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<tag:forEach var="user" items="${consultantList}">
							<tr>
								<td>${user.userId}</td>
								<td>${user.firstName}</td>
								<td>${user.lastName}</td>
								<td>${user.gender}</td>
								<td>${user.email}</td>
								<td>
									<div style="display: flex; justify-content: center;">
										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#${user.userId}"
											style="background-color: lightgreen; color: black; border: none; margin-right: 10px; font-weight: 600">
											Add An Appointment</button>
									</div>

								</td>
							</tr>

							<!-- Modal for Update User -->
							<div class="modal fade" id="${user.userId}" tabindex="-1"
								role="dialog" aria-labelledby="userModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document"
									style="width: 100%; display: flex; justify-content: center; align-items: center">
									<div class="modal-content" style="width: fit-content;">
										<div class="modal-header">
											<h5 class="modal-title" id="userModalLabel">User Details</h5>
											<button type="button" data-ds-dismiss="modal"
												aria-label="Close">
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
																type="text" class="form-control" id="userId"
																name="userId" placeholder="User ID"
																value="${user.userId}" required readonly>
														</div>

														<div class="form-group" style="padding-top: 15px">
															<label for="exampleInputEmail1">First Name</label> <input
																type="text" class="form-control" id="firstName"
																name="firstName" placeholder="First Name"
																value="${user.firstName}" required>
														</div>
														<div class="form-group" style="padding-top: 15px">
															<label for="exampleInputPassword1">Last Name</label> <input
																type="text" class="form-control" id="lastName"
																name="lastName" placeholder="Last Name" required
																value="${user.lastName}">
														</div>
														<div class="form-group" style="padding-top: 15px">
															<label for="exampleInputEmail1">Age</label> <input
																type="number" class="form-control" id="age" name="age"
																placeholder="Age" required value="${user.age}">
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
																type="email" class="form-control" id="email"
																name="email" placeholder="Email" required
																value="${user.email}">
														</div>
														<div class="form-group" style="padding-top: 15px">
															<label for="exampleInputPassword1">Phone Number</label> <input
																type="number" class="form-control" id="phoneNumber"
																name="phoneNumber" placeholder="Phone Number" required
																value="${user.phoneNumber}">
														</div>
														<div class="form-group" style="padding-top: 15px">
															<label for="exampleInputEmail1">Role</label> <select
																class="form-select" name="role"
																aria-label="Default select example" required>
																<option disabled selected value="">Role</option>
																<option value="Admin">Admin</option>
																<option value="Job Seeker">Job Seeker</option>
																<option value="Consultant">Consultant</option>
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
													<input type="hidden" name="actiontype" value="update" />
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
						</tag:forEach>
					</tbody>
				</table>
			</div>
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
										placeholder="User ID" value="${user.userId}" required readonly>
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputEmail1">First Name</label> <input
										type="text" class="form-control" id="firstName"
										name="firstName" placeholder="First Name"
										value="${user.firstName}" required>
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputPassword1">Last Name</label> <input
										type="text" class="form-control" id="lastName" name="lastName"
										placeholder="Last Name" required value="${user.lastName}">
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputEmail1">Age</label> <input
										type="number" class="form-control" id="age" name="age"
										placeholder="Age" required value="${user.age}">
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
										placeholder="Email" required value="${user.email}">
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputPassword1">Phone Number</label> <input
										type="number" class="form-control" id="phoneNumber"
										name="phoneNumber" placeholder="Phone Number" required
										value="${user.phoneNumber}">
								</div>
								<div class="form-group" style="padding-top: 15px">
									<label for="exampleInputEmail1">Role</label> <select
										class="form-select" name="role"
										aria-label="Default select example" required>
										<option readonly selected value="${user.role}">${user.role}
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
</body>
</html>