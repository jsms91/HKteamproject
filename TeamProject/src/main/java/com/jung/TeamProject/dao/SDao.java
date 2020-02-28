package com.jung.TeamProject.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.jung.TeamProject.dto.StoreDto;
import com.jung.TeamProject.dto.ApplyDetailDto;
import com.jung.TeamProject.dto.ApplyDto;
import com.jung.TeamProject.dto.MenuDto;
import com.jung.TeamProject.dto.OrderDetailDto;
import com.jung.TeamProject.dto.OrderDto;

public interface SDao {
	
	//가게등록시 회원아이디 첨부해서 가게등록 화면 띄우기
	public ArrayList<ApplyDto> RegisterView(String user_id);
	
	//가게등록
	public void Register(String sName, String bName, String bNo, String sImg, String sAd, String sLat, String sLng,
							String sPhone, String sCategory, int sTip, int mPrice, String user_id);
	
	//가게등록하면 입점처리상태가 처리완료로 바꾸기
	public void ApplyStatusEnd(int asNo);
	
	//가게목록(관리자)
	public ArrayList<StoreDto> Storelist();
	
	//내 가게목록(사장)
	public ArrayList<StoreDto> MyStorelist(String user_id);
	
	//가게상세목록
	public ArrayList<StoreDto> StoreDetail(int sNo);
	
	//가게내용 수정화면 + 가게이미지 수정 화면으로 이동(관리자)
	public ArrayList<StoreDto> RegisterContent(int sNo);
	
	//가게수정(관리자)
	public void StoreModify(int sNo, String sName, String bName, String bNo, String sAd, String sLat, String sLng,
			String sPhone, String sCategory, int sTip, int mPrice);
	
	//가게수정(사장)
	public void BSModify(int sNo, int sTip, int mPrice);
	
	//가게 이미지 수정(관리자)
	public void ImgModify(int sNo, String sImg);
	
	//가게 삭제(관리자)
	public void StoreDelete(int sNo);
	
	//가게찾기(카테고리)
	public ArrayList<StoreDto> Category(String sLat, String sLng, String sCategory);
	
	//가게찾기(메인 + 전체보기)
	public ArrayList<StoreDto> AdSearch(String sLat, String sLng);
	
	//=========================================================================
	
	//입점문의등록(사장)
	public String Apply(String asName, String abNo, String asLat, String asLng, String asAd, String asPhone,
			String asCategory, String user_id);
	
	//입점문의 목록(관리자) 현재는 사장도 같이 보지만 사장꺼는 사장아이디 조건 추가해서 새로만들기
	public ArrayList<ApplyDto> Applylist();
	
	//입점문의 목록(사장) 만들어야됨
	public ArrayList<ApplyDto> MyApplylist(String user_id);
	
	//입점문의 상세목록(문의내용 + 문의한 회원정보) - (관리자, 사장)
	public ArrayList<ApplyDetailDto> ApplyDetail(int asNo);
	
	//입점문의 수정화면으로 이동(사장)
	public ArrayList<ApplyDto> ApplyContent(int asNo);
	
	//입점문의 수정(사장)
	public void ApplyModify(int asNo, String asName, String abNo, String asLat, String asLng, String asAd, String asPhone,
			String asCategory);
	
	//입점문의 삭제 (사장)
	public void ApplyDelete(int asNo);
	
	//=========================================================================
	
	//메뉴등록
	public String MenuRegister(String mName, String mImg, int mPrice, String mTitle1, String mTitle2, String mInfo, int sNo);
	
	//메뉴 수정(내용만)
	public void MenuModify(int mNo, String mName, int mPrice, String mInfo);
	
	//메뉴 이미지 수정화면
	public ArrayList<MenuDto> MImgModify(int mNo);
	
	//메뉴 이미지 수정
	public void BMImgModify(int mNo, String mImg);
	
	//대표메뉴 리스트
	public ArrayList<MenuDto> MTList(int sNo);
	
	//메인메뉴 리스트
	public ArrayList<MenuDto> MMList(int sNo);
	
	//사이드 메뉴 리스트
	public ArrayList<MenuDto> MSList(int sNo);
	
	//메뉴 삭제
	public void MenuDelete(int sNO);
	
	//=========================================================================
	
	//Today 주문내역(사장)
	public ArrayList<OrderDto> MyStoreOrder(OrderDto dto);
	
	//Today 주문상태별 리스트(사장)
	public ArrayList<OrderDto> StatusOrderList(OrderDto dto);
	
	//주문상세내역-주소(사장)
	public ArrayList<OrderDto> OrderDetail1(OrderDto dto);
	
	//주문상세내역-메뉴(사장)
	public ArrayList<OrderDetailDto> OrderDetail2(OrderDetailDto dto);
	
	//주문내역 주문상태처리 수정(사장)
	public void oStatusModify(OrderDto dto);
	
	//주문전체내역(사장)
	public ArrayList<OrderDto> AllOrderList(OrderDto dto);
	
	//전체주문 날짜조회한 목록(사장)
	public ArrayList<OrderDto> AllOrderCheck(String user_id, Date oDate, Date oDate1);
		
}