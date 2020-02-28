package com.jung.TeamProject.dto;

import java.util.Date;

public class OrderDto {
	
	private String oNo;
	private String osName; //업체명
	private String oName;
	private String oAd1;
	private String oAd2;
	private String oPhone;
	private String oText; //요청사항
	private int oAmount; //총금액
	private String oStatus; //주문처리상태
	private String user_id;
	private Date oDate;
	private Date oDate1;
	private int sNo; //업체코드
	
	public OrderDto() {
		super();
	}
	
	public OrderDto(String oNo, String osName, String oName, String oAd1, String oAd2, String oPhone, String oText, int oAmount, 
						String oStatus, String user_id, Date oDate, Date oDate1, int sNo) {
		super();
		this.oNo = oNo;
		this.osName = osName;
		this.oName = oName;
		this.oAd1 = oAd1;
		this.oAd2 = oAd2;
		this.oPhone = oPhone;
		this.oText = oText;
		this.oAmount = oAmount;
		this.oStatus = oStatus;
		this.user_id = user_id;
		this.oDate = oDate;
		this.oDate1 = oDate1;
		this.sNo = sNo;
	}

	public String getoNo() {
		return oNo;
	}

	public void setoNo(String oNo) {
		this.oNo = oNo;
	}

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoAd1() {
		return oAd1;
	}

	public void setoAd1(String oAd1) {
		this.oAd1 = oAd1;
	}

	public String getoAd2() {
		return oAd2;
	}

	public void setoAd2(String oAd2) {
		this.oAd2 = oAd2;
	}

	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}

	public String getoText() {
		return oText;
	}

	public void setoText(String oText) {
		this.oText = oText;
	}

	public int getoAmount() {
		return oAmount;
	}

	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	
	public Date getoDate1() {
		return oDate1;
	}

	public void setoDate1(Date oDate1) {
		this.oDate1 = oDate1;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

}