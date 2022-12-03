package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BusinessVO;
import vo.MemberVO;
import vo.ReviewVO;

public class AdminDAO {
	SqlSession sqlSession;

	public AdminDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("---GogaekDAO생성자---");
		System.out.println("sql : " + this.sqlSession);
	}

	// 사업자 리스트
	public List<BusinessVO> select() {
		List<BusinessVO> list = sqlSession.selectList("admin.admin_list");
		return list;

	}

	// 회원 리스트
	public List<MemberVO> selectmember() {
		List<MemberVO> memlist = sqlSession.selectList("admin.member_list");
		return memlist;

	}

	public int update(BusinessVO vo) {
		int res = sqlSession.update("admin.business_update", vo);
		return res;
	}

	public int cancel(BusinessVO vo) {
		int res = sqlSession.update("admin.business_cancel", vo);
		return res;
	}

	// 회원 추방 기능

	public int delete(String memid) {
		int res = sqlSession.delete("admin.member_delete", memid);
		return res;
	}

	// 리뷰 리스트
	public List<ReviewVO> select_review() {
		List<ReviewVO> reviewlist = sqlSession.selectList("admin.review_list");
		return reviewlist;

	}

	// 리뷰 삭제 기능

	public int review_delete(int idx) {
		int res = sqlSession.delete("admin.review_delete", idx);
		return res;
	}

	// 전체 게시물 수 조회
	public int getRowTotal() {
		int count = sqlSession.selectOne("review.review_count");
		return count;
	}

	// 리뷰 report 신고에서 유지로 업데이트

	public int update_review(ReviewVO vo) {
		int res = sqlSession.update("admin.review_update", vo);
		return res;
	}
}
