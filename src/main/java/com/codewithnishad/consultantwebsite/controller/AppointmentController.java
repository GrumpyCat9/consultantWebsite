package com.codewithnishad.consultantwebsite.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codewithnishad.consultantwebsite.model.Appointment;
import com.codewithnishad.consultantwebsite.service.AppointmentService;

public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String message = "";

	private AppointmentService getAppointmentService() {
		return AppointmentService.getAppointmentService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actionType");

		if (actionType.equals("allAppointments")) {
			getAllAppointments(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionType = request.getParameter("actionType");

		if (actionType.equals("addAppointment")) {
			addAppointment(request, response);
		} else if (actionType.equals("deleteAppointment")) {
			deleteAppointment(request, response);
		} else if (actionType.equals("fetchAppointmentsForConsultants")) {
			getAppointmentsForConsultants(request, response);
		} else if (actionType.equals("fetchAppointmentsForJobSeeker")) {
			getAppointmentsForJobSeeker(request, response);
		}
	}

	private void addAppointment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Appointment appointment = new Appointment();

		int consultantId = Integer.parseInt(request.getParameter("consultantId"));
		int jobSeekerId = Integer.parseInt(request.getParameter("jobSeekerId"));
		String startTimeStr = request.getParameter("startTime");
		String endTimeStr = request.getParameter("endTime");
		String appointmentDateStr = request.getParameter("appointmentDate");

		// Parse the time and date strings into LocalTime and LocalDate objects
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		LocalTime startTime = LocalTime.parse(startTimeStr, timeFormatter);
		LocalTime endTime = LocalTime.parse(endTimeStr, timeFormatter);
		LocalDate appointmentDate = LocalDate.parse(appointmentDateStr, dateFormatter);

		// Set the properties in the appointment object
		appointment.setStartTime(startTime);
		appointment.setEndTime(endTime);
		appointment.setAppointmentDate(appointmentDate);
		appointment.setConsultantId(consultantId);
		appointment.setJobSeekerId(jobSeekerId);

		try {
			if (getAppointmentService().addAppointment(appointment)) {
				message = "Appointment has been added";
			}
		} catch (ClassNotFoundException e) {
			message = e.getMessage();
		} catch (SQLException e) {
			message = e.getMessage();
		}

		request.setAttribute("feedbackMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("jobSeeker-home-page.jsp");
		rd.forward(request, response);
	}

	private void deleteAppointment(HttpServletRequest request, HttpServletResponse response) {

	}

	private void getAppointmentsForConsultants(HttpServletRequest request, HttpServletResponse response) {
		try {

			int jobConsultantId = Integer.parseInt(request.getParameter("jobConsultantId"));

			List<Appointment> appointmentList = getAppointmentService().fetchAppointmentsforConsultants(jobConsultantId);

			if (!(appointmentList.size() > 0)) {
				message = "No Appointments Scheduled";
			}

			request.setAttribute("appointmentList", appointmentList);
			request.setAttribute("feedbackMessage", message);


			RequestDispatcher rd = request.getRequestDispatcher("jobConsultant-home-page.jsp");
			rd.forward(request, response);

		} catch (NumberFormatException e) {
			message = e.getMessage();
		} catch (Exception e) {
			message = e.getMessage();
		}
	}

	private void getAppointmentsForJobSeeker(HttpServletRequest request, HttpServletResponse response) {
		try {

			int jobSeekerId = Integer.parseInt(request.getParameter("jobSeekerId"));

			List<Appointment> appointmentList = getAppointmentService().fetchAppointmentsForJobSeeker(jobSeekerId);

			if (!(appointmentList.size() > 0)) {
				message = "No Appointments Scheduled";
			}

			request.setAttribute("appointmentList", appointmentList);
			request.setAttribute("feedbackMessage", message);

			RequestDispatcher rd = request.getRequestDispatcher("jobSeeker-appointments-page.jsp");
			rd.forward(request, response);

		} catch (NumberFormatException e) {
			message = e.getMessage();
		} catch (Exception e) {
			message = e.getMessage();
		}
	}

	private void getAllAppointments(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Appointment> appointmentList = new ArrayList<Appointment>();

		try {
			appointmentList = getAppointmentService().fetchAllAppointments();

			if (!(appointmentList.size() > 0)) {
				message = "No Appointments Scheduled";
			}

			request.setAttribute("appointmentList", appointmentList);
			request.setAttribute("feedbackMessage", message);

			RequestDispatcher rd = request.getRequestDispatcher("admin-reports.jsp");
			rd.forward(request, response);

		} catch (ClassNotFoundException e) {
			message = e.getMessage();
		} catch (SQLException e) {
			message = e.getMessage();
		}

	}

}
