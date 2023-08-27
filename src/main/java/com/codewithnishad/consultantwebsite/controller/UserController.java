package com.codewithnishad.consultantwebsite.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		} else if (actionType.equals("all")) {
			fetchAllUsers(request, response);
		} else if (actionType.equals("single")) {
			fetchSingleUser(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actiontype");

		if (actionType.equals("add")) {
			addUser(request, response);
		} else if (actionType.equals("update")) {
			editUser(request, response);
		} else if (actionType.equals("delete")) {
			deleteUser(request, response);
		} else if (actionType.equals("login")) {
			loginUser(request, response);
		}
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

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
				message = "Email already in Use";
				RequestDispatcher rd = request.getRequestDispatcher("user-registration.jsp");
				rd.forward(request, response);
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

		clearMessage();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			User user = getUserService().loginUser(email, password);

			if (user == null) {
				message = "User not Found";
			} else {
				request.setAttribute("user", user);

				if (user.getRole().equals("Admin")) {
					response.sendRedirect("getuser?actionType=all");
					return;
				} else if (user.getRole().equals("Job Seeker")) {
					response.sendRedirect("jobSeeker-home-page.jsp");
					return;
				} else if (user.getRole().equals("Consultant")) {
					response.sendRedirect("jobConsultant-home-page.jsp");
					return;
				}

			}

		} catch (ClassNotFoundException e) {

			message = e.getMessage();
		} catch (SQLException e) {

			message = e.getMessage();
		}

		request.setAttribute("feedbackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("user-login.jsp");
		rd.forward(request, response);

	}

	private void editUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		clearMessage();

		User user = new User();

		user.setUserId(Integer.parseInt(request.getParameter("userId")));
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setGender(request.getParameter("gender"));
		user.setEmail(request.getParameter("email"));
		user.setPhoneNumber(request.getParameter("phoneNumber"));
		user.setRole(request.getParameter("role"));
		user.setPassword(request.getParameter("password"));

		try {
			if (getUserService().editUser(user)) {
				message = "User has been successfully updated";
			} else {
				message = "Failed to update the user";
			}
		} catch (ClassNotFoundException e) {

			message = e.getMessage();
		} catch (SQLException e) {

			message = e.getMessage();
		}

		request.setAttribute("feedbackMessage", message);
		response.sendRedirect("getuser?actionType=all");
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		clearMessage();

		int userId = Integer.parseInt(request.getParameter("userId"));

		try {
			if (getUserService().deleteUser(userId)) {
				message = "User has been successfully deleted";
			} else {
				message = "Failed to delete user";
			}
		} catch (ClassNotFoundException e) {

			message = e.getMessage();
		} catch (SQLException e) {

			message = e.getMessage();
		}
		
		request.setAttribute("feedbackMessage", message);
		
		response.sendRedirect("getuser?actionType=all");
	}

	private void fetchSingleUser(HttpServletRequest request, HttpServletResponse response) {

	}

	private void fetchAllUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<User> userList = new ArrayList<User>();

		try {
			userList = getUserService().fetchAllUsers();

			if (!(userList.size() > 0)) {
				message = "No Users Found!";

				System.out.print(message);
			}

		} catch (ClassNotFoundException e) {
			message = e.getMessage();
		} catch (SQLException e) {
			message = e.getMessage();
		}

		System.out.print(message);

		request.setAttribute("userList", userList);
		request.setAttribute("feedbackMessage", message);

		RequestDispatcher rd = request.getRequestDispatcher("admin-home-page.jsp");
		rd.forward(request, response);

		clearMessage();

	}

	private void clearMessage() {
		message = "";
	}

}
