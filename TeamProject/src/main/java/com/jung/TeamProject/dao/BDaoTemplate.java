package com.jung.TeamProject.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;

import com.jung.TeamProject.dto.UserDto;
import com.jung.TeamProject.util.Constant;

@Repository
public class BDaoTemplate {
	
	JdbcTemplate template;
	SqlSession sqlSession;
	
	@Autowired  //servlet-context.xml bean bound
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	   	   
	PlatformTransactionManager transactionManager;   
	
	@Autowired 
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
	   this.transactionManager = transactionManager;
	}
	
	public BDaoTemplate() {
	   this.template = Constant.template;
	   this.transactionManager = Constant.transactionManager;      
	}
	
	public UserDto login(String username) {
		
		System.out.println("dao 로그인 입력값 : " + username); //(2)
		String sql = "SELECT USER_ID, USER_PW, USER_CODE FROM USER_INFO WHERE USER_ID='"+ username +"'";
		System.out.println(sql);
		UserDto uId = null;
		System.out.println("쿼리 작동 전 : " + uId); //(3)
		
		try {
			
			return template.queryForObject(sql, new BeanPropertyRowMapper<UserDto>(UserDto.class));
		
		} 
		catch (EmptyResultDataAccessException e) {

			return uId; //아이디가 없는경우 null
			
		}
		
	}
	
	public String findId(UserDto dto) {
		String resultId;
		
		System.out.println("dao페이지 전송값 : " + dto.getUser_email());
		String uEmail = dto.getUser_email();
				
		String sql = "SELECT USER_ID FROM USER_INFO WHERE USER_EMAIL = '"+ uEmail +"'";
		System.out.println(sql);
		
		dto = template.queryForObject(sql, new BeanPropertyRowMapper<UserDto>(UserDto.class));
		resultId = dto.getUser_id();
		System.out.println("id 출력값 : " + resultId);
		
		return resultId;
	}
	
	public int findPw(UserDto dto) {
		
		String id = dto.getUser_id();
		String email = dto.getUser_email();
		System.out.println("dao페이지 id / email : " + id + "/" + email);
		
		String sql = "SELECT COUNT(USER_PW) FROM USER_INFO WHERE USER_ID = '"+ id +"'AND USER_EMAIL = '"+ email +"'";
		System.out.println(sql);
		int result = template.queryForObject(sql, Integer.class);
				
		System.out.println("findPw 결과값 : " + result);
		
		return result;
		
	}
	
	public void send_mail(UserDto dto, String div, String pw) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "rmb0058";
		String hostSMTPpwd = "vpdlxm58sw";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "admin@hkriders.co.kr";
		String fromName = "관리자";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "HK라이더스 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += dto.getUser_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += pw + "</p></div>";

		// 받는 사람 E-Mail 주소
		String mail = dto.getUser_email();
		String id = dto.getUser_id();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, id);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	public ArrayList<UserDto> modi1(UserDto dto) {
		
		ArrayList<UserDto> dtos = new ArrayList<UserDto>();
		String uId = dto.getUser_id();
		
		System.out.println("modi1 입력 id값 : " + uId);
				
		String sql = "SELECT USER_NAME, USER_SEX, USER_EMAIL, USER_PHONE, USER_PROFILE FROM USER_INFO WHERE USER_ID = '"+ uId +"'";
		System.out.println(sql);
		
		dto = template.queryForObject(sql, new BeanPropertyRowMapper<UserDto>(UserDto.class));
		dtos.add(dto);
		return dtos;
	}
	
}
