package com.codewithnishad.consultantwebsite.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codewithnishad.consultantwebsite.model.User;
import com.codewithnishad.consultantwebsite.service.UserService;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String message = "";

	private UserService getUserService() {
		return UserService.getUserService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actionType");

		if (actionType.equals("login")) {
			loginUser(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("add")) {
			addUser(request, response);
		} else if (actionType.equals("edit")) {
			editUser(request, response);
		} else if (actionType.equals("delete")) {
			deleteUser(request, response);
		} else if (actionType.equals("login")) {
			loginUser(request, response);
		}
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = new User();

		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setGender(request.getParameter("gender"));
		user.setEmail(request.getParameter("email"));
		user.setPhoneNumber(request.getParameter("phoneNumber"));
		user.setRole(request.getParameter("role"));
		user.setPassword(request.getParameter("password"));

		try {
			if (getUserService().addUser(user)) {
				message = "Registered";

				RequestDispatcher rd = request.getRequestDispatcher("user-login.jsp");
				rd.forward(request, response);
			} else {
				message = "Failed";
			}
		} catch (ClassNotFoundException e) {

			message = e.getMessage();

		} catch (SQLException e) {
			message = e.getMessage();
		}

		request.setAttribute("feedbackMessage", message);

	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			User user = getUserService().loginUser(email, password);

			if (user == null) {
				message = "User not Found";
			} else {
				request.setAttribute("user", user);
				System.out.println("User class: " + user.getRole());
			}

		} catch (ClassNotFoundException e) {

			message = e.getMessage();
		} catch (SQLException e) {

			message = e.getMessage();
		}

		request.setAttribute("feedbackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("user-registration.jsp");
		rd.forward(request, response);

	}

	private void editUser(HttpServletRequest request, HttpServletResponse response) {

	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) {

	}

	private void fetchSingleUser(HttpServletRequest request, HttpServletResponse response) {

	}

	private void fetchAllUsers(HttpServletRequest request, HttpServletResponse response) {

	}

}
