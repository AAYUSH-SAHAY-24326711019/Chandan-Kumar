package com.messages;

public class Enquiry {

	private int enquiry_id;
	private String user_type;
	private String contact;
	private String email;
	private String message;
	private String date_time;
	
	public void setDateTime(String date_time) {
		this.date_time=date_time;
	}
	
	public String getDateTime() {
		return date_time;
	}
	
	public void setEnquiry_id(int id) {
		enquiry_id = id;
	}
	
	public int getEnquiry_id() {
		return enquiry_id;
	}
	
	public void setUser_type(String user) {
		user_type=user;
	}
	
	public String getUser_type() {
		return user_type;
	}
	
	public void setContact(String contact) {
		this.contact=contact;
	}
	
	public String getContact() {
		return contact;
	}
	
	public void setEmail(String email) {
		this.email=email;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setMessage(String message) {
		this.message=message;
	}
	
	public String getMessage() {
		return message;
	}
}
