package com.jung.TeamProject.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;

import com.jung.TeamProject.dto.StoreDto;
import com.jung.TeamProject.util.Constant;
import com.jung.TeamProject.dto.ApplyDetailDto;
import com.jung.TeamProject.dto.ApplyDto;
import com.jung.TeamProject.dto.MenuDto;
import com.jung.TeamProject.dto.OrderDetailDto;
import com.jung.TeamProject.dto.OrderDto;

@Repository //DAOÅ¬·¡½º¸¦ ³ªÅ¸³»¸ç  beanÅ¬·¡½º·Î »ç¿ë °¡´ÉÄÉ ÇÔ
public class StoreDao implements SDao {
	
	JdbcTemplate template;
	
	@Autowired  //servlet-context.xml bean bound
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	PlatformTransactionManager transactionManager;
	
	@Autowired 
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	
	@Autowired
	private SqlSession sqlSession; //field·Î autowired
	
	public StoreDao() {
		this.template = Constant.template;
		this.transactionManager = Constant.transactionManager;
	}
	
	//°¡°Ôµî·ÏÈ­¸é(È¸¿ø¾ÆÀÌµğ Ã·ºÎ)
	@Override
	public ArrayList<ApplyDto> RegisterView(String user_id) {
		
		ArrayList<ApplyDto> result = (ArrayList) sqlSession.selectList("RegisterView", user_id);
		return result;
		
	}
	//°¡°Ôµî·Ï
	@Override
	public void Register(String sName, String bName, String bNo, String sImg, String sAd, String sLat, String sLng,
								String sPhone, String sCategory, int sTip, int mPrice, String user_id) {
		
		StoreDto dto = new StoreDto(0, sName, bName, bNo, sImg, sAd, sLat, sLng, sPhone, sCategory, sTip, 
											mPrice, null, user_id, null);
		sqlSession.insert("Register", dto);
		
	}
	//°¡°Ôµî·ÏÇÏ¸é ÀÔÁ¡Ã³¸®»óÅÂ°¡ Ã³¸®¿Ï·á·Î ¹Ù²Ù±â
	@Override
	public void ApplyStatusEnd(int asNo) {
		
		ApplyDto dto = new ApplyDto();
		dto.setAsNo(asNo);
		sqlSession.insert("ApplyStatusEnd", dto);
		
	}
	
	//ÀüÃ¼ °¡°Ô ¸®½ºÆ®(°ü¸®ÀÚ)
	@Override 
	public ArrayList<StoreDto> Storelist() {		
		ArrayList<StoreDto> result = (ArrayList) sqlSession.selectList("Storelist");
		System.out.println("DB °ª : " + result);
		return result;
	}
	
	//³» °¡°Ô ¸®½ºÆ®(»çÀå)
	@Override
	public ArrayList<StoreDto> MyStorelist(String user_id) {
		StoreDto dto = new StoreDto();
		dto.setUser_id(user_id);
		
		ArrayList<StoreDto> result = (ArrayList) sqlSession.selectList("MyStorelist", dto);
		System.out.println("DB °ª : " + result);
		return result;
	}
	
	//°¡°Ô »ó¼¼¸®½ºÆ®
	@Override
	public ArrayList<StoreDto> StoreDetail(int sNo) {
		System.out.println("StoreDao µé¾î¿È");
		ArrayList<StoreDto> result = (ArrayList) sqlSession.selectList("StoreDetail", sNo);
		System.out.println("°¡°Ô »ó¼¼¸®½ºÆ® DB °ª : " + result);
		return result;
	}
	
	//°¡°Ô ¼öÁ¤ È­¸é(°ü¸®ÀÚ)
	@Override
	public ArrayList<StoreDto> RegisterContent(int sNo) {
		System.out.println("StoreDaoµé¾î¿È");
		ArrayList<StoreDto> result = (ArrayList) sqlSession.selectList("RegisterContent", sNo);
		System.out.println("DB °ª : " + result);
		return result;
	}
	
	//°¡°Ô³»¿ë¼öÁ¤(°ü¸®ÀÚ)
	@Override
	public void StoreModify(int sNo, String sName, String bName, String bNo, String sAd, String sLat,
			String sLng, String sPhone, String sCategory, int sTip, int mPrice) {
		
		System.out.println("¼öÁ¤daoµé¾î¿È");
		
		StoreDto dto = new StoreDto(sNo, sName, bName, bNo, null, sAd, sLat, sLng, sPhone, sCategory, sTip, mPrice, null, null, null);
		
		sqlSession.insert("StoreModify", dto);
		
		System.out.println("dao ¼º°øÀÌ¸é 1 : " + sqlSession.insert("StoreModify", dto));
		
	}
	
	//°¡°Ô¼öÁ¤(»çÀå)
	@Override
	public void BSModify(int sNo, int sTip, int mPrice) {
		
		System.out.println("BSModify daoµé¾î¿È");

		StoreDto dto = new StoreDto();
		dto.setsNo(sNo);
		dto.setsTip(sTip);
		dto.setmPrice(mPrice);
		
		sqlSession.insert("BSModify", dto);
		
	}
	
	//°¡°Ô ÀÌ¹ÌÁö ¼öÁ¤(°ü¸®ÀÚ)
	@Override
	public void ImgModify(int sNo, String sImg) {
		
		System.out.println("¼öÁ¤daoµé¾î¿È");
		StoreDto dto = new StoreDto();
		dto.setsNo(sNo);
		dto.setsImg(sImg);
		sqlSession.insert("ImgModify", dto);
		
	}
	
	//°¡°Ô »èÁ¦
	@Override
	public void StoreDelete(int sNo) {
		
		sqlSession.delete("StoreDelete",sNo);
		System.out.println("ÀÔÁ¡¹®ÀÇ »èÁ¦ °á°ú : " + sqlSession.delete("StoreDelete", sNo));
		
	}
	
	//°¡°Ô¯±â(Ä«Å×°í¸®)
	@Override
	public ArrayList<StoreDto> Category(String sLat, String sLng, String sCategory) {
		
		System.out.println("Ä«Å×°í¸® °¡°ÔÃ£±â");
		
		StoreDto dto = new StoreDto();
		dto.setsLat(sLat);
		dto.setsLng(sLng);
		dto.setsCategory(sCategory);
		ArrayList<StoreDto> result = (ArrayList) sqlSession.selectList("Category", dto);
		System.out.println("DB °ª : " + result);
		
		return result;
		
	}
	
	
	//°¡°ÔÃ£±â AdSearch()ÀÌ¸§°ú selectList(ÀÌ¸§)ÇÏ°í mapper idÇÏ°í 3°¡Áö°¡ ¸ğµÎ °°¾Æ¾ß ÇÑ´Ù. --> ¸ŞÀÎ + ÀüÃ¼º¸±â
	@Override
	public ArrayList<StoreDto> AdSearch(String sLat, String sLng) {
		
		System.out.println("°¡°ÔÃ£±â");
		
		StoreDto dto = new StoreDto();
		dto.setsLat(sLat);
		dto.setsLng(sLng);
		ArrayList<StoreDto> result = (ArrayList) sqlSession.selectList("AdSearch", dto);
		System.out.println("DB °ª : " + result);
		
		return result;
		
	}

	//=============================================================================================
	
	//ÀÔÁ¡¹®ÀÇ µî·Ï(»çÀå)
	@Override
	public String Apply(String asName, String abNo, String asLat, String asLng, String asAd, String asPhone,
			String asCategory, String user_id) {
		
		ApplyDto dto = new ApplyDto(0, asName, abNo, asLat, asLng, asAd, asPhone, asCategory, null, null, user_id);
		
		int result = sqlSession.insert("Apply", dto);
		
		if(result > 0)	{ //1ÀÌ¸é °¡ÀÔ¼º°ø
			System.out.println("Apply dbµî·Ï ¼º°ø");
			return "Apply-success";
		}
		else {
			System.out.println("Apply dbµî·Ï ½ÇÆĞ");
			return "Apply-failed";
		}
		
	}
	
	//ÀÔÁ¡¹®ÀÇ ¸®½ºÆ®(°ü¸®ÀÚ)
	@Override 
	public ArrayList<ApplyDto> Applylist() {
		
		ArrayList<ApplyDto> result = (ArrayList) sqlSession.selectList("Applylist");
		System.out.println("DB °ª : " + result);
		
		return result;
	}
	
	//ÀÔÁ¡¹®ÀÇ ¸®½ºÆ®(»çÀå²¨¸¸ º¸ÀÌ°Ô)
	@Override
	public ArrayList<ApplyDto> MyApplylist(String user_id) {
		
		ApplyDto dto = new ApplyDto();
		dto.setUser_id(user_id);
		
		ArrayList<ApplyDto> result = (ArrayList) sqlSession.selectList("MyApplylist", dto);
		System.out.println("DB °ª : " + result);
		return result;
	}
		
	//ÀÔÁ¡¹®ÀÇ »ó¼¼ ¸®½ºÆ®(»çÀå,°ü¸®ÀÚ)
	@Override
	public ArrayList<ApplyDetailDto> ApplyDetail(int asNo) {
		System.out.println("StoreDao µé¾î¿È");
		ArrayList<ApplyDetailDto> result = (ArrayList) sqlSession.selectList("ApplyDetail", asNo);
		System.out.println("»ó¼¼¸®½ºÆ® DB °ª : " + result);
		return result;
	}
	
	//ÀÔÁ¡¹®ÀÇ ¼öÁ¤È­¸é(»çÀå)
	@Override
	public ArrayList<ApplyDto> ApplyContent(int asNo) {
		System.out.println("StoreDaoµé¾î¿È");
		ArrayList<ApplyDto> result = (ArrayList) sqlSession.selectList("ApplyContent", asNo);
		System.out.println("DB °ª : " + result);
		return result;
		
	}
	
	//ÀÔÁ¡¹®ÀÇ ¼öÁ¤Ã³¸®(»çÀå)
	@Override
	public void ApplyModify(int asNo, String asName, String abNo, String asLat, String asLng, String asAd, String asPhone,
			String asCategory) {
		
		ApplyDto dto = new ApplyDto(asNo, asName, abNo, asLat, asLng, asAd, asPhone, asCategory, null, null ,null);
		
		sqlSession.insert("ApplyModify", dto);
		System.out.println("apply db»ğÀÔ ¼º°ø");
		
	}
	
	//ÀÔÁ¡¹®ÀÇ »èÁ¦(»çÀå)
	@Override
	public void ApplyDelete(int asNo) {
		
		sqlSession.delete("ApplyDelete",asNo);
		System.out.println("ÀÔÁ¡¹®ÀÇ »èÁ¦ °á°ú : " + sqlSession.delete("ApplyDelete", asNo));
		
	}
	
	//=============================================================================================
	
	//¸Ş´º µî·Ï
	@Override
	public String MenuRegister(String mName, String mImg, int mPrice, String mTitle1, String mTitle2, String mInfo, int sNo) {
		
		MenuDto dto = new MenuDto(0, mName, mImg, mPrice, mTitle1, mTitle2, mInfo, null, sNo, null);
		
		int result1
		= sqlSession.insert("MenuRegister", dto); 
	
		System.out.println("result1 : " + result1);
		
		if(result1 > 0 ) {
			return "Mregister-success";
		}
		else {
			return "Mregister-failed";
		}
		
	}
	
	//¸Ş´º ¼öÁ¤(³»¿ë¸¸)
	@Override
	public void MenuModify(int mNo, String mName, int mPrice, String mInfo) {
		
		System.out.println("MenuModify daoµé¾î¿È");
		
		MenuDto dto = new MenuDto();
		dto.setmNo(mNo);
		dto.setmName(mName);
		dto.setmPrice(mPrice);
		dto.setmInfo(mInfo);
		
		sqlSession.insert("MenuModify", dto);
		
	}
	
	//¸Ş´ºÀÌ¹ÌÁö ¼öÁ¤È­¸é(¸ğ´Ş)
	@Override
	public ArrayList<MenuDto> MImgModify(int mNo) {
		System.out.println("MImgModify Daoµé¾î¿È");
		MenuDto dto = new MenuDto();
		dto.setmNo(mNo);
		ArrayList<MenuDto> result = (ArrayList) sqlSession.selectList("MImgModify", dto);
		System.out.println("DB °ª : " + result);
		return result;	
	}
	
	//¸Ş´ºÀÌ¹ÌÁö ¼öÁ¤
	@Override
	public void BMImgModify(int mNo, String mImg) {
		System.out.println("¼öÁ¤daoµé¾î¿È");
		MenuDto dto = new MenuDto();
		dto.setmNo(mNo);
		dto.setmImg(mImg);
		sqlSession.insert("BMImgModify", dto);
	}
	
	
	//´ëÇ¥¸Ş´º ¸®½ºÆ®
	@Override
	public ArrayList<MenuDto> MTList(int sNo) {
		System.out.println("MTListDaoµé¾î¿È");
		MenuDto dto = new MenuDto();
		dto.setsNo(sNo);
		ArrayList<MenuDto> result = (ArrayList) sqlSession.selectList("MTList", dto);
		System.out.println("DB °ª : " + result);
		return result;	
	}
	
	//¸ŞÀÎ¸Ş´º ¸®½ºÆ®
	@Override
	public ArrayList<MenuDto> MMList(int sNo) {
		System.out.println("MMListDaoµé¾î¿È");
		MenuDto dto = new MenuDto();
		dto.setsNo(sNo);
		ArrayList<MenuDto> result = (ArrayList) sqlSession.selectList("MMList", dto);
		System.out.println("DB °ª : " + result);
		return result;	
	}
	
	//»çÀÌµå¸Ş´º ¸®½ºÆ®
	@Override
	public ArrayList<MenuDto> MSList(int sNo) {
		System.out.println("MSListDaoµé¾î¿È");
		MenuDto dto = new MenuDto();
		dto.setsNo(sNo);
		ArrayList<MenuDto> result = (ArrayList) sqlSession.selectList("MSList", dto);
		System.out.println("DB °ª : " + result);
		return result;	
	}
	
	//¸Ş´º»èÁ¦
	@Override
	public void MenuDelete(int sNo) {		
		sqlSession.delete("MenuDelete",sNo);
		System.out.println("ÀÔÁ¡¹®ÀÇ »èÁ¦ °á°ú : " + sqlSession.delete("MenuDelete", sNo));
	}
	
	//=========================================================================
	
	//Today ÁÖ¹®³»¿ª(»çÀå)
	@Override
	public ArrayList<OrderDto> MyStoreOrder(OrderDto dto) {
		
		System.out.println("³»°¡°Ô ÁÖ¹®¸ñ·Ï dao µé¾î¿È");
		
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("MyStoreOrder", dto);
		
		return result;
	}
	
	//Today ÁÖ¹®»óÅÂº° ¸®½ºÆ®(»çÀå)
	@Override
	public ArrayList<OrderDto> StatusOrderList(OrderDto dto) {
		
		System.out.println("³»°¡°Ô ÁÖ¹®»óÅÂº° ¸ñ·Ï dao µé¾î¿È");
		
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("StatusOrderList", dto);
		
		return result;
		
	}

	//ÁÖ¹®»ó¼¼³»¿ª - ÁÖ¼Ò(»çÀå)
	@Override
	public ArrayList<OrderDto> OrderDetail1(OrderDto dto) {
		System.out.println("³»°¡°Ô ÁÖ¹®»ó¼¼³»¿ª ¸ñ·Ï dao µé¾î¿È");
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("OrderDetail1", dto);
		return result;
	}
	
	//ÁÖ¹®»ó¼¼³»¿ª - ¸Ş´º(»çÀå)
	@Override
	public ArrayList<OrderDetailDto> OrderDetail2(OrderDetailDto dto) {
		System.out.println("³»°¡°Ô ÁÖ¹®»ó¼¼³»¿ª ¸ñ·Ï dao µé¾î¿È");
		ArrayList<OrderDetailDto> result = (ArrayList) sqlSession.selectList("OrderDetail2", dto);
		return result;
	}
	
	//ÁÖ¹®³»¿ª ÁÖ¹®»óÅÂÃ³¸® ¼öÁ¤(»çÀå)
	@Override
	public void oStatusModify(OrderDto dto) {
		sqlSession.insert("oStatusModify", dto);	
	}
	
	//ÁÖ¹®ÀüÃ¼³»¿ª(»çÀå)
	@Override
	public ArrayList<OrderDto> AllOrderList(OrderDto dto) {
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("AllOrderList", dto);
		return result;
	}
	//ÀüÃ¼ÁÖ¹® ³¯Â¥Á¶È¸ÇÑ ¸ñ·Ï(»çÀå)
	@Override
	public ArrayList<OrderDto> AllOrderCheck(String user_id, Date oDate, Date oDate1) {
		
		OrderDto dto = new OrderDto();
		
		dto.setUser_id(user_id);
		dto.setoDate(oDate);
		dto.setoDate1(oDate1);
		
		ArrayList<OrderDto> result = (ArrayList) sqlSession.selectList("AllOrderCheck", dto);		
		return result;	
		
	}
	
	
}