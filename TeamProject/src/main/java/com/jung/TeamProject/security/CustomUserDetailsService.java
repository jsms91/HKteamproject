package com.jung.TeamProject.security;

import java.util.ArrayList;

import java.util.Collection;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jung.TeamProject.dao.BDaoTemplate;
import com.jung.TeamProject.dao.UserDao;
import com.jung.TeamProject.dto.UserDto;
import com.jung.TeamProject.util.Constant;

//spring security를 사용하면 클라이언트에서 요청(login)하면 이곳으로 요청됨
public class CustomUserDetailsService implements UserDetailsService {
	
	@Override //security에서 호출하는 메서드
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("커스텀 유저 입력값 : " + username); //(1)
		
		BDaoTemplate dao = Constant.dao;
		UserDto dto = dao.login(username);
		System.out.println("커스텀 유저 반환값 : " + dto); //(6)
		
		if(dto == null) {
			System.out.println("아이디가 없음");
			throw  new UsernameNotFoundException("No user found with username"); //아이디 없으면 여기서 끝 실패페이지로 이동(교수님께 질문하기)
		}		
		
		String pw = dto.getUser_pw();
		String user_code = dto.getUser_code();

		System.out.println("회원코드 : " + user_code);
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		//권한부여
		if(user_code.equals("CUSTOM")) {
			System.out.println("CUSTOM");
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		}
		else if(user_code.equals("BOSS")) {
			System.out.println("BOSS");
			roles.add(new SimpleGrantedAuthority("ROLE_BOSS"));
			
		}
		else if(user_code.equals("ADMIN")) {
			System.out.println("ADMIN");
			roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
		
		UserDetails user = new User(username, pw, roles);
		
		System.out.println("아이디 : " + username);
		System.out.println("패스워드 : " + pw);
		System.out.println("권한 : " + roles);

		return user;
	}
}