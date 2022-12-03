package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import vo.MemberVO;
import vo.ReviewVO;

public class MemberDAO {
	SqlSession sqlSession;

	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("---GogaekDAO생성자---");
		System.out.println("sql : " + this.sqlSession);

	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 회원 로그인
	public MemberVO member_select(MemberVO vo) {
		MemberVO baseVO = sqlSession.selectOne("member.login_idcheck", vo);
		return baseVO;
	}

	// 회원 등록
	public int meminsert(MemberVO vo) {

		System.out.println("m:" + vo.getMemid());
		int res = sqlSession.insert("member.member_enroll", vo);

		return res;

	}

	// 회원 등록 아이디 중복 체크
	public MemberVO memidcheck(MemberVO vo) {

		MemberVO baseVO = sqlSession.selectOne("member.member_idcheck", vo);
		return baseVO;
	}

	// 인증번호 보내기
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {

		String api_key = "NCSYCGAP37SBITES";
		String api_secret = "3SHEAMYZRMGRTIKRQM3TDSAE86BRYCEX";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "01088832761"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}
	//전체 게시글 조회
		public List<ReviewVO> selectList(String memid){
			List<ReviewVO> mlist = sqlSession.selectList("review.review_memlist", memid);
			return mlist;
		}

	

}
