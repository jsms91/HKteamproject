package com.jung.TeamProject.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jung.TeamProject.dao.BDaoTemplate;
import com.jung.TeamProject.dto.UserDto;
import com.jung.TeamProject.util.Constant;

public class BModCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		String logid = request.getParameter("logid");
		System.out.println("현재 로그인 중인 아이디" + logid);		
		
		UserDto dto = new UserDto();
		dto.setUser_id(logid);
		
		BDaoTemplate dao = Constant.dao;
		ArrayList<UserDto> dtos = dao.modi1(dto);
		
		request.setAttribute("modi1", dtos);
	}

}
