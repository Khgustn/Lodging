package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BusinessVO;
import vo.ReviewVO;

public class ReviewDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("---GogaekDAO생성자---");
		System.out.println("sql : " + this.sqlSession);

	}


	//전체 게시글 조회
		public List<ReviewVO> selectList(){
			List<ReviewVO> relist = sqlSession.selectList("review.review_list");
			return relist;
		}

	// 새글추가
	public int insert(ReviewVO vo) {
		int res = sqlSession.insert("review.review_insert", vo);
		return res;
	}

	// 상세보기를 위한 게시글 한 건 조회
	public ReviewVO selectOne(int idx) {
		ReviewVO vo = sqlSession.selectOne("review.review_one", idx);
		return vo;
	}

	// 댓글 작성을 위한 step값 증가
	public int update_step(ReviewVO vo) {

		int res = sqlSession.update("review.update_step", vo);
		return res;

	}

	// 댓글 작성
	public int reply(ReviewVO vo) {
		int res = sqlSession.insert("review.review_reply", vo);
		return res;

	}

	// 삭제하기
	public int delete(int idx) {
		int res = sqlSession.delete("review.review_delete", idx);
		return res;
	}

	// 전체 게시물 수 조회
	public int getRowTotal() {
		int count = sqlSession.selectOne("review.review_count");
		return count;
	}

	// idx�� �޾Ƽ� ��ȸ
	public ReviewVO selectIdx(int idx) {
		ReviewVO vo = sqlSession.selectOne("review.review_idx", idx);
		return vo;
	}

	public ReviewVO selectBuname(String buname) {
		ReviewVO vo = sqlSession.selectOne("review.review_buname", buname);
		return vo;
	}

	// 수정하기
	public int modify(ReviewVO vo) {
		int res = sqlSession.update("review.review_modify", vo);

		return res;
	}
	
	

}
