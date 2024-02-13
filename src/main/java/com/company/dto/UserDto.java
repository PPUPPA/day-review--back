package com.company.dto;

public class UserDto {
	private String user_id, user_pass, user_phone, user_join, user_ip;
	
	public UserDto() {
		super();
	}
	public UserDto(String user_id, String user_pass, String user_phone, String user_join, String user_ip) {
		super();
		this.user_id = user_id;
		this.user_pass = user_pass;
		this.user_phone = user_phone;
		this.user_join = user_join;
		this.user_ip = user_ip;
	}
	
	@Override
	public String toString() {
		return "UserDto [user_id=" + user_id + ", user_pass=" + user_pass + ", user_phone=" + user_phone
				+ ", user_join=" + user_join + ", user_ip=" + user_ip + "]";
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_join() {
		return user_join;
	}
	public void setUser_join(String user_join) {
		this.user_join = user_join;
	}
	public String getUser_ip() {
		return user_ip;
	}
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
}
