package com.jung.TeamProject.dto;

import java.sql.Timestamp;

//가게정보Dto(가게등록,등록리스트-관리자, 찾은가게리스트 + 각카테고리별 리스트 - 고객(메인페이지), 내가게리스트 - 사장 )
//상세리스트도 여기 변수로 했기때문에 따로 안만듬
public class StoreDto {
	
	private int sNo; //업체번호
	private String sName; //업체명
	private String bName; //업주명
	private String bNo; //사업자번호
	private String sImg; //가게이미지
	private String sAd; //가게한글주소
	private String sLat; //위도
	private String sLng; //경도
	private String sPhone; //가게전화번호
	private String sCategory; //카테고리
	private int sTip; //배달팁
	private int mPrice; //최소주문금액
	private Timestamp sDate; //등록일
	private String user_id; //회원아이디(FK)
	
	
	
	private String dImg; //가게 이미지 삭제하기 위해서 필요
	
	public StoreDto() {
		super();
	}

	public StoreDto(int sNo, String sName, String bName, String bNo, String sImg, String sAd, String sLat, String sLng,
			String sPhone, String sCategory, int sTip, int mPrice, Timestamp sDate, String user_id, String dImg) {
		super();
		this.sNo = sNo;
		this.sName = sName;
		this.bName = bName;
		this.bNo = bNo;
		this.sImg = sImg;
		this.sAd = sAd;
		this.sLat = sLat;
		this.sLng = sLng;
		this.sPhone = sPhone;
		this.sCategory = sCategory;
		this.sTip = sTip;
		this.mPrice = mPrice;
		this.sDate = sDate;
		this.user_id = user_id;
		
		this.dImg = dImg;
	
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbNo() {
		return bNo;
	}

	public void setbNo(String bNo) {
		this.bNo = bNo;
	}

	public String getsImg() {
		return sImg;
	}

	public void setsImg(String sImg) {
		this.sImg = sImg;
	}

	public String getsAd() {
		return sAd;
	}

	public void setsAd(String sAd) {
		this.sAd = sAd;
	}

	public String getsLat() {
		return sLat;
	}

	public void setsLat(String sLat) {
		this.sLat = sLat;
	}

	public String getsLng() {
		return sLng;
	}

	public void setsLng(String sLng) {
		this.sLng = sLng;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public int getsTip() {
		return sTip;
	}

	public void setsTip(int sTip) {
		this.sTip = sTip;
	}

	public int getmPrice() {
		return mPrice;
	}

	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}

	public Timestamp getsDate() {
		return sDate;
	}

	public void setsDate(Timestamp sDate) {
		this.sDate = sDate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	
	
	

	public String getdImg() {
		return dImg;
	}

	public void setdImg(String dImg) {
		this.dImg = dImg;
	}
	
	
		
}