package com.codewithnishad.consultantwebsite.model;

import java.sql.Date;
import java.sql.Time;

public class Appointment {

	private int appointmentId;
	private int jobSeekerId;
	private int consultantId;
	private Date appointmentDate;
	private Time duration;
	private Time startTime;
	private Time endTime;
	
	public Appointment() {
		
	}

	public Appointment(int appointmentId, int jobSeekerId, int consultantId, Date appointmentDate, Time duration,
			Time startTime, Time endTime) {
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

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}


	public Time getStartTime() {
		return startTime;
	}

	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}

	public Time getEndTime() {
		return endTime;
	}

	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}

	public Time getDuration() {
		return duration;
	}

	public void setDuration(Time duration) {
		this.duration = duration;
	}
	
	
	
}
