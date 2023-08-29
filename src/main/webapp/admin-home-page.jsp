<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>

<tag:if test="${cookie.user.value ne 'Admin'}">
	<tag:redirect url="user-login.jsp" />
</tag:if>

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




<script>

function confirmDelete(userId) {
    return new Promise((resolve) => {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                resolve(true);
            } else {
                resolve(false);
            }
        });
    });
}

document.addEventListener("DOMContentLoaded", function() {
    const deleteForms = document.querySelectorAll('[data-confirm-delete]');
    deleteForms.forEach(form => {
        form.addEventListener('submit', async function(event) {
            event.preventDefault();
            const shouldDelete = await confirmDelete(form.getAttribute('data-confirm-delete'));
            if (shouldDelete) {
                form.submit();
            }
        });
    });
});


	document.addEventListener("DOMContentLoaded", function() {
		var feedbackMessage = "${feedbackMessage}";
		if (feedbackMessage === "User has been successfully updated") {
			Swal.fire({
				icon : 'success',
				title : 'Successfully updated',
				text : 'User has been successfully updated',
			});
		} else if (feedbackMessage === "Failed to update the user") {
			Swal.fire({
				icon : 'error',
				title : 'Update Error',
				text : 'Failed to update the user',
			});
		} else if (feedbackMessage === "User has been successfully deleted") {
			Swal.fire({
				icon : 'success',
				title : 'Successfully Deleted',
				text : 'User has been successfully deleted',
			});
		} else if (feedbackMessage === "Failed to delete user") {
			Swal.fire({
				icon : 'error',
				title : 'Error deleting user',
				text : 'Failed to delete user',
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
							<li class="nav-item"><a class="nav-link active"
								href="getuser?actionType=all"
								style="background-color: white; border-radius: 50px; padding-left: 20px; padding-right: 20px; font-weight: 600;">Users</a></li>
							<li class="nav-item"><a class="nav-link"
								href="user-login.jsp"
								style="padding-left: 20px; padding-right: 20px font-weight: 600;">Reports</a></li>

						</ul>

						<a href="user-login.jsp" class="btn btn-primary"
							style="background-color: white; color: black; border: none; font-weight: 600; border-radius: 50px; padding-left: 20px; padding-right: 20px">Logout</a>
					</div>
				</div>
			</nav>

		</div>
		<div
			style="display: flex; flex-direction: column; margin-left: 100px; margin-right: 100px; margin-top: 50px">
			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-bottom: 25px">
				<h2>Users</h2>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#addUserModal"
					style="border: 1px solid black; background-color: white; color: black; height: 38px; font-weight: 600">Add
					User</button>

			</div>


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
						<th scope="col">Actions</th>
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
							<td>
								<div style="display: flex">
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#${user.userId}"
										style="background-color: lightgreen; color: black; border: none; margin-right: 10px; font-weight: 600">
										Update User</button>
									<form data-confirm-delete="${user.userId}"
										id="deleteForm_${user.userId}" action="usermanager"
										method="post"
										onsubmit="return confirmDelete('${user.userId}')">
										<input type="hidden" name="userId" value="${user.userId}">
										<input type="hidden" name="actiontype" value="delete">
										<button type="submit" class="btn btn-primary"
											style="background-color: red; color: black; border: none; font-weight: 600">
											Delete User</button>
									</form>
								</div>

							</td>
						</tr>

						<!-- Modal for Update User -->
						<div class="modal fade" id="${user.userId}" tabindex="-1"
							role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
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

			<!-- Modal for Add User -->
			<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog"
				aria-labelledby="addUserModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document"
					style="width: 100%; display: flex; justify-content: center; align-items: center">
					<div class="modal-content" style="width: fit-content;">
						<div class="modal-header">
							<h5 class="modal-title" id="addUserModalLabel">Add User</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="usermanager" method="post">
								<div
									style="display: flex; justify-content: space-Between; background-color: white; width: 900px; padding: 25px; box-shadow: 5px 5px 5px #0313D; border-radius: 12px">
									<div style="width: 400px;">
										<div class="form-group">
											<label for="exampleInputEmail1">First Name</label> <input
												type="text" class="form-control" id="firstName"
												name="firstName" placeholder="First Name" required>
										</div>
										<div class="form-group" style="padding-top: 15px">
											<label for="exampleInputPassword1">Last Name</label> <input
												type="text" class="form-control" id="lastName"
												name="lastName" placeholder="Last Name" required>
										</div>
										<div class="form-group" style="padding-top: 15px">
											<label for="exampleInputEmail1">Age</label> <input
												type="number" class="form-control" id="age" name="age"
												placeholder="Age" required>
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
												placeholder="Email" required>
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
												<option value="Admin">Admin</option>
												<option value="Receptionist">Receptionist</option>
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
									<input type="hidden" name="actiontype" value="newUser" />
									<button type="submit" class="btn btn-primary"
										style="width: 100%; background-color: #e27a39; border: none;">Add
										User</button>
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
	</div>

</body>
</html>