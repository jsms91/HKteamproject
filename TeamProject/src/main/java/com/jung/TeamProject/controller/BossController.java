package com.jung.TeamProject.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jung.TeamProject.dao.StoreDao;
import com.jung.TeamProject.dto.ApplyDetailDto;
import com.jung.TeamProject.dto.ApplyDto;
import com.jung.TeamProject.dto.MenuDto;
import com.jung.TeamProject.dto.OrderDetailDto;
import com.jung.TeamProject.dto.OrderDto;
import com.jung.TeamProject.dto.StoreDto;

@Controller
@MultipartConfig(maxFileSize=1024*1024*4)
public class BossController {
	
	@Autowired
	private StoreDao sdao;
	
	//입점문의 등록 + 회원아이디에 로그인한 아이디값을 넣어야 한다.
	@RequestMapping("apply")
	public String apply(HttpServletRequest request, Model model) {
		
		System.out.println("apply 컨트롤러 들어옴");
		
		String result =
		sdao.Apply(request.getParameter("asName"), request.getParameter("abNo"),
						request.getParameter("asLat"), request.getParameter("asLng"), request.getParameter("asAd"),
						request.getParameter("asPhone"), request.getParameter("asCategory"), request.getParameter("user_id"));
		
		if(result.equals("Apply-success")) {
			System.out.println("문의 등록 성공");	
			model.addAttribute("user_id", request.getParameter("user_id"));
			return "redirect:MyApplyList";
		}
		else {
			System.out.println("문의 등록 실패");
			return "redirect:BossHome";
		}
		
	}
	
	//로그인한 사장님 입점문의 리스트(사장 입점문의만 보임)
	@RequestMapping("MyApplyList")
	public String MyApplyList(HttpServletRequest request, Model model) {
		
		String uId = request.getParameter("user_id");
		System.out.println("회원아이디 : " + uId + "입점문의리스트 컨트롤러 들어옴");
		
		//목록이 있고 없고할 필요 없음
		ArrayList<ApplyDto> str = sdao.MyApplylist(uId);
		System.out.println("dao : " + str);
		
		model.addAttribute("myapplylist", str);
		
		return "Boss/Apply/MyApplyList_view";

	}	
	
	//입점문의 상세보기 리스트
	@RequestMapping("MyApplyDetail")
	public String ApplyDetail(HttpServletRequest request, Model model) {
		
		System.out.println("ApplyDetail 컨트롤러 들어옴");

		int no = Integer.parseInt(request.getParameter("asNo"));
		
		ArrayList<ApplyDetailDto> dto = sdao.ApplyDetail(no);
		model.addAttribute("ApplyDetailList", dto);
		
		return "Boss/Apply/MyApplyDetail_view";
		
	}
	
	//입점문의 수정화면
	@RequestMapping("ApplyContent")
	public String ApplyContent(HttpServletRequest request, Model model) {
		System.out.println("ApplyContent 컨트롤러 들어옴");
		
		int no = Integer.parseInt(request.getParameter("asNo"));
		
		ArrayList<ApplyDto> dto = sdao.ApplyContent(no);
		model.addAttribute("modify", dto);
		
		return "Boss/Apply/ApplyContent_view";
		
	}
	
	//입점문의 수정
	@RequestMapping("ApplyModify")
	public String ApplyModify(HttpServletRequest request, Model model) {
		System.out.println("ApplyModify 컨트롤러 들어옴");
		
		int no = Integer.parseInt(request.getParameter("asNo"));
		
		System.out.println("asNo : " + no);
		
		sdao.ApplyModify(no, request.getParameter("asName"), request.getParameter("abNo"),
						request.getParameter("asLat"), request.getParameter("asLng"), request.getParameter("asAd"),
						request.getParameter("asPhone"), request.getParameter("asCategory"));
		
		System.out.println("수정 성공");
		
		model.addAttribute("user_id", request.getParameter("user_id"));
		
		return "redirect:MyApplyList";
		
	}
	
	//입점삭제하기
	@RequestMapping("ApplyDelete")
	public String ApplyDelete(HttpServletRequest request, Model model) {
		System.out.println("ApplyDelete 컨트롤러 들어옴");
		
		int no = Integer.parseInt(request.getParameter("asNo"));
		
		sdao.ApplyDelete(no);
		System.out.println("삭제 성공");	
		model.addAttribute("user_id", request.getParameter("user_id"));
		
		return "redirect:MyApplyList";
		
	}
	
	//======================================================
	
	//내 가게 리스트(로그인한 아이디값을 비교하여 내가게 리스트만 불러와야한다.)
	@RequestMapping("MySList")
	public String MySList(HttpServletRequest request, Model model) {
		
		String uId = request.getParameter("user_id");
		System.out.println("회원아이디 : " + uId + "내 가게리스트 컨트롤러 들어옴");
		
		ArrayList<StoreDto> str = sdao.MyStorelist(uId);
		System.out.println("str : " + str);
		
		model.addAttribute("MySList", str);
		return "Boss/Store/MySList_view";
		
	}
	
	
	//내 가게리스트 상세보기
	@RequestMapping("/MySDetail")
	public String MySDetail(HttpServletRequest request, Model model) {
		System.out.println("MySDetail 컨트롤러 들어옴");
		
		int sno = Integer.parseInt(request.getParameter("sNo"));
		
		ArrayList<StoreDto> dto = sdao.StoreDetail(sno);
		model.addAttribute("MySDetail", dto);
		
		return "Boss/Store/MySDetail_view";
		
	}
	
	//내가게내용 수정(사장이 주문가격, 배달팁)
	@RequestMapping("BSModify")
	public String BSModify(HttpServletRequest request, Model model) {
		
		int sNo = Integer.parseInt(request.getParameter("sNo"));
		System.out.println("업체코드 : " + sNo);
		
		int Tip = Integer.parseInt(request.getParameter("sTip"));
		int Price = Integer.parseInt(request.getParameter("mPrice"));
		
		sdao.BSModify(sNo, Tip, Price);
		
		System.out.println("내가게 수정 성공");
		model.addAttribute("user_id", request.getParameter("user_id"));
		return "redirect:MySList";
		
	}
	
	//======================================================
	
	//메뉴등록 페이지(메뉴 리스트안에서 이거를 계속 하나씩 추가시키는 거)
	@RequestMapping("MenuRegister")
	public String MenuRegister(HttpServletRequest request, Model model) {
		System.out.println("MenuRegister 컨트롤러 들어옴");
		
		int sno = Integer.parseInt(request.getParameter("sNo"));
		 
		ArrayList<StoreDto> dto = sdao.StoreDetail(sno);
		model.addAttribute("sNo", dto); //메뉴등록시 업체번호 받아서 저장하기 위해 필요
		
		return "Boss/Store/MenuRegister";
		
	}
	
	//메뉴 등록
	@RequestMapping("MRegister")
	public String MenuRegister(MultipartHttpServletRequest request, Model model) {
		System.out.println("MRegister 컨트롤러 들어옴");
		//===========================
		
		MultipartFile mf = request.getFile("mImg");
		//MultipartFile객체를 얻어냄, 이떄는 getParameter대신 getFile()메서드를 사용
		System.out.println(mf);
		
		String path = "D:/TeamProject/Menu/";
		//폼에서 전달된 파일이름
		String originFileName = mf.getOriginalFilename();
		//업로드된 파일 크기
		long fileSize = mf.getSize();
		
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);		
		
		//저장할 파일은 이름을 바꾸어 저장(동일한 이름의 파일이 왔을때 중복 피함, 시간을 앞에 붙여 중복 피함)
		String safeFile = path + System.currentTimeMillis() + originFileName;
		String dfile = System.currentTimeMillis() + originFileName;
				
		try {
			mf.transferTo(new File(safeFile)); //MultipartFile객체를 일반 파일 객체로 변환
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		//model.addAttribute("author", src);
		model.addAttribute("fileName", dfile);
		model.addAttribute("fileSize", fileSize);
		
		
		String imgname1 = request.getParameter("mImg");
		String mimg = imgname1;
		
		mimg = dfile;
		
		//===========================
		int sno = Integer.parseInt(request.getParameter("sNo")); //업체코드 받아온거
		int mprice = Integer.parseInt(request.getParameter("mPrice"));
		
		String result =
						sdao.MenuRegister(request.getParameter("mName"), mimg, mprice, request.getParameter("mTitle1"), 
								request.getParameter("mTitle2"),request.getParameter("mInfo"), sno);
		
		if(result.equals("Mregister-success")) {
			System.out.println("메뉴 등록 성공");	
			model.addAttribute("sNo", sno);
			return "redirect:BMenuList";
		}
		else {
			System.out.println("메뉴 등록 실패");
			return "redirect:BossHome";//실패시 다시 등록페이지(실패화면 만들어서 넣어도됨)
		}
		 
	}
	
	//메뉴수정(내용만)
	@RequestMapping("MenuModify")
	public String MenuModify(HttpServletRequest request, Model model) {
		
		int sno = Integer.parseInt(request.getParameter("sNo")); //업체코드 받아온거
		
		System.out.println("메뉴수정 컨트롤러 들어옴" + sno);
		
		int mno = Integer.parseInt(request.getParameter("mNo"));
		int mprice = Integer.parseInt(request.getParameter("mPrice"));
		
		sdao.MenuModify(mno, request.getParameter("mName"), mprice, request.getParameter("mInfo"));
		
		model.addAttribute("sNo", sno);
		return "redirect:BMenuList";
	}
	
	//메뉴이미지 수정화면
	@RequestMapping("MImgModify")
	public String MImgModify(HttpServletRequest request, Model model) {
		
		System.out.println("메뉴이미지 수정(모달) 컨트롤러 들어옴");
		
		int mno = Integer.parseInt(request.getParameter("mNo"));
		
		System.out.println("mNo : " + mno);
		
		ArrayList<MenuDto> dto = sdao.MImgModify(mno);
		model.addAttribute("mImg", dto); //메뉴등록시 업체번호 받아서 저장하기 위해 필요

		return "Boss/Store/MImg_Modify";
	}
	
	//메뉴 이미지 수정
	@RequestMapping("BMImgModify")
	public String BMImgModify(MultipartHttpServletRequest request, Model model) {
		
		int sno = Integer.parseInt(request.getParameter("sNo"));
		int mno = Integer.parseInt(request.getParameter("mNo"));

		String dimg = request.getParameter("dImg");
		String path1 = "D:/TeamProject/Menu/" + dimg;
		//파일삭제
		File file = new File(path1);
		System.out.println("경로" + path1);
		file.delete();
						
		System.out.println("mNo : " + mno);
		
		//===========================
		
		MultipartFile mf = request.getFile("mImg");
		//MultipartFile객체를 얻어냄, 이떄는 getParameter대신 getFile()메서드를 사용
		System.out.println(mf);
		
		String path = "D:/TeamProject/Menu/";
		//폼에서 전달된 파일이름
		String originFileName = mf.getOriginalFilename();
		//업로드된 파일 크기
		long fileSize = mf.getSize();
		
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);		
		
		//저장할 파일은 이름을 바꾸어 저장(동일한 이름의 파일이 왔을때 중복 피함, 시간을 앞에 붙여 중복 피함)
		String safeFile = path + System.currentTimeMillis() + originFileName;
		String dfile = System.currentTimeMillis() + originFileName;
				
		try {
			mf.transferTo(new File(safeFile)); //MultipartFile객체를 일반 파일 객체로 변환
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("fileName", dfile);
		model.addAttribute("fileSize", fileSize);
		
		
		String imgname1 = request.getParameter("mImg");
		String Mimg = imgname1;
		
		Mimg = dfile;
		
		//===========================
		
		sdao.BMImgModify(mno, Mimg);
		
		System.out.println("이미지 수정 성공");
		model.addAttribute("sNo", sno);
		return "redirect:BMenuList";
	}
	
	
	
	//메뉴리스트
	@RequestMapping("BMenuList")
	public String BMenuList(HttpServletRequest request, Model model) {
		System.out.println("BMenuList 컨트롤러 들어옴");
		
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
		
		return "Boss/Store/BMenu_view";
		
	}
	
	//메뉴 삭제 MenuDelete
	@RequestMapping("MenuDelete")
	public String MenuDelete(HttpServletRequest request, Model model) {
		System.out.println("MenuDelete 컨트롤러 들어옴");
		//int sno = Integer.parseInt(request.getParameter("sNo"));
		//System.out.println("sno" + sno);
		int mno = Integer.parseInt(request.getParameter("mNo"));
		String mimg = request.getParameter("mImg"); //파일이름
		String path = "D:/TeamProject/Menu/" + mimg;
		
		System.out.println("MenuDelete 컨트롤러 들어옴" +mno +"sdfsdf" + mimg );
		//파일삭제
		File file = new File(path);
		System.out.println("경로" + path);
		file.delete(); 
		
		//DB삭제
		sdao.MenuDelete(mno);
		
		System.out.println("삭제 성공");	
		//model.addAttribute("sNo", sno);
		
		return "redirect:BossHome";
		
	}
	
	//======================================================
	//주문내역
	
	//내 가게 주문내역(사장) - 오늘꺼만
	@RequestMapping("MyOrderContent")
	public String MyOrderContent(HttpServletRequest request, Model model, OrderDto dto) throws ParseException {
		
		//오늘날짜
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");		
		Date date = new Date();
		String time1 = format1.format(date);
		Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(time1);
		
		String bId = request.getParameter("user_id"); 
		dto.setUser_id(bId);
		dto.setoDate(date1);
		
		//오늘주문 목록
		ArrayList<OrderDto> dto1 = sdao.MyStoreOrder(dto);
		model.addAttribute("MyStoreOrder", dto1);
		
		System.out.println("사장아이디 : " + bId);
	
		return "Boss/Store/MyOrderContent_view";
	}
	
	//내가게 주문내역(사장) - 주문상태에 따른 리스트StatusOrderList
	@RequestMapping("StatusOrderList")
	public String StatusOrderList(HttpServletRequest request, Model model, OrderDto dto) throws ParseException {
		
		String bId = request.getParameter("user_id");
		String stauts = request.getParameter("oStatus");

		System.out.println("StatusOrderList(사장)컨트롤러 들어옴 : " + "1: " + bId + "     2 : " + stauts);
		
		//오늘날짜
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");		
		Date date = new Date();
		String time1 = format1.format(date);
		Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(time1);
		
		dto.setUser_id(bId);
		dto.setoStatus(stauts);
		dto.setoDate(date1);
		
		//주문상태별 리스트
		ArrayList<OrderDto> dto1 = sdao.StatusOrderList(dto);
		model.addAttribute("StatusOrderList", dto1);
		
		return "Boss/Store/StatusOrderList_view";
		
	}
	
	//내가게 주문내역(사장) - 주문상태에 따른 리스트StatusOrderList + 오늘 전체 주문내역에 상세내역
	@RequestMapping("OrderDetail")
	public String OrderDetail(HttpServletRequest request, Model model, OrderDto dto, OrderDetailDto dto1) {
		
		String ono = request.getParameter("oNo");
		
		dto.setoNo(ono); //주문번호(주소내역)
		dto1.setoNo(ono); //주문번호(메뉴내역)
		
		//주문상세내역(주소)
		ArrayList<OrderDto> od = sdao.OrderDetail1(dto);
		model.addAttribute("OrderDetail1", od);
		
		//주문상세내역(메뉴)
		ArrayList<OrderDetailDto> od1 = sdao.OrderDetail2(dto1);
		model.addAttribute("OrderDetail2", od1);
		
		return "Boss/Store/BossOrderDetail_view";
		
	}
	
	//주문내역 주문처리상태 수정(사장)
	@RequestMapping("oStatusModify")
	public String oStatusModify(HttpServletRequest request, Model model, OrderDto dto) {
		
		String ono = request.getParameter("oNo");
		String ostatus = request.getParameter("oStatus");
		
		dto.setoNo(ono);
		dto.setoStatus(ostatus);
		
		sdao.oStatusModify(dto);
		System.out.println("주문상태 수정완료");

		model.addAttribute("oNo", ono);
		
		return "redirect:OrderDetail";
		
	}
	
	//전체주문내역(사장) AllOrderList
	@RequestMapping("AllOrderList")
	public String AllOrderList(HttpServletRequest request, Model model, OrderDto dto,
									@RequestParam(value = "user_id", required = false) String uId) {
		System.out.println("사장아이디 : " + uId);
		dto.setUser_id(uId);
		
		ArrayList<OrderDto> od = sdao.AllOrderList(dto);
		model.addAttribute("All", od);
		
		return "Boss/Store/AllOrderList_view";
		
	}
	
	//전체주문내역 날짜별 조회(사장)
	@RequestMapping("AllOrderCheck")
	public String AllOrderCheck(HttpServletRequest request, Model model) throws ParseException {
		
		System.out.println("123");
		String uId = request.getParameter("user_id");
		String date = request.getParameter("oDate");
		String date1 = request.getParameter("oDate1");	
		System.out.println("date : 	" + date + "  date1 : " + date1);
		
		Date nDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		Date nDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
		System.out.println("nDate : " + nDate + "nDate1 : " + nDate1);
		
		ArrayList<OrderDto> dto1 = sdao.AllOrderCheck(uId, nDate, nDate1);
		model.addAttribute("All", dto1);
	
		return "Boss/Store/AllOrderList_view"; 

	}
	
}