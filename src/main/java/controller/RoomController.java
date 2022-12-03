package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.RoomDAO;
import vo.BusinessVO;
import vo.ReviewVO;

@Controller
public class RoomController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	RoomDAO room_dao;

	public RoomController(RoomDAO room_dao) {
		System.out.println("컨트롤러 생성됨!!");
		this.room_dao = room_dao;
	}

	@RequestMapping("todayCheckin.do")
	public String todayCheckin(Model model, String ownid) {

		Map<Object, Object> map = new HashMap<Object, Object>();
		BusinessVO businessvo = room_dao.selectbusiness(ownid);
		String buname = businessvo.getBuname();
		map = room_dao.todayCheckin(buname, ownid);

		model.addAttribute("nocheckin", map.get("notCheckin"));

		model.addAttribute("checkinok", map.get("checkinOk"));

		return "/WEB-INF/views/room/room_todaycheckin.jsp";
	}

	@RequestMapping("/updatetodaycheckin.do")
	public String updateTodayCheckin(String booknum, String ownid) {
		System.out.println("ownid : " + ownid);
		System.out.println("booknum : " + booknum);
		BusinessVO businessvo = room_dao.selectbusiness(ownid);
		String buname = businessvo.getBuname();
		int res = room_dao.updatetodaycheckin(booknum, ownid, buname);
		System.out.println("res : " + res);
		return "redirect:/todayCheckin.do?ownid=" + ownid;
	}

	@RequestMapping("/todayCheckout.do")
	public String todayCheckOut(Model model, String ownid) {

		Map<Object, Object> map = new HashMap<Object, Object>();
		BusinessVO businessvo = room_dao.selectbusiness(ownid);
		String buname = businessvo.getBuname();
		map = room_dao.todayCheckout(buname, ownid);

		model.addAttribute("nocheckout", map.get("notCheckout"));

		model.addAttribute("checkoutok", map.get("checkoutOk"));

		return "/WEB-INF/views/room/room_todaycheckout.jsp";
	}

	@RequestMapping("updateTodayCheckOut")
	public String updateTodayCheckOut(String booknum, String ownid) {
		System.out.println("ownid : " + ownid);
		System.out.println("booknum : " + booknum);
		BusinessVO businessvo = room_dao.selectbusiness(ownid);
		String buname = businessvo.getBuname();
		int res = room_dao.updatetodaycheckout(booknum, ownid, buname);
		System.out.println("res : " + res);
		return "redirect:/todayCheckout.do?ownid=" + ownid;
	}

	// 전체 게시글 조회
	@RequestMapping("/reviewlist.do")
	public String seletList(Model model, String ownid) {
		
		System.out.println("rrrrrrr");

		BusinessVO basevo = room_dao.hotel_selecreview(ownid);

		String buname = basevo.getBuname();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buname", buname);
		System.out.println(map);

		List<ReviewVO> relist = room_dao.selectreList(map);
		model.addAttribute("relist", relist);
		model.addAttribute("ownid", ownid);

		return "/WEB-INF/views/review/review_list.jsp";
	}
	
	// 댓글 작성을 위한 페이지로 전환
		@RequestMapping("/reply_form.do")
		public String replyForm(Model model, int idx, int ref, String buname, String ownid) {
			model.addAttribute("idx", idx);
			model.addAttribute("buname", buname);
			model.addAttribute("ref", ref);
			model.addAttribute("ownid", ownid);
			return "/WEB-INF/views/review/review_reply.jsp";
		}

}