package com.jung.TeamProject.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jung.TeamProject.dao.BDaoTemplate;
import com.jung.TeamProject.dto.UserDto;
import com.jung.TeamProject.util.Constant;

public class BIdFindCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String uEmail = request.getParameter("uEmail");
		
		UserDto dto = new UserDto();
		
		dto.setUser_email(uEmail);
		
		BDaoTemplate dao = Constant.dao;
		
		String result = dao.findId(dto);

		request.setAttribute("result", result);
	}

}
