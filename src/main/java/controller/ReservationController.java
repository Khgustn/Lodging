package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.functors.ForClosure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReservationDAO;
import util.DateParse;
import util.Paging;
import util.Util;
import vo.BookingVO;
import vo.BusinessVO;
import vo.MemberVO;
import vo.ReviewVO;
import vo.RoomVO;

@Controller
public class ReservationController {
	// Autowired를 통해 new를 통한 객체생성 없이 서블릿에서 제공해주는 클래스는
	// 자동으로 메모리할당 받을 수 있다.
	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	ReservationDAO reservation_dao;

	public ReservationController(ReservationDAO reservation_dao) {
		System.out.println("컨트롤러 생성됨!!");
		this.reservation_dao = reservation_dao;
	}

	// 객실 상세정보 가져오기
	@RequestMapping("/roomdetail.do")
	public String roomDetail(Model model, int roomnum) {

		// 객실 정보와 사진 가져오기
		RoomVO roomvo = reservation_dao.getRoom(roomnum);

		// 선택한 객실의 정보를 가져와서 파싱 후 저장
		String info = roomvo.getRoominfo().replace("\r\n", "<br/>");

		model.addAttribute("room", roomvo);

		model.addAttribute("info", info);

		return "WEB-INF/views/room/room_detail.jsp";
	}

	// 호텔 상세보기
	@RequestMapping("/hotel_view.do")
	public String hotel_view(Model model, String ownid, String bookcheckin, String bookcheckout) {

		// roomlist
		String today = DateParse.getTodayPlus(0);
		String tomorrow = DateParse.getTodayPlus(1);

		BusinessVO basevo = reservation_dao.hotel_selectview(ownid);
		List<RoomVO> roomlist = reservation_dao.hotel_room(ownid);
		String buname = basevo.getBuname();

		// buname과 일치하는 rating을 받아옴
		List<ReviewVO> reviewRateList = reservation_dao.hotel_rate_avg(buname);
		int rateAvg = 0;
		int sum = 0;
		int rateNum = reviewRateList.size();
		
		if (rateNum > 0) {
			for (ReviewVO vo:reviewRateList) {
				sum += vo.getRating();
			}
			rateAvg = sum / rateNum;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buname", buname);

		List<ReviewVO> rlist = reservation_dao.selectList(map);
		model.addAttribute("list", rlist);
		model.addAttribute("rateAvg", rateAvg);
		model.addAttribute("rateNum", rateNum);
		
		model.addAttribute("bu", basevo);
		model.addAttribute("room", roomlist);
		
		return "/WEB-INF/views/main/hotel_view.jsp";

	}

	// 예약 중복 확인
	@RequestMapping("/hotel_overlap.do")
	public String hotel_overlap(Model model, String ownid, String bookcheckin, String bookcheckout) {

		String today = DateParse.getTodayPlus(0);
		String tomorrow = DateParse.getTodayPlus(1);

		BusinessVO basevo = reservation_dao.hotel_selectview(ownid);

		List<RoomVO> roomList = reservation_dao.getOverlapRoomList(ownid,

				DateParse.dateToStr(bookcheckin), DateParse.dateToStr(bookcheckout));

		model.addAttribute("bu", basevo);
		model.addAttribute("room", roomList);

		model.addAttribute("bookcheckin", bookcheckin);
		model.addAttribute("bookcheckout", bookcheckout);
		model.addAttribute("today", DateParse.strToDate(today));
		model.addAttribute("tomorrow", DateParse.strToDate(tomorrow));

		return "/WEB-INF/views/main/hotel_view.jsp";

	}

	// 예약 내역 정보 예약하기 페이지
	@RequestMapping("/reservation.do")
	public String reserve(BookingVO bookingvo, Model model, String memid, HttpServletRequest request) {

		MemberVO membervo = null;

		membervo = reservation_dao.getMemberOne(memid);

		int night = DateParse.dateDif(bookingvo.getBookcheckin(), bookingvo.getBookcheckout()); // (checkout-checkin)
		bookingvo.setBookprice((Integer.parseInt(bookingvo.getBookprice()) * night) + "");
		bookingvo.setMemid(memid);

		HttpSession session = request.getSession();
		session.setAttribute("booking", bookingvo);
		model.addAttribute("member", membervo);

		return "/WEB-INF/views/reservation/reservation.jsp";
	}

	// 예약하기
	@RequestMapping(value = "reservepro.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String reservePro(String booknum, String bookpayment, Model model, HttpServletRequest request) {
		String msg = "예약을 실패했습니다.";
		System.out.println("booknum" + booknum);
		System.out.println("bookpayment" + bookpayment);

		HttpSession session = request.getSession();

		BookingVO bookingvo = (BookingVO) session.getAttribute("booking");

		bookingvo.setBooknum(booknum);
		bookingvo.setBookpayment(bookpayment);
		bookingvo.setBookregdate(DateParse.getTodayPlus(0));
		bookingvo.setBookstatus(1);
		bookingvo.setBookcheckin(DateParse.dateToStr(bookingvo.getBookcheckin()));
		bookingvo.setBookcheckout(DateParse.dateToStr(bookingvo.getBookcheckout()));

		int result = reservation_dao.insertBooking(bookingvo);
		System.out.println(result);
		if (result != 0) {
			msg = bookingvo.getBuname() + "/" + bookingvo.getRoomname() + "에 예약하였습니다.";
			session.removeAttribute("booking");
			System.out.println(msg);
		}

		model.addAttribute("msg", msg);
		return "?msg=" + msg;
	}

	// 내 예약 목록 가져오기
	@RequestMapping("/reservationlist.do")
	public String reservationlist(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberVO membervo = (MemberVO) session.getAttribute("user");

		List<BookingVO> bookingVO = reservation_dao.getmemberbookinglist(membervo);

		model.addAttribute("bookinglist", bookingVO);

		return "WEB-INF/views/reservation/reservation_list.jsp";

	}

	// 예약 취소하기
	@RequestMapping("reservationcancel.do")
	public String cancel(Model model, String booknum) throws IOException {
		String msg = "예약 취소를 실패했습니다.";
		model.addAttribute("msg", msg);

		try {
			int result = reservation_dao.reservecancel(booknum);
			if (result != 0)
				msg = "예약이 취소되었습니다.";
			model.addAttribute("msg", msg);

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/reservationlist.do";
		}
		return "redirect:/reservationlist.do";
	}

}
