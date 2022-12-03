package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AdminDAO;
import vo.BusinessVO;
import vo.MemberVO;
import vo.ReviewVO;

@Controller
public class AdminController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	AdminDAO admin_dao;

	public AdminController(AdminDAO admin_dao) {
		System.out.println("컨트롤러 생성됨!!");
		this.admin_dao = admin_dao;
	}

	// 사업자 리스트

	@RequestMapping("/admin.do")
	public String adminlist(Model model) {
		List<BusinessVO> list = admin_dao.select();
		model.addAttribute("m_list", list);
		System.out.println("list" + list);
		return "/WEB-INF/views/admin/admin.jsp";
	}

	// 회원 리스트

	@RequestMapping("/admin_member_list.do")
	public String memberlist(Model model) {
		List<MemberVO> memlist = admin_dao.selectmember();
		model.addAttribute("m_list", memlist);
		System.out.println("list" + memlist);
		return "/WEB-INF/views/admin/member_list.jsp";

	}

	// 리뷰 리스트

	@RequestMapping("/admin_review_list.do")
	public String reviewlist(Model model) {
		List<ReviewVO> reviewlist = admin_dao.select_review();
		model.addAttribute("m_list", reviewlist);
		System.out.println("list" + reviewlist);
		return "/WEB-INF/views/admin/admin_review_list.jsp";

	}

	// 업데이트

	@RequestMapping("/admin_business_modify.do")
	@ResponseBody
	public String modify(BusinessVO vo) {
		int res = admin_dao.update(vo);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}
		return result;
	}

	// 승인 취소
	@RequestMapping("/admin_business_cancel.do")
	@ResponseBody
	public String cancel(BusinessVO vo) {
		int res = admin_dao.cancel(vo);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}
		return result;
	}

	// 회원 추방 기능
	@RequestMapping("/admin_member_delete.do")
	@ResponseBody
	public String delete(String memid) {
		int res = admin_dao.delete(memid);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return result;
	}

	// 리뷰 삭제 기능
	@RequestMapping("/admin_review_delete.do")
	@ResponseBody
	public String review_delete(int idx) {
		int res = admin_dao.review_delete(idx);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return result;
	}

	// 리뷰 유지

	@RequestMapping("/admin_review_modify.do")
	@ResponseBody
	public String modify_review(ReviewVO vo) {
		int res = admin_dao.update_review(vo);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}
		return result;
	}

}