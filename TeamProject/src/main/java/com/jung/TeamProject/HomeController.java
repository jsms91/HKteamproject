package com.jung.TeamProject;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jung.TeamProject.dao.StoreDao;
import com.jung.TeamProject.dto.ApplyDto;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "Main/main_view";//첫화면
	}
	
	@Autowired
	private StoreDao sdao;
	
	//장바구니
	@RequestMapping("cart")
	public String cart() {
		return "redirect:html/cart.html";
	}

	//메뉴담는 모달화면
	@RequestMapping("MModal")
	public String MenuModal() {
		return "Main/MenuModal";
	}
	
	//Order_view(주문하는페이지)
	@RequestMapping("Order_view") //홈은 메인
	public String Order_view() {
		return "Main/Order_view";
	}
	
	//====================================================================== 고객이 사용하는 일반적이 메인 홈페이지
	
	//header
	@RequestMapping("header") //홈은 메인
	public String header() {
		return "Main/header";
	}
	
	//header1
	@RequestMapping("header1") //홈은 메인
	public String header1() {
		return "Main/header1";
	}
	
	//이벤트 배너
	@RequestMapping("EventBanner") //홈은 메인
	public String EventBanner() {
		return "Main/EventBanner";
	}
	
	//주소검색(가게찾는데 쓰는 검색창)
	@RequestMapping("AddressSection") //홈은 메인
	public String AddressSection() {
		return "Main/AddressSection";
	}
	
	//카테고리바
	@RequestMapping("CategoryBar") //홈은 메인
	public String CategoryBar() {
		return "Main/CategoryBar";
	}
	
	//footer
	@RequestMapping("footer") //홈은 메인
	public String footer() {
		return "Main/footer";
	}
	
	//홈 = main
	@RequestMapping("home") //홈은 메인
	public String home() {
		return "Main/main_view";
	}
	
	//회원가입화면 이동
	@RequestMapping("join_view")
	public String join_view() {
		return "Main/join_view";
	}
	
	
	//메인화면에서 로그인클릭하여 로그인페이지 이동
	@RequestMapping("login_view")
	public String login_view() {
		return "Main/login";
	}
	
	//가게 찾고 각 카테고리별로 이동하는데 필요한 카테고리 메뉴바
	@RequestMapping("CatagoryBar")
	public String CatagoryBar() {
		return "Main/Catagory_Bar";
	}
	
	//====================================================================== 회원정보 로그인 회원처리관려 페이지
	
	//아이디 찾기
	@RequestMapping("findIdView")
	public String findIdView() throws Exception{
		return "Main/User/findIdView";
	}
	
	//비밀번호 찾기
	@RequestMapping("findPwView")
	public String findPwView() throws Exception {
		return "Main/User/findPwView";
	}
	
	//회원정보
	@RequestMapping("pwModiView")
	public String pwModiView() {
		System.out.println("pwModiView 진입");
		return "Main/User/pwModiView";
	}
	
	//회원탈퇴
	@RequestMapping("memDelView")
	public String memberDelView() {
		return "Main/User/memDelView";
	}
		
	
	//====================================================================== 관리자 페이지
	
	
	//관리자 메인 페이지
	@RequestMapping("ManagerHome")
	public String ManagerHome() {
		return "Manager/MMain_view";
	}
	
	//관리자 가게등록 페이지
	@RequestMapping("StoreRegister")
	public String Store_Register(HttpServletRequest request, Model model) {
		
		String uId = request.getParameter("user_id");
		
		ArrayList<ApplyDto> dto = sdao.RegisterView(uId);
		model.addAttribute("RegisterView", dto);
		
		return "Manager/Store/StoreRegister_view";
	}
	
	
	//====================================================================== 사장페이지
	
	//사장메인 페이지
	@RequestMapping("BossHome")
	public String BossHome() {
		return "Boss/BMain_view";
	}
	
	//입점문의 페이지
	@RequestMapping("StoreApply")
	public String StoreApply() {
		return "Boss/Apply/Apply_view";
	}
	
	//입점문의 실패 페이지
	@RequestMapping("ApplyFalse")
	public String ApplyFalse() {
		return "Boss/Apply/Apply_False";
	}

}