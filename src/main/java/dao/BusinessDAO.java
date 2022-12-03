package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BusinessVO;
import vo.RoomVO;

public class BusinessDAO {
	SqlSession sqlSession;

	public BusinessDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("---GogaekDAO생성자---");
		System.out.println("sql : " + this.sqlSession);

	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 사업자 리스트
	public List<BusinessVO> select() {
		List<BusinessVO> list = sqlSession.selectList("business.business_list");
		return list;

	}

	// 모텔 리스트
	public List<BusinessVO> motel_select(String bucounty) {
		List<BusinessVO> list = sqlSession.selectList("business.motel_list", bucounty);
		return list;

	}

	// 호텔 리스트
	public List<BusinessVO> hotel_select(String bucounty) {
		List<BusinessVO> list = sqlSession.selectList("business.hotel_list", bucounty);
		return list;

	}

	// 펜션 리스트
	public List<BusinessVO> pension_select(String bucounty) {
		List<BusinessVO> list = sqlSession.selectList("business.pension_list", bucounty);
		return list;

	}

	public int delete(String id) {
		int res = sqlSession.delete("business.business_delete", id);

		return res;
	}

	// 사업자 등록
	public int insert(BusinessVO vo) {

		int res = sqlSession.insert("business.business_enroll", vo);

		return res;

	}
	// 사업자 로그인

	public BusinessVO business_select(BusinessVO vo) {
		BusinessVO baseVO = sqlSession.selectOne("business.login_idcheck", vo);
		return baseVO;
	}

	// 사업자 등록 아이디 체크
	public BusinessVO buidcheck(BusinessVO vo) {

		BusinessVO baseVO = sqlSession.selectOne("business.business_idcheck", vo);
		return baseVO;
	}

	// 객실 등록
	public int roominsert(RoomVO vo) {

		int res = sqlSession.insert("room.room_insert", vo);

		return res;

	}

	// 전체 객실 리스트
	public List<RoomVO> roomselect(BusinessVO vo) {
		List<RoomVO> list = sqlSession.selectList("room.room_list",vo);
		return list;

	}
	
	//호텔 상세보기 룸 리스트
			public List<RoomVO> hotel_room(BusinessVO vo){
				List<RoomVO> list = sqlSession.selectList("room.hotel_room",vo);
				
				return list;
			}
	
	

}
