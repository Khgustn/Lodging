package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dao.ReviewDAO;
import vo.MemberVO;
import vo.ReviewVO;

@Controller
public class MemberController {
	// Autowired를 통해 new를 통한 객체생성 없이 서블릿에서 제공해주는 클래스는
	// 자동으로 메모리할당 받을 수 있다.
	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;
	MemberDAO member_dao;
	ReviewDAO review_dao;

	public MemberController(MemberDAO member_dao) {
		System.out.println("컨트롤러 생성됨!!");
		this.member_dao = member_dao;
	}

	// 로그인 폼
	@RequestMapping("/login_form.do")
	public String loginForm() {
		return "WEB-INF/views/login/login_form.jsp";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// user濡� ���옣�빐�몦 �뜲�씠�꽣瑜� �꽭�뀡�뿉�꽌 �젣嫄�
		session.removeAttribute("user");
		return "redirect:main.do";
	}

	// 회원 로그인
	@RequestMapping("/login.do")
	@ResponseBody
	public String loginCheck(MemberVO vo, HttpServletRequest request) {
		MemberVO baseVO = member_dao.member_select(vo);

		String resultStr = "";

		if (baseVO == null) {
			resultStr = "no_memid";
			return resultStr;
		}

		if (!baseVO.getMempwd().equals(vo.getMempwd())) {
			resultStr = "no_mempwd";
			return resultStr;
		}

		HttpSession session = request.getSession();
		session.setAttribute("user", baseVO);
		resultStr = "clear";
		return resultStr;
	}

	// 회원 등록 폼
	@RequestMapping("/member_enroll_form.do")
	public String memenrollform() {
		return "/WEB-INF/views/member/member_enroll.jsp";
	}

	// 회원 등록
	@RequestMapping("/member_enroll.do")
	public String meminsert(MemberVO vo) {

		int res = member_dao.meminsert(vo);
		return "redirect:login_form.do";
	}

	// 회원 등록 중복 아이디 체크
	@RequestMapping("/memidcheck.do")
	@ResponseBody
	public String memidcheck(MemberVO vo) {
		MemberVO baseVO = member_dao.memidcheck(vo);

		String resultStr = "";
		if (baseVO == null) {
			resultStr = "no_id";
		} else {
			resultStr = "yes_id";
		}

		return resultStr;
	}

	

	// 내 정보 관리
	@RequestMapping("/memberinfo.do")
	public String memberinfo(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberVO membervo = (MemberVO) session.getAttribute("user");

		MemberVO m = member_dao.member_select(membervo);
		model.addAttribute("member", m);

		return "/WEB-INF/views/member/memberinfo.jsp";

	}

	@RequestMapping("/phoneAuth.do")
	@ResponseBody
	public String sendSMS(@RequestParam("memtel") String memtel) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		member_dao.certifiedPhoneNumber(memtel,randomNumber);
		
		return Integer.toString(randomNumber);
	}
	// 로그인 휴대폰 검증
	@RequestMapping("/phoneAuthOk.do")
	@ResponseBody
	public Boolean phoneAuthOk(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("rand");
		String code = (String) request.getParameter("code");

		System.out.println(rand + " : " + code);

		if (rand.equals(code)) {
			session.removeAttribute("rand");
			return false;
		}

		return true;
	}
	//회원별 리뷰 게시글 조회
		@RequestMapping("/myreview.do")
		public String seletList(Model model, String memid){
			
			List<ReviewVO> mlist= member_dao.selectList(memid);
			model.addAttribute("mlist", mlist);
			model.addAttribute("memid", memid);
			
			
			
			return  "/WEB-INF/views/member/mem_review.jsp";
		}

}
