package com.codewithnishad.consultantwebsite.service;

import java.sql.SQLException;
import java.util.List;

import com.codewithnishad.consultantwebsite.dao.AppointmentManager;
import com.codewithnishad.consultantwebsite.dao.AppointmentManagerImpl;
import com.codewithnishad.consultantwebsite.model.Appointment;

public class AppointmentService {
	
	private static AppointmentService appointmentServiceObj;
	
	

	public AppointmentService() {

	}
	
	public synchronized static AppointmentService getAppointmentService() {
		if(appointmentServiceObj == null) {
			appointmentServiceObj = new AppointmentService();
		}
		
		return appointmentServiceObj;
	}

	public AppointmentManager getAppointmentManager() {
		return new AppointmentManagerImpl();
	}

	public boolean addAppointment(Appointment appointment) throws ClassNotFoundException, SQLException {
		return getAppointmentManager().addAppointment(appointment);
	}

	public boolean deleteAppointment(int appointmentId) throws ClassNotFoundException, SQLException {
		return getAppointmentManager().deleteAppointment(appointmentId);
	}

	public List<Appointment> fetchAppointmentsforConsultants(int consultantId) throws ClassNotFoundException, SQLException {

		return getAppointmentManager().fetchAppointmentsforConsultants(consultantId);
	}

	public List<Appointment> fetchAppointmentsForJobSeeker(int jobSeekerId) throws ClassNotFoundException, SQLException {

		return getAppointmentManager().fetchAppointmentsForJobSeeker(jobSeekerId);
	}

	public List<Appointment> fetchAllAppointments() throws ClassNotFoundException, SQLException {

		return getAppointmentManager().fetchAllAppointments();
	}
}
