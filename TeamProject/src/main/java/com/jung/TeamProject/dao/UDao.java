package com.jung.TeamProject.dao;

import java.util.ArrayList;
import java.util.Date;

import com.jung.TeamProject.dto.OrderDetailDto;
import com.jung.TeamProject.dto.OrderDto;
import com.jung.TeamProject.dto.UserDto;

public interface UDao {
	
	//가입
	public String Join(String user_id, String user_pw, String user_name, String user_sex, String user_email, 
							String user_phone, String user_profile, String user_ag1, String user_ag2, String user_code);
	
	//아이디 중복체크
	public String IdCheck(UserDto dto1);
	
	//회원목록
	public ArrayList<UserDto> Userlist();
	
	//회원 상세목록
	public ArrayList<UserDto> UserDetail(int user_no);
	
	//임시비밀번호 변경
	public int update_pw(UserDto dto);
	
	//비밀번호 변경
	public void pwModiDo(UserDto dto);
	
	//회원정보 변경
	public void memberModiDo(UserDto dto);
	
	//회원정보 삭제
	public void memberDelDo(UserDto dto);
	
	//메뉴 주문(주소내역)
	public String Order1(String oNo, String osName, String oName, String oAd1, String oAd2, String oPhone, String oText, 
							int oAmount, String user_id, Date oDate, int sNo);
	
	//메뉴 주문(상세내역)
	public void Order(int omNo, String omName, int omStock, int omPrice, String oNo);
	
	//회원 주문 목록
	public ArrayList<OrderDto> MyOrderInfo(OrderDto dto);
	
	//회원 주문 날짜조회한 목록
	public ArrayList<OrderDto> OrderDcheck(String user_id, Date oDate, Date oDate1);
	
	//회원 주문 상세목록(주문테이블)
	public ArrayList<OrderDto> MyOrderInfoDetail(OrderDto dto);
	
	//회원 주문 상세목록(주문상세 테이블)
	public ArrayList<OrderDetailDto> MyOrderInfoDetail1(OrderDetailDto dto);
	
}