package com.jung.TeamProject.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jung.TeamProject.dao.BDaoTemplate;
import com.jung.TeamProject.dto.UserDto;
import com.jung.TeamProject.util.Constant;

public class BPwFindCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		System.out.println("BPwFindCommand 진입");
		
		String id = request.getParameter("user_id");
		String email = request.getParameter("user_email");
		System.out.println("입력받은 id / email 값" + id + "/" + email);
		
		UserDto dto = new UserDto();
		dto.setUser_id(id);
		dto.setUser_email(email);
		
		BDaoTemplate dao = Constant.dao;
		int result = dao.findPw(dto);
		System.out.println("command result : " + result);
		
		request.setAttribute("result", result);
	}

}
