package com.codewithnishad.consultantwebsite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.codewithnishad.consultantwebsite.model.Appointment;

public class AppointmentManagerImpl implements AppointmentManager {

	public AppointmentManagerImpl() {

	}

	private Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://127.0.0.1:3306/job_consultant_db";
		String userName = "root";
		String password = "dXsAIgMek0aEFdt";

		Connection connection = DriverManager.getConnection(url, userName, password);

		return connection;
	}

	@Override
	public boolean addAppointment(Appointment appointment) throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();

		String query = "INSERT INTO appointments (jobSeekerId, consultantId, appointmentDate, startTime, endTime) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement ps = connection.prepareStatement(query);

		ps.setInt(1, appointment.getJobSeekerId());
		ps.setInt(2, appointment.getConsultantId());
		ps.setDate(3, appointment.getAppointmentDate());
		ps.setTime(4, appointment.getStartTime());
		ps.setTime(5, appointment.getEndTime());

		boolean result = false;

		if (ps.executeUpdate() > 0)
			result = true;

		ps.close();
		connection.close();

		return result;
	}

	@Override
	public boolean deleteAppointment(int appointmentId) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();

		String query = "DELETE FROM appointments WHERE appointmentId = ?";

		PreparedStatement ps = connection.prepareStatement(query);

		ps.setInt(1, appointmentId);

		boolean result = false;

		if (ps.executeUpdate() > 0)
			result = true;

		ps.close();
		connection.close();

		return result;
	}

	@Override
	public List<Appointment> fetchAppointmentsforConsultants(int consultantId)
			throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();

		String query = "SELECT * FROM appointments WHERE consultantId = ?";

		PreparedStatement ps = connection.prepareStatement(query);

		ps.setInt(1, consultantId);

		List<Appointment> appointmentList = new ArrayList<Appointment>();

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Appointment appointment = new Appointment();

			appointment.setAppointmentId(rs.getInt("appointmentId"));
			appointment.setStartTime(rs.getTime("startTime"));
			appointment.setEndTime(rs.getTime("endTime"));
			appointment.setDuration(rs.getTime("duration"));
			appointment.setAppointmentDate(rs.getDate("appointmentDate"));
			appointment.setJobSeekerId(rs.getInt("jobSeekerId"));
			appointment.setConsultantId(rs.getInt("consultantId"));

			appointmentList.add(appointment);
		}

		ps.close();
		connection.close();

		return appointmentList;
	}

	@Override
	public List<Appointment> fetchAppointmentsForJobSeeker(int jobSeekerId)
			throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();

		String query = "SELECT * FROM appointments WHERE jobSeekerId = ?";

		PreparedStatement ps = connection.prepareStatement(query);

		ps.setInt(1, jobSeekerId);

		List<Appointment> appointmentList = new ArrayList<Appointment>();

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Appointment appointment = new Appointment();

			appointment.setAppointmentId(rs.getInt("appointmentId"));
			appointment.setStartTime(rs.getTime("startTime"));
			appointment.setEndTime(rs.getTime("endTime"));
			appointment.setDuration(rs.getTime("duration"));
			appointment.setAppointmentDate(rs.getDate("appointmentDate"));
			appointment.setJobSeekerId(rs.getInt("jobSeekerId"));
			appointment.setConsultantId(rs.getInt("consultantId"));

			appointmentList.add(appointment);
		}

		ps.close();
		connection.close();

		return appointmentList;
	}

	@Override
	public List<Appointment> fetchAllAppointments() throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();

		String query = "SELECT * FROM appointments";

		Statement st = connection.createStatement();

		List<Appointment> appointmentList = new ArrayList<Appointment>();

		ResultSet rs = st.executeQuery(query);

		while (rs.next()) {
			Appointment appointment = new Appointment();

			appointment.setAppointmentId(rs.getInt("appointmentId"));
			appointment.setStartTime(rs.getTime("startTime"));
			appointment.setEndTime(rs.getTime("endTime"));
			appointment.setDuration(rs.getTime("duration"));
			appointment.setAppointmentDate(rs.getDate("appointmentDate"));
			appointment.setJobSeekerId(rs.getInt("jobSeekerId"));
			appointment.setConsultantId(rs.getInt("consultantId"));

			appointmentList.add(appointment);
		}

		st.close();
		connection.close();

		return appointmentList;
	}

}
