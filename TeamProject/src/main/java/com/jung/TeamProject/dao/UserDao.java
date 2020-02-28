package com.jung.TeamProject.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.jung.TeamProject.dto.OrderDetailDto;
import com.jung.TeamProject.dto.OrderDto;
import com.jung.TeamProject.dto.UserDto;

//mybatis사용을 위해서는 SqlSession클래스를 이용함
@Repository //DAO클래스를 나타내며  bean클래스로 사용 가능케 함
//(@Controller,@Service는 Command클래스,@Repository는 Dao클래스)
public class UserDao implements UDao {
	
	JdbcTemplate template;
	
	@Autowired
	private SqlSession sqlSession; //field로 autowired
	
	public UserDao() {	
	}	

	//회원가입
	@Override
	public String Join(String user_id, String user_pw, String user_name, String user_sex, String user_email, 
							String user_phone, String user_profile, String user_ag1, String user_ag2, String user_code) {
		
		UserDto dto = new UserDto(0, user_id, user_pw, user_name, user_sex, user_email, user_phone, 
															user_profile, user_ag1, user_ag2, user_code, null);
		
		System.out.println("가입 시작1");
		
		int result;
		
		result = sqlSession.insert("Join",dto);
		System.out.println("result : " + result);
		
		if(result > 0)	{ //1이면 가입성공
			return "join-success";
		}
		else {
			return "join-failed";
		}
		
	}
	
	//회원리스트
	@Override 
	public ArrayList<UserDto> Userlist() {
		ArrayList<UserDto> result = (ArrayList) sqlSession.selectList("Userlist");
		System.out.println("DB 값 : " + result);
		return result;
	}
	
	//회원상세정보
	@Override
	public ArrayList<UserDto> UserDetail(int user_no) {
		//이경우 user_no를 int로 주었기때문에 mapper에서 user_no파라메터를 Integer로 줘야한다.
		//만약 UserDto dto = new UserDto(user_no,....나머지 null) 이거나
		//UserDto dto = new UserDto()
		//dto.setUser_no();인 경우는 dto로 주었기때문에 파라메터도 dto로 해줘야 한다.
		
		ArrayList<UserDto> result = (ArrayList) sqlSession.selectList("UserDetail", user_no);
		return result;
	}

	//아이디 중복체크
	@Override
	public String IdCheck(UserDto dto1) {
		System.out.println("아이디 중복 체크");
		return sqlSession.selectOne("IdCheck",dto1); 
	}
	
	// 비밀번호 변경
	@Override
	public int update_pw(UserDto dto){
		return sqlSession.update("UpdatePw", dto);
	}
	
	// 비밀번호 변경
	@Override
	public void pwModiDo(UserDto dto){
		sqlSession.update("pwModiDo", dto);
	}
	
	// 회원정보 변경
	@Override
	public void memberModiDo(UserDto dto){
		sqlSession.update("memberModiDo", dto);
	}
	
	//회원정보 삭제
	@Override
	public void memberDelDo(UserDto dto) {
		sqlSession.delete("memberDelDo", dto);
	}
	
	//메뉴 주문(주소내역)
	@Override
	public String Order1(String oNo, String osName, String oName, String oAd1, String oAd2, String oPhone, String oText,
			int oAmount, String user_id, Date oDate, int sNo) {
		
		OrderDto dto = new OrderDto();
		dto.setoNo(oNo);
		dto.setOsName(osName);
		dto.setoName(oName);
		dto.setoAd1(oAd1);
		dto.setoAd2(oAd2);
		dto.setoPhone(oPhone);
		dto.setoText(oText);
		dto.setoAmount(oAmount);
		dto.setUser_id(user_id);
		dto.setoDate(oDate);
		dto.setsNo(sNo);
		
		int result;
		
		result = sqlSession.insert("Order1",dto);
		System.out.println("result : " + result);
		
		if(result > 0)	{ //1이면 주문성공
			return "order-success";
		}
		else {
			return "order-failed";
		}

	}

	//메뉴 주문(상세내역)
	@Override
	public void Order(int omNo, String omName, int omStock, int omPrice, String oNo) {
		
		OrderDetailDto dto = new OrderDetailDto();
		
		dto.setOmNo(omNo);
		dto.setOmName(omName);
		dto.setOmStock(omStock);
		dto.setOmPrice(omPrice);
		dto.setoNo(oNo);
		
		sqlSession.insert("Order",dto);
		
	}
	
	//회원 주문 목록
	@Override
	public ArrayList<OrderDto> MyOrderInfo(OrderDto dto) {
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("MyOrderInfo", dto);	
		return result;
	}
	
	//회원 주문 날짜조회한 목록
	@Override
	public ArrayList<OrderDto> OrderDcheck(String user_id, Date oDate, Date oDate1) {
		
		OrderDto dto = new OrderDto();
		dto.setUser_id(user_id);
		dto.setoDate(oDate);
		dto.setoDate1(oDate1);
		
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("OrderDcheck", dto);
		
		return result;
	}
	
	//회원 주문 상세목록(주문테이블)
	@Override
	public ArrayList<OrderDto> MyOrderInfoDetail(OrderDto dto) {
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("MyOrderInfoDetail", dto);
		return result;
	}
	
	//회원 주문 상세목록(주문상세 테이블)
	@Override
	public ArrayList<OrderDetailDto> MyOrderInfoDetail1(OrderDetailDto dto) {
		ArrayList<OrderDetailDto> result = (ArrayList) sqlSession.selectList("MyOrderInfoDetail1", dto);
		return result;
	}
	
}