package com.jung.TeamProject.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jung.TeamProject.dao.StoreDao;
import com.jung.TeamProject.dao.UserDao;
import com.jung.TeamProject.dto.MenuDto;
import com.jung.TeamProject.dto.StoreDto;

@Controller
public class MainController {
	
	@Autowired
	private StoreDao sdao;
	
	@Autowired
	private UserDao udao;
	
	//가게찾기(카테고리별)
	@RequestMapping("Category")
	public String Category(HttpServletRequest request, Model model) {
		
		String result = null;
		
		System.out.println("Category 컨트롤러 들어옴");
		
		String sLat = request.getParameter("sLat");
		String sLng = request.getParameter("sLng");
		String sCategory = request.getParameter("sCategory");
		
		System.out.println("sLat : " + sLat + " sLng : " + sLng + " 카테고리 : " + sCategory);
		
		ArrayList<StoreDto> str = sdao.Category(sLat, sLng, sCategory);
		
		System.out.println("str : " + str);
		System.out.println("DB갔다옴");
	
		if(str.isEmpty()) {
			System.out.println("목록이 없다.");
			return "Main/NoneStore";
		}
		else {
			System.out.println("목록있음");
			model.addAttribute("searchlist", str);
			return "Main/SearchList_view";
		}

	}
	
	//가게 찾기(위도,경도에 맞는 가게 리스트를 뿌림) + 전체보기
	@RequestMapping("search")
	public String search(HttpServletRequest request, Model model) {

		System.out.println("컨트롤러 들어옴");
		
		String sLat = request.getParameter("sLat");
		String sLng = request.getParameter("sLng");
		String sCategory = request.getParameter("sCategory");
		
		System.out.println("sLat : " + sLat + " sLng : " + sLng + " 카테고리 : " + sCategory);
		
		ArrayList<StoreDto> str = sdao.AdSearch(sLat, sLng);
		
		System.out.println("str : " + str);
		System.out.println("DB갔다옴");
	
		if(str.isEmpty()) {
			System.out.println("목록이 없다.");
			return "Main/NoneStore";
		}
		else {
			System.out.println("목록있음");
			model.addAttribute("searchlist", str);
			return "Main/SearchList_view";
		}

	}
	
	//찾은가게 메뉴 리스트
	@RequestMapping("SearchMenuList")
	public String SearchMenuList(HttpServletRequest request, Model model) {
		System.out.println("SearchMenuList 컨트롤러 들어옴");
		
		//=======================
		//메뉴등록시 업체번호 받아서 저장하기 위해 필요
		int sno = Integer.parseInt(request.getParameter("sNo"));
		
		ArrayList<StoreDto> dto = sdao.StoreDetail(sno);
		model.addAttribute("MySNo", dto); //메뉴등록시 업체번호 받아서 저장하기 위해 필요
		//=======================
		
		//대표메뉴
		ArrayList<MenuDto> dto1 = sdao.MTList(sno);
		model.addAttribute("MTList", dto1); //메뉴등록시 업체번호 받아서 저장하기 위해 필요
		
		//메인메뉴
		ArrayList<MenuDto> dto2 = sdao.MMList(sno);
		model.addAttribute("MMList", dto2); //메뉴등록시 업체번호 받아서 저장하기 위해 필요
		
		//사이드 메뉴
		ArrayList<MenuDto> dto3 = sdao.MSList(sno);
		model.addAttribute("MSList", dto3); //메뉴등록시 업체번호 받아서 저장하기 위해 필요
		
		return "Main/SearchMenuList_view";
		
	}
	
	//가게없으면 여기로 이동
	@RequestMapping("NoneStore")
	public String NoneStore() {
		return "Main/NoneStore";
	} 
	
	//주문
	@RequestMapping("/MenuOrder")
	public String MenuOrder(HttpServletRequest request, Model model) throws ParseException {
		
		System.out.println("Order 컨트롤러 들어옴");
		
		//주문번호 만들기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		//오늘날짜 Date형식으로 변환해서 넣기
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");		
		Date date = new Date();
		String date1 = format1.format(date); //date -> String	
		Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(date1);

		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		 
		String oNo = ymd + "-" + subNum; //주문번호
		
		//메뉴주문(주소내역)
		int amount = Integer.parseInt(request.getParameter("oAmount"));
		
		int sno = Integer.parseInt(request.getParameter("sNo"));
		String result = 
				udao.Order1(oNo, request.getParameter("osName"), request.getParameter("oName"), request.getParameter("oAd1"),
								request.getParameter("oAd2"), request.getParameter("oPhone"), request.getParameter("oText"),
								amount, request.getParameter("user_id"), date2, sno);
		
		
		if(result.equals("order-success")) {
			
			System.out.println("1차 주문 성공");	
			
			String[] omNo = request.getParameterValues("omNo"); //정수
			String [] omStock = request.getParameterValues("omStock"); //정수
			String[] omPrice = request.getParameterValues("omPrice"); //정수
			
			String [] omName = request.getParameterValues("omName");
			
			int[] omno = null;
			int[] omstock = null;
			int[] omprice = null;
			
			if( omNo != null ) {
				
				omno = new int[omNo.length];
				omstock = new int[omStock.length];
				omprice = new int[omPrice.length];
				
				for(int i=0; i<omno.length; i++) {
					
					omno[i] = Integer.parseInt(omNo[i]);
					omstock[i] = Integer.parseInt(omStock[i]);
					omprice[i] = Integer.parseInt(omPrice[i]);
					
					udao.Order(omno[i], omName[i], omstock[i], omprice[i], oNo);
					
				}
			}
			
			System.out.println("주문상세내역도 성공");
			return "redirect:home";
		}
		else {
			System.out.println("주문 실패");
			return "redirect:home";//실패 페이지 하나만들어서 모달이나 문구띄우고 바로 회원가입페이지로 넘어가게해도됨.
		}
		
	}

}
