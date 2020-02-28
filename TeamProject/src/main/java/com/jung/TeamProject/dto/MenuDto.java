package com.jung.TeamProject.dto;

import java.sql.Timestamp;

public class MenuDto {
	
	private int mNo;
	private String mName;
	private String mImg;
	private int mPrice;
	private String mTitle1;
	private String mTitle2;
	private String mInfo;
	private Timestamp mDate;
	private int sNo;
	private String dImg; //사진수정시 기존사진삭제하기위해 필요
	
	public MenuDto() {
		super();
	}

	public MenuDto(int mNo, String mName, String mImg, int mPrice, String mTitle1, String mTitle2, String mInfo,
								Timestamp mDate, int sNo, String dImg) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.mImg = mImg;
		this.mPrice = mPrice;
		this.mTitle1 = mTitle1;
		this.mTitle2 = mTitle2;
		this.mInfo = mInfo;
		this.mDate = mDate;
		this.sNo = sNo;
		this.dImg = dImg;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	public int getmPrice() {
		return mPrice;
	}

	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}

	public String getmTitle1() {
		return mTitle1;
	}

	public void setmTitle1(String mTitle1) {
		this.mTitle1 = mTitle1;
	}

	public String getmTitle2() {
		return mTitle2;
	}

	public void setmTitle2(String mTitle2) {
		this.mTitle2 = mTitle2;
	}
	
	public String getmInfo() {
		return mInfo;
	}

	public void setmInfo(String mInfo) {
		this.mInfo = mInfo;
	}

	public Timestamp getmDate() {
		return mDate;
	}

	public void setmDate(Timestamp mDate) {
		this.mDate = mDate;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getdImg() {
		return dImg;
	}

	public void setdImg(String dImg) {
		this.dImg = dImg;
	}
	
}