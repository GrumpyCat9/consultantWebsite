package com.codewithnishad.consultantwebsite.model;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

public class Appointment {

	private int appointmentId;
	private int jobSeekerId;
	private int consultantId;
	private LocalDate appointmentDate;
	private Time duration;
	private LocalTime startTime;
	private LocalTime endTime;
	
	public Appointment() {
		
	}

	public Appointment(int appointmentId, int jobSeekerId, int consultantId, LocalDate appointmentDate, Time duration,
			LocalTime startTime, LocalTime endTime) {
		super();
		this.appointmentId = appointmentId;
		this.jobSeekerId = jobSeekerId;
		this.consultantId = consultantId;
		this.appointmentDate = appointmentDate;
		this.setDuration(duration);
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public int getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(int jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}

	public int getConsultantId() {
		return consultantId;
	}

	public void setConsultantId(int consultantId) {
		this.consultantId = consultantId;
	}

	public LocalDate getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(LocalDate appointmentDate) {
		this.appointmentDate = appointmentDate;
	}


	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	public Time getDuration() {
		return duration;
	}

	public void setDuration(Time duration) {
		this.duration = duration;
	}
	
	
	
}
