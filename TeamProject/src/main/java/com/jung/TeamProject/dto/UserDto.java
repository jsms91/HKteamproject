package com.jung.TeamProject.dto;

import java.sql.Timestamp;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

//회원정보 Dto(회원가입, 회원리스트)
public class UserDto {
	
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_sex;
	private String user_email;
	private String user_phone;
	private String user_profile;
	private String user_ag1;
	private String user_ag2;
	private String user_code;
	private Timestamp user_date;
	
	public UserDto() {
		super();
	}

	public UserDto(int user_no, String user_id, String user_pw, String user_name, String user_sex,
			String user_email, String user_phone, String user_profile, String user_ag1, String user_ag2,
			String user_code, Timestamp user_date) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_profile = user_profile;
		this.user_ag1 = user_ag1;
		this.user_ag2 = user_ag2;
		this.user_code = user_code;
		this.user_date = user_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}

	public String getUser_ag1() {
		return user_ag1;
	}

	public void setUser_ag1(String user_ag1) {
		this.user_ag1 = user_ag1;
	}

	public String getUser_ag2() {
		return user_ag2;
	}

	public void setUser_ag2(String user_ag2) {
		this.user_ag2 = user_ag2;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public Timestamp getUser_date() {
		return user_date;
	}

	public void setUser_date(Timestamp user_date) {
		this.user_date = user_date;
	}

}