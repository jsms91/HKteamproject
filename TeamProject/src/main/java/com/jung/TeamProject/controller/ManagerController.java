package com.jung.TeamProject.controller;

import java.io.File;

import java.util.ArrayList;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jung.TeamProject.dao.StoreDao;
import com.jung.TeamProject.dao.UserDao;
import com.jung.TeamProject.dto.ApplyDetailDto;
import com.jung.TeamProject.dto.ApplyDto;
import com.jung.TeamProject.dto.MenuDto;
import com.jung.TeamProject.dto.StoreDto;

@Controller
@MultipartConfig(maxFileSize=1024*1024*4)
public class ManagerController {
	
	@Autowired
	private UserDao udao;
	
	@Autowired
	private StoreDao sdao;
	
	//회원 리스트
	@RequestMapping("UserList")
	public String List(Model model) {
		model.addAttribute("UserList", udao.Userlist()); //여기서 "list가 jsp에서 c:forEach items 값에 넣어야 되는 값이다.
		System.out.println("dao : " + udao.Userlist());
		return "Manager/User/userlist_view"; 
	}
	
	//회원 상세 리스트
	@RequestMapping("UserDetail")
	public String UserDetail(HttpServletRequest request, Model model) {
		int uNo = Integer.parseInt(request.getParameter("user_no"));
		System.out.println("user_no : " + uNo);
		
		model.addAttribute("UserDetail", udao.UserDetail(uNo)); //여기서 "list가 jsp에서 c:forEach items 값에 넣어야 되는 값이다.
		System.out.println("dao : " + udao.UserDetail(uNo));
		return "Manager/User/UserDetailList_view"; 
	}

	//======================================================================
	
	
	//입점문의 전체 리스트 (관리자)
	@RequestMapping("ApplyList")
	public String applylist(Model model) {
		
		//전체 리스트 목록이 있고 없고할 필요 없음
		ArrayList<ApplyDto> str = sdao.Applylist();
		model.addAttribute("applylist", str);
		
		return "Manager/Apply/ApplyList_view";

	} 
	
	//입점문의 상세보기 리스트
	@RequestMapping("ApplyDetail")
	public String ApplyDetail(HttpServletRequest request, Model model) {
		
		System.out.println("ApplyDetail 컨트롤러 들어옴");

		int no = Integer.parseInt(request.getParameter("asNo"));
		
		ArrayList<ApplyDetailDto> dto = sdao.ApplyDetail(no);
		model.addAttribute("ApplyDetailList", dto);
		
		return "Manager/Apply/ApplyDetail_view";
		
	}
	
	
	//======================================================================
	
	
	//가게등록
	@RequestMapping("register")
	public String register(MultipartHttpServletRequest request, Model model) {
		
		//===========================
		
		MultipartFile mf = request.getFile("sImg");
		//MultipartFile객체를 얻어냄, 이떄는 getParameter대신 getFile()메서드를 사용
		System.out.println(mf);
		
		String path = "D:/TeamProject/Store/";
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
		
		
		String imgname1 = request.getParameter("sImg");
		String Simg = imgname1;
		
		Simg = dfile;
		
		//===========================
		
		int Tip = Integer.parseInt(request.getParameter("sTip"));
		int Price = Integer.parseInt(request.getParameter("mPrice"));
		
		
		sdao.Register(request.getParameter("sName"), request.getParameter("bName"), request.getParameter("bNo"), Simg, request.getParameter("sAd"),
						request.getParameter("sLat"), request.getParameter("sLng"), request.getParameter("sPhone"), request.getParameter("sCategory"),
						Tip, Price, request.getParameter("user_id"));
		
		//입점처리상태 처리완료 수정
		int no = Integer.parseInt(request.getParameter("asNo"));
		sdao.ApplyStatusEnd(no);
		
		System.out.println("가게 등록 성공");	
		return "redirect:StoreList";
		
	}
	
	//가게 리스트
	@RequestMapping("StoreList")
	public String StoreList(Model model) {
		
		ArrayList<StoreDto> str = sdao.Storelist();
		System.out.println("str : " + str);
		
		model.addAttribute("storelist", str);
		return "Manager/Store/StoreRegisterList_view";
		
	}
	
	//가게리스트 상세보기(사장,관리자 같이 쓰고 버튼을 권한으로 나눠서 해도되는데 배달팁,주문가격 수정때문에 나눠서 함)
	@RequestMapping("StoreDetail")
	public String StoreDetail(HttpServletRequest request, Model model) {
		System.out.println("StoreDetail 컨트롤러 들어옴");
		
		int sno = Integer.parseInt(request.getParameter("sNo"));
		
		ArrayList<StoreDto> dto = sdao.StoreDetail(sno);
		model.addAttribute("StoreDetailList", dto);
		
		return "Manager/Store/StoreDetail_view";
		
	}
	
	//가게 내용 수정화면
	@RequestMapping("RegisterContent")
	public String RegisterContent(HttpServletRequest request, Model model) {
		System.out.println("RegisterContent 컨트롤러 들어옴");
		
		int no = Integer.parseInt(request.getParameter("sNo"));
		
		ArrayList<StoreDto> dto = sdao.RegisterContent(no);
		model.addAttribute("Smodify", dto);
		
		return "Manager/Store/RegisterContent_view";
		
	}
	
	//가게 이미지(로고) 변경,업로드 화면 --> dao 메서드 및 코드는 가게 수정화면이랑 같음(불러오는 값이 같으니까)
	@RequestMapping("RegisterImgContent")
	public String RegisterImgContent(HttpServletRequest request, Model model) {
		System.out.println("RegisterImgContent 컨트롤러 들어옴");
		
		int no = Integer.parseInt(request.getParameter("sNo"));
		
		ArrayList<StoreDto> dto = sdao.RegisterContent(no);
		model.addAttribute("Smodify", dto);
		
		return "Manager/Store/RegisterImgConten_view";
		
	}
	
	//가게 내용 수정
	@RequestMapping("StoreModify")
	public String StoreModify(HttpServletRequest request, Model model) {
		
		int no = Integer.parseInt(request.getParameter("sNo"));
		System.out.println("sNo : " + no);
		
		int Tip = Integer.parseInt(request.getParameter("sTip"));
		int Price = Integer.parseInt(request.getParameter("mPrice"));
		
		sdao.StoreModify(no, request.getParameter("sName"), request.getParameter("bName"), request.getParameter("bNo"), request.getParameter("sAd"),
						request.getParameter("sLat"), request.getParameter("sLng"), request.getParameter("sPhone"), request.getParameter("sCategory"),
						Tip, Price);
		
		System.out.println("수정 성공");
		
		return "redirect:StoreList";
		
	}
	
	//가게 이미지 파일 수정(새로 업로드,변경)ImgModify
	@RequestMapping("ImgModify")
	public String ImgModify(MultipartHttpServletRequest request, Model model) {
		
		int no = Integer.parseInt(request.getParameter("sNo"));

		String dimg = request.getParameter("dImg");
		String path1 = "D:/TeamProject/Store/" + dimg;
		//파일삭제
		File file = new File(path1);
		System.out.println("경로" + path1);
		file.delete();
						
		System.out.println("sNo : " + no);
		
		//===========================
		
		MultipartFile mf = request.getFile("sImg");
		//MultipartFile객체를 얻어냄, 이떄는 getParameter대신 getFile()메서드를 사용
		System.out.println(mf);
		
		String path = "D:/TeamProject/Store/";
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
		
		
		String imgname1 = request.getParameter("sImg");
		String Simg = imgname1;
		
		Simg = dfile;
		
		//===========================
		
		sdao.ImgModify(no, Simg);
		
		System.out.println("이미지 수정 성공");
		return "redirect:StoreList";
	}
	
	//가게삭제하기
	@RequestMapping("StoreDelete")
	public String StoreDelete(HttpServletRequest request, Model model) {
		System.out.println("StoreDelete 컨트롤러 들어옴");
		
		int no = Integer.parseInt(request.getParameter("sNo"));
		String simg = request.getParameter("sImg"); //파일이름
		String path = "D:/TeamProject/Store/" + simg;
		
		//파일삭제
		File file = new File(path);
		System.out.println("경로" + path);
		file.delete(); 
		
		//DB삭제
		sdao.StoreDelete(no);
		
		System.out.println("삭제 성공");	
		
		return "redirect:StoreList";
		
	}
	
	//=====================================================================
	//메뉴리스트
	@RequestMapping("StoreMenu")
	public String StoreMenu(HttpServletRequest request, Model model) {
		System.out.println("StoreMenu 컨트롤러 들어옴");
		
		//=======================
		//메뉴등록시 업체번호 받아서 저장하기 위해 필요
		int sno = Integer.parseInt(request.getParameter("sNo"));
		System.out.println("sno : " + sno);
		
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
		
		return "Manager/Store/MMenu_view";
		
	}
	
}