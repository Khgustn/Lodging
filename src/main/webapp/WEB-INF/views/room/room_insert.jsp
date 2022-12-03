<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<script src="/lodsing/resources/js2/main.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f) {
		let roomname = f.roomname.value;
		let roomprice = f.roomprice.value;
		let roomcheckin = f.roomcheckin.value;
		let roomcheckout = f.roomcheckout.value;
		let roomcount = f.roomcount.value;
		let roominfo = f.roominfo.value;
		
		
		f.action = "room_insert.do";
		f.method = "post";
		f.submit();
	}
</script>
<style>
body {
	background-color: white;
}
</style>
</head>
<body>

	<div class="container"
		style="width: 800px; margin-top: 100px; margin-bottom: 5%;">
		<img alt="" src="/lodsing/resources/img/main/logo.png" style="height:100px;margin-bottom:10px;">
		<h2 style="text-align: center;">객실등록</h2>
		<form method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="ownid" value="${business.ownid}">
			<div class="mb-3 mt-3">
				<label>객실이름</label> <span id="roomNameCheck"></span> <input
					type="text" class="form-control" id="ro_name" name="roomname"
					required>
			</div>
			<div class="mb-3">
				<label>가격</label> <input type="text" class="form-control"
					id="ro_price" name="roomprice" pattern="[0-9]+" required
					placeholder="숫자만 입력하세요">
			</div>
			<div style="width: 200px; float: left; margin-left: 100px;">
				<label>체크인 시간</label> <input type="time" class="form-control"
					id="checkin" name="roomcheckin" required>
			</div>
			<div
				style="width: 200px; float: left; margin-bottom: 20px; margin-left: 130px;"
				required>
				<label>체크아웃 시간</label> <input type="time" class="form-control"
					id=checkout name="roomcheckout" required>
			</div>
			<div style="clear: both;"></div>

			<div class="mb-3" style="margin-top: 20px;">
				<label>객실이용인원</label> <select id="people" name="roomcount">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select>
			</div>
			<div class="mb-3">
				<label style="margin-bottom: 10px;">객실기본정보&nbsp;&nbsp;&nbsp;</label>
				<span id="byteInfo" style="display: inline;">0</span> /4000bytes
				<textarea class="form-control" rows="10" cols="100" name="roominfo"
					onKeyUp="javascript:fnChkByte(this,'4000')" required></textarea>
			</div>

			<label style="margin-bottom: 10px;">객실사진등록&nbsp;&nbsp;&nbsp;</label>
			<input class="form-control" id="userEmail" type="file" name="photo"
				maxLength="20"> <input type="button"
				class="default_btn rounded mt-1 btn btn-secondary"
				style="width: 100px; margin: auto; display: block;"
				onclick="send(this.form)" value="등록">

		</form>
	</div>

	<footer>
		<!-- Footer -->
		<div class="box2">
			<ul class="link">
				<li><a href="http://www.withinnovation.co.kr/" target="_blank">회사소개</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms"
					data-default="term">이용약관</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms/privacy"
					data-default="privacy">개인정보처리방침</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms/consumer"
					data-default="consumer">소비자 분쟁해결 기준</a><span>|</span></li>
				<li><button type="button" onclick="pop_licence();return false;">사업자
						정보확인</button> <span>|</span></li>
				<li><a href="//ad.goodchoice.kr/" target="_blank">여기어때
						마케팅센터</a><span>|</span></li>
				<li><a href="//host.goodchoice.kr/" target="_blank">액티비티
						호스트센터</a><span>|</span></li>
				<li><a href="//hotel.goodchoice.kr/" target="_blank">HOTEL
						여기어때</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/contentsInfo">콘텐츠산업진흥법에의한
						표시</a></li>
			</ul>
			<p>
				<b>고객행복센터 1588-5890</b><span>오전 9시 - 오후 6시</span>
			</p>
			<address>
				<span>코리아IT아카데미</span> 주소 : 서울특별시 마포구 서강로 136 아이비타워 2,3층 | 대표이사 :
				정해승 | <br> 통신판매업번호 : 2015 - 서울강남 - 03148호 | 전화번호 : 1588-5890|
				E-mail : koreais@koreaedugroup.com<br> <span>(주)
					여기어때컴퍼니는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각
					판매자에게 있습니다.</span><br> copyright ⓒ 2015 KOREA INFORMATION TECHNOLOGY
				ACADEMY. ALL RIGHTS RESERVED
			</address>

			<div>
				<a href="//www.facebook.com/goodchoiceofficial" target="_black"
					class="icon-icn_login_facebook"><span>여기어때 페이스북</span></a> <a
					href="//blog.gccompany.co.kr" target="_black" class="icon-ic_blog"><span>여기어때
						블로그</span></a> <a href="//post.naver.com/my.nhn?memberNo=25599212"
					target="_black" class="icon-ic_naverpost"><span>네이버포스트</span></a>
			</div>

		</div>

	</footer>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		//Byte 수 체크 제한
		function fnChkByte(obj, maxByte) {
			var str = obj.value;
			var str_len = str.length;

			var rbyte = 0;
			var rlen = 0;
			var one_char = "";
			var str2 = "";

			for (var i = 0; i < str_len; i++) {
				one_char = str.charAt(i);
				if (escape(one_char).length > 4) {
					rbyte += 3; //한글3Byte
				} else {
					rbyte++; //영문 등 나머지 1Byte
				}
				if (rbyte <= maxByte) {
					rlen = i + 1; //return할 문자열 갯수
				}
			}
			if (rbyte > maxByte) {
				// alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
				alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
				str2 = str.substr(0, rlen); //문자열 자르기
				obj.value = str2;
				fnChkByte(obj, maxByte);
			} else {
				document.getElementById('byteInfo').innerText = rbyte;
			}
		}
	</script>
</body>
</html>