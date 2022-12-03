package controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.ReservationDAO;
import dao.ReviewDAO;
import vo.BusinessVO;
import vo.ReviewVO;
import vo.RoomVO;

@Controller
public class ReviewController {

	@Autowired
	ServletContext application;
	// 서블릿 안에서 제공해주는 클래스

	@Autowired
	HttpServletRequest request;

	ReviewDAO review_dao;
	
	ReservationDAO reservation_dao;

	public ReviewController(ReviewDAO review_dao) {
		System.out.println("컨트롤러 생성됨!!");
		this.review_dao = review_dao;
	}
	

	// 새글 작성을 위한 페이지로 전환
	@RequestMapping("/reviewinsert_form.do")
	public String insert_form(Model model, ReviewVO vo,String ownid) {
		String buname =vo.getBuname();
		model.addAttribute("buname", buname);
		model.addAttribute("ownid",ownid);
		return "/WEB-INF/views/review/review_write.jsp";
	}

	// 새글쓰기
	@RequestMapping("/reviewinsert.do")
	public String insert(ReviewVO vo,String ownid) {
		
		
	
		// 사진을 업로드할 절대경로를 지정
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대경로: " + savePath);

		// 업로드할 파일의 정보
		MultipartFile photo = vo.getPhoto();

		String filename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드될 파일의 파일명
			filename = photo.getOriginalFilename();

			// 파일을 저장할 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();

			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			// 업로드된 파일은 임시저장소에서 일정시간이 지나면 사라지는데,
			// 현재 내가 지정한 upload폴더까지 경로로 사라지지 않도록 파일을 복사하는 메서드
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// vo에 파일명을 저장해서 DB로 전달
		vo.setFilename(filename);

		// ip가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		int res = review_dao.insert(vo);

		return "redirect:hotel_view.do?ownid="+ownid;

	}

	// 게시글 상세보기
	@RequestMapping("/reviewview.do")
	public String view(Model model, int idx,String ownid) {

		ReviewVO vo = review_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		model.addAttribute("ownid", ownid);

		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");



		return "/WEB-INF/views/review/review_view.jsp";

	}

	

	// 댓글쓰기
	@RequestMapping("/reply.do")
	public String reply(ReviewVO vo, String ownid) {

		// ip가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		
		ReviewVO baseVo = review_dao.selectOne(vo.getIdx());

		// 댓글작성을 위한 기준글의 step이상인 값은 +1처리를 해주자
		review_dao.update_step(baseVo);

		// 댓글이 들어갈 위치를 설정
		vo.setStep(baseVo.getStep() + 1);
		vo.setDepth(baseVo.getDepth() + 1);

		// 댓글 추가
		review_dao.reply(vo);

		return "redirect:review_list.jsp?ownid="+ownid;

	}

	// 수정하기 이동
	@RequestMapping("/send_modify.do")
	public String modifyForm(Model model, @RequestParam("idx") int idx,String ownid) {
		ReviewVO vo = review_dao.selectIdx(idx);

		model.addAttribute("vo", vo);
		model.addAttribute("ownid", ownid);
		
		return "/WEB-INF/views/review/review_modify.jsp";
	}

	// 수정하기
	@RequestMapping("/review_modify.do")
	public String modify(ReviewVO vo,String ownid) throws Exception {
		System.out.println("rat:" + vo.getRating());
		request.setCharacterEncoding("UTF-8");
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대 경로: " + savePath);

		MultipartFile photo = vo.getPhoto();
		String filename = vo.getFilename();

		if (!photo.isEmpty()) {
			File f = new File(savePath, filename);

			if (f.exists()) {
				f.delete();
			}
			filename = photo.getOriginalFilename();
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		vo.setFilename(filename);
		int res = review_dao.modify(vo);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return "redirect:hotel_view.do?ownid="+ownid;
	}

	// 삭제하기
	@RequestMapping("/review_del.do")
	@ResponseBody
	public String delete(int idx, String filename) {
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대경로: " + savePath);

		int res = review_dao.delete(idx);

		String result = "no";
		if (res == 1) {
			result = "yes";
			File f = new File(savePath, filename);

			if (f.exists()) {
				f.delete();
			}

		}

		return result;
	}

}
