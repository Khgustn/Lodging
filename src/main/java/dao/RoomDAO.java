package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.DateParse;
import vo.BookingVO;
import vo.BusinessVO;
import vo.ReviewVO;

public class RoomDAO {
	SqlSession sqlSession;

	public RoomDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("---GogaekDAO생성자---");
		System.out.println("sql : " + this.sqlSession);
	}

	// 오늘 체크인 목록 및 체크인하기
	public Map<Object, Object> todayCheckin(String buname,String ownid) {
		String bookcheckin = DateParse.getTodayPlus(0);
		Map<Object, Object> map = new HashMap<Object, Object>();

		map.put("buname", buname);
		map.put("bookcheckin", bookcheckin);
		map.put("ownid", ownid);
//		아직 체크인 안한 객실내역
		List<BookingVO> notCheckin = sqlSession.selectList("room.room_notcheckin", map);
//		체크인 완료한 객실내역
		List<BookingVO> checkinOk = sqlSession.selectList("room.room_checkinok", map);

		Map<Object, Object> serviceMap = new HashMap<Object, Object>();
		serviceMap.clear();
		serviceMap.put("notCheckin", notCheckin);
		serviceMap.put("checkinOk", checkinOk);
		return serviceMap;
	}
	
	//사업자 ownid로 buname 가져오기
	public BusinessVO selectbusiness(String ownid) {
		
		BusinessVO vo =sqlSession.selectOne("business.hotel_view",ownid);
		return vo;
	}
	
		// 호텔 상세 보기
	public BusinessVO hotel_selecreview(String ownid) {
			BusinessVO basevo = sqlSession.selectOne("business.hotel_view", ownid);
			return basevo;
		}
		//	 전체 게시글 조회
		public List<ReviewVO> selectreList(Map<String, Object> map) {
			List<ReviewVO> relist = sqlSession.selectList("room.review_relist", map);
	
			return relist;
		}

	// 오늘 체크인 목록 업데이트
	public int updatetodaycheckin(String booknum, String ownid,String buname) {
		String bookcheckin = DateParse.getTodayPlus(0);
		Map map = new HashMap<String, String>();
		
		map.put("booknum", booknum);
		map.put("buname", buname);
		map.put("bookcheckin", bookcheckin);
		map.put("ownid", ownid);
		int res = sqlSession.update("room.room_update_todaycheckin", map);

		return res;
	}
	
	// 오늘 체크아웃 목록 및 체크아웃하기
		public Map<Object, Object> todayCheckout(String buname,String ownid) {
			String bookcheckout = DateParse.getTodayPlus(0);
			Map<Object, Object> map = new HashMap<Object, Object>();

			map.put("buname", buname);
			map.put("bookcheckout", bookcheckout);
			map.put("ownid", ownid);
//			아직 체크인 안한 객실내역
			List<BookingVO> notCheckout = sqlSession.selectList("room.room_notcheckout", map);
//			체크인 완료한 객실내역
			List<BookingVO> checkoutOk = sqlSession.selectList("room.room_checkoutok", map);

			Map<Object, Object> serviceMap = new HashMap<Object, Object>();
			serviceMap.clear();
			serviceMap.put("notCheckout", notCheckout);
			serviceMap.put("checkoutOk", checkoutOk);
			return serviceMap;
		}
		
		// 오늘 체크아웃 목록 업데이트
		public int updatetodaycheckout(String booknum, String ownid,String buname) {
			String bookcheckout = DateParse.getTodayPlus(0);
			Map map = new HashMap<String, String>();
			
			map.put("booknum", booknum);
			map.put("buname", buname);
			map.put("bookcheckin", bookcheckout);
			map.put("ownid", ownid);
			int res = sqlSession.update("room.room_update_todaycheckout", map);

			return res;
		}
}
