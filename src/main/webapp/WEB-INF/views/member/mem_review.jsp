<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">

<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/main.css"
	type="text/css">
<!-- <link rel="stylesheet" href="/lodsing/resources/css/style.css" 
	type="text/css"> -->

<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/index.css"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.rhda {
	color: rgb(56, 56, 56);
	font-weight: bold;
}
.red {
	color: rgb(3, 101, 125);
	font-weight: bold;
}
.starr {
	font-size: 1.5em;
	color: orange;
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
a{
text-decoration:none;}
</style>
<body>

	<header class="jbTitle"
		style="border-bottom: 3px solid rgb(3, 101, 125);">
		<div class="px-3 py-2 bg-white text-white  navbar-light bg-light">
			<div class="container container-fluid" class="box1"
				style="padding: 20px;">
				<div
					class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
					<a href="main.do"
						class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
						<img class="bi me-2" width="120" height="32"
						aria-label="Bootstrap" src="/lodsing/resources/img/main/logo.png">

					</a>


					<c:if test="${ !empty user }">
						<div class="user_name">${user.memname}님환영합니다.</div>
					</c:if>

					<c:if test="${ user.verify == admin }">
						<div class="user_name">${user.memname}님환영합니다.</div>
					</c:if>




					<ul id="main_menu"
						class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">

						<li><a href="#" class="nav-link text-black"> 내주변 </a></li>
						<li><c:if test="${ !empty user }">
								<a href="reservationlist.do" class="nav-link text-black">
									예약내역 </a>
							</c:if></li>
						<li>
							<div class="btn-group">
								<button class="btn  dropdown-toggle text-black" type="button"
									id="dropdownMenuButton" data-bs-toggle="dropdown"
									aria-expanded="false">더보기</button>
								<ul class="dropdown-menu text-black"
									aria-labelledby="dropdownMenuButton">
									<li><a class="dropdown-item" href="#">공지사항</a></li>
									<li><a class="dropdown-item" href="qna.do">자주묻는 질문</a></li>
									<li><a class="dropdown-item" href="#">약관 및 정책</a></li>
								</ul>
							</div>

						</li>
						<li><c:if test="${ empty user }">
								<a href="login_form.do" class="nav-link text-black"> 로그인 </a>
							</c:if> <c:if test="${ !empty user }">
								<a href="logout.do" class="nav-link text-black"> 로그아웃 </a>
							</c:if></li>
						<c:if test="${user.verify =='관리자'}">
							<li><a href="admin.do" class="nav-link text-black"> 관리자
									페이지 </a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</header>

	<section class=" container bg-light">
		<div class="row justify-content-center">
			<div
				class="col-2 d-flex flex-column flex-shrink-0 p-3 text-black bg-white side_menu"
				>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item "><a href="reservationlist.do"
						class="nav-link  rhda "> 예약내역 </a></li>
					<li class="nav-item link-dark"><a href="memberinfo.do"
						class="nav-link  rhda ">내정보관리 </a></li>
					<li class="nav-item link-dark" ><a
						href="#" class="nav-link red" ><span class="red">
							내가 작성한 리뷰</span> </a></li>
					<li class="nav-item "><a
						href="${pageContext.request.contextPath}/member/myWish"
						class="nav-link text-black  rhda"> 찜한 숙소 </a></li>

				</ul>
			</div>

			<div class=" col-8 list-group bg-white" style="margin: 80px 0 0 40px;">

				<c:forEach var="vo" items="${mlist}">
					<div
						class="list-group-item list-group-item-action d-flex gap-3 py-3"
						aria-current="true">

						<c:if test="${vo.depth ne 1  }">
							<div>
								<img src="/lodsing/resources/img/main/customer.png"
									style="height: 39px">
								<h5 style="width: 10%">${vo.memid}</h5>
							</div>
						</c:if>
						<c:if test="${vo.depth ne 0  }">
							<div>
								<img src="/lodsing/resources/img/main/admin.png"
									style="height: 39px">
								<h5 style="width: 10%">${vo.ownid}</h5>
							</div>
						</c:if>
						<p style="width: 30%">${vo.buname}</p>

						<!-- 댓글일경우 제목을 들여쓰기한다
					<c:forEach begin="1" end="${vo.depth }"></c:forEach> -->

						<!-- 댓글기호 -->
						<c:if test="${vo.depth ne 0  }">
							<div class="col-2" style="color: gray;">::관리자 댓글::</div>
						</c:if>
						<c:if test="${vo.rating == '0'}">
							<div class="starr col-2">☆☆☆☆☆</div>
						</c:if>
						<c:if test="${vo.rating == '1'}">
							<div class="starr col-2">★☆☆☆☆</div>
						</c:if>
						<c:if test="${vo.rating == '2'}">
							<div class="starr col-2">★★☆☆☆</div>
						</c:if>
						<c:if test="${vo.rating == '3'}">
							<div class="starr col-2">★★★☆☆</div>
						</c:if>
						<c:if test="${vo.rating == '4'}">
							<div class="starr col-2">★★★★☆</div>
						</c:if>
						<c:if test="${vo.rating == '5'}">
							<div class="starr col-2">★★★★★</div>
						</c:if>
						<div class="d-flex gap-2 w-100 justify-content-between">
							<div style="width: 40%;">
								<a
									href="reviewview.do?idx=${vo.idx}&buname=${bu.buname}&ownid=${bu.ownid}"
									style="color: black;"> <c:if
										test="${vo.filename ne 'no_file'}">
										<img src="/lodsing/resources/upload/${vo.filename}"
											class="card-img-top" style="width: 300px; margin-top: 10px">
									</c:if> <span style="font-size: 20px; text-align: center;"><pre
											style="margin-top: 20px;">${vo.content}</pre></span>
								</a>
							</div>

						</div>

						<small class="opacity-50 text-nowrap">${fn:split(vo.regdate, ' ')[0]}</small>
					</div>
				</c:forEach>
			</div>



		</div>
	</section>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>