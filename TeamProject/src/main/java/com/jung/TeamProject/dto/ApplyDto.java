package com.jung.TeamProject.dto;

import java.sql.Timestamp;

//입점문의 Dto
public class ApplyDto {
	
	private int asNo;
	private String asName; 
	private String abNo;
	private String asLat;
	private String asLng;
	private String asAd;
	private String asPhone;
	private String asCategory;
	private String aStatus;
	private Timestamp asDate;
	private String user_id;
	
	public ApplyDto() {
		super();
	}

	public ApplyDto(int asNo, String asName, String abNo, String asLat, String asLng, String asAd, String asPhone,
			String asCategory, String aStatus, Timestamp asDate, String user_id) {
		super();
		this.asNo = asNo;
		this.asName = asName;
		this.abNo = abNo;
		this.asLat = asLat;
		this.asLng = asLng;
		this.asAd = asAd;
		this.asPhone = asPhone;
		this.asCategory = asCategory;
		this.aStatus = aStatus; //입점문의 처리 상태
		this.asDate = asDate;
		this.user_id = user_id;
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

	public String getAsLat() {
		return asLat;
	}

	public void setAsLat(String asLat) {
		this.asLat = asLat;
	}

	public String getAsLng() {
		return asLng;
	}

	public void setAsLng(String asLng) {
		this.asLng = asLng;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}