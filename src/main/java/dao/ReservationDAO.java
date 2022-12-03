package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.DateParse;
import vo.BookingVO;
import vo.BusinessVO;
import vo.MemberVO;
import vo.ReservedVO;
import vo.ReviewVO;
import vo.RoomVO;

public class ReservationDAO {
	SqlSession sqlSession;

	public ReservationDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("---GogaekDAO생성자---");
		System.out.println("sql : " + this.sqlSession);

	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 객실 상세 정보 가져오기
	public RoomVO getRoom(int roomnum) {
		RoomVO roomvo = sqlSession.selectOne("reservation.room_detail", roomnum);

		return roomvo;

	}

	// 호텔 상세 보기
	public BusinessVO hotel_selectview(String ownid) {
		BusinessVO basevo = sqlSession.selectOne("business.hotel_view", ownid);
		return basevo;
	}

	// 호텔 상세보기 룸 리스트
	public List<RoomVO> hotel_room(String ownid) {
		List<RoomVO> list = sqlSession.selectList("room.hotel_room", ownid);

		return list;
	}

	// 예약된 중복 room 가져오기
	public List<RoomVO> getOverlapRoomList(String ownid, String bookcheckin, String bookcheckout) {
		System.out.println("ownid =" + ownid);
		System.out.println("bookcheckin : " + bookcheckin);
		System.out.println("bookcheckout : " + bookcheckout);

		Map map = new HashMap<String, String>();
		map.put("ownid", ownid);
		map.put("bookcheckin", bookcheckin);
		map.put("bookcheckout", bookcheckout);
		List<RoomVO> roomvo = sqlSession.selectList("reservation.reservation_overlap", map);
		return roomvo;

	}

	// 예약자 member 가져오기
	public MemberVO getMemberOne(String memid) {
		MemberVO membervo = sqlSession.selectOne("reservation.reservation_getmember", memid);
		return membervo;
	}

	// 방 예약 하기
	public int insertBooking(BookingVO booking) {

		int res = sqlSession.insert("reservation.reservation_booking", booking);

		if (res == 0) {
			return 0;
		} else {
			// 날짜 차이 계산
			int dif = DateParse.dateDif(booking.getBookcheckin(), booking.getBookcheckout());

			Map map = new HashMap<String, String>();

			// 체크인 날짜 ~ 체크아웃 날짜 -1
			for (int i = 0; i < dif; i++) {
				map.put("roomnum", booking.getRoomnum());
				map.put("regdate", DateParse.datePlus(booking.getBookcheckin(), i));
				sqlSession.insert("reservation.reservation_reserved", map);
			}
			return 1;
		}

	}

	// 예약 내역 가져오기
	public List<BookingVO> getmemberbookinglist(MemberVO membervo) {

		List<BookingVO> bookingvo = sqlSession.selectList("reservation.reservation_list", membervo);
		return bookingvo;
	}

	// 예약 취소하기
	public int reservecancel(String booknum) {

		int res = sqlSession.update("reservation.reservation_status_update", booknum);

		if (res == 0) {
			return 0;
		} else { // 예약 중복 내역 삭제
			BookingVO bookingvo = sqlSession.selectOne("reservation.reservation_select", booknum);
			bookingvo.setBookcheckout(DateParse.datePlus(bookingvo.getBookcheckout(), -1));
			int result = sqlSession.delete("reservation.reservation_cancel", bookingvo);
			return result;
		}

	}

	// 리뷰 전체 조회
	// 전체 게시글 조회
	public List<ReviewVO> selectList(Map<String, Object> map) {
		List<ReviewVO> list = sqlSession.selectList("review.review_list", map);
		return list;
	}

	// 전체 게시물 수 조회
	public int getRowTotal() {
		int count = sqlSession.selectOne("review.review_count");
		return count;
	}

	// 호텔 평균 점수
	public List<ReviewVO> hotel_rate_avg(String buname) {
		List<ReviewVO> list = null;
		try {
			list = sqlSession.selectList("review.review_cal_avg", buname);
		} catch (NullPointerException e) {
			
		}
		return list;
	}

}
