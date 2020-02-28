package com.jung.TeamProject.dto;

import java.sql.Timestamp;

//입점문의 상세보기(UserDto + ApplyDto)
public class ApplyDetailDto {
	
	//회원정보
	private String user_id;
	private String user_name;
	private String user_sex;
	private String user_email;
	private String user_phone;
	private String user_code;
	
	//입점문의 정보
	private int asNo;
	private String asName; 
	private String abNo;
	private String asAd;
	private String asPhone;
	private String asCategory;
	private String aStatus;
	private Timestamp asDate;
	
	public ApplyDetailDto() {
		super();
	}

	public ApplyDetailDto(String user_id, String user_name, String user_sex, String user_email, String user_phone,
			String user_code, int asNo, String asName, String abNo, String asAd, String asPhone, String asCategory,
			String aStatus, Timestamp asDate) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_code = user_code;
		this.asNo = asNo;
		this.asName = asName;
		this.abNo = abNo;
		this.asAd = asAd;
		this.asPhone = asPhone;
		this.asCategory = asCategory;
		this.aStatus = aStatus;
		this.asDate = asDate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public int getAsNo() {
		return asNo;
	}

	public void setAsNo(int asNo) {
		this.asNo = asNo;
	}

	public String getAsName() {
		return asName;
	}

	public void setAsName(String asName) {
		this.asName = asName;
	}

	public String getAbNo() {
		return abNo;
	}

	public void setAbNo(String abNo) {
		this.abNo = abNo;
	}

	public String getAsAd() {
		return asAd;
	}

	public void setAsAd(String asAd) {
		this.asAd = asAd;
	}

	public String getAsPhone() {
		return asPhone;
	}

	public void setAsPhone(String asPhone) {
		this.asPhone = asPhone;
	}

	public String getAsCategory() {
		return asCategory;
	}

	public void setAsCategory(String asCategory) {
		this.asCategory = asCategory;
	}
	
	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public Timestamp getAsDate() {
		return asDate;
	}

	public void setAsDate(Timestamp asDate) {
		this.asDate = asDate;
	}
	
}