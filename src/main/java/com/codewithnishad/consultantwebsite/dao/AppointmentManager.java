package com.codewithnishad.consultantwebsite.dao;

import java.sql.SQLException;
import java.util.List;

import com.codewithnishad.consultantwebsite.model.Appointment;

public interface AppointmentManager {

	public boolean addAppointment(Appointment appointment) throws ClassNotFoundException, SQLException;

	public boolean deleteAppointment(int appointmentId) throws ClassNotFoundException, SQLException;
	
	public List<Appointment> fetchAppointmentsforConsultants(int consultantId) throws ClassNotFoundException, SQLException;
	
	public List<Appointment> fetchAppointmentsForJobSeeker(int jobSeekerId) throws ClassNotFoundException, SQLException;
	
	public List<Appointment> fetchAllAppointments() throws ClassNotFoundException, SQLException;

}
