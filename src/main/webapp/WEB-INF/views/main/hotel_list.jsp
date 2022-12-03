<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/titlelog.png" rel="shortcut icon"
	type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/lodsing/resources/css2/main.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<script src="/lodsing/resources/js2/jquery-scrollbar.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/swiper.css"
	type="text/css">
<link rel="stylesheet" href="/lodsing/resources/js2/swiper.min.css"
	type="text/css">
<script src="/lodsing/resources/js2/swiper.js"></script>
<script src="/lodsing/resources/js2/swiper.min.js"></script>
<script src="/lodsing/resources/js2/main.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/custom.css"
	type="text/css">
<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<style>
.btn-primary {
	background-color: #02647d;
	width: 350px;
	font-size: 27px;
}

body {
	background-color: white;
}
</style>
</head>


<body>
	<header class="jbTitle">
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
						<li><c:if test="${ !empty user }"><a href="reservationlist.do" class="nav-link text-black"> 예약내역 </a></c:if></li>
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
					</ul>
					<c:if test="${user.verify =='관리자'}">
						<li><a href="admin.do" class="nav-link text-black"> 관리자
								페이지 </a></li>
					</c:if>
				</div>
			</div>
		</div>
	</header>
	<main class="container">
		<div style="border-bottom: 1px black solid; margin-bottom: 10px;">
			<h4 class="text-gray" style="text-align: center;">
				<a href="hotel.do" style="text-decoration: none; color: black;">호텔</a>
			</h4>
		</div>
		<c:forEach var="vo" items="${m_list }">
			<form>
				<div class="row d-flex justify-content-center"
					style="margin: 50px auto;">
					<div
						class="row  col-9 g-0 border rounded overflow-hidden flex-md-row mb- shadow-sm h-md-250 position-relative">
						<div class="col-auto d-none d-lg-block text-white"
							style="margin-right: 10px;">

							<img class="bd-placeholder-img" width="400" height="250"
								src="/lodsing/resources/upload/${vo.filename}"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title>
							<rect width="100%" height="100%" fill="#55595c"></rect>
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</img>

						</div>
						<div class="col p-4 d-flex flex-column position-static">
							<h1 class="mb-0 text-black" style="font-size: 40px;">
								<span class="lee" style="font-size: 35px; margin-left: 0px;">${vo.bucate }</span>
								${vo.buname }
							</h1>
							<br>

							<p class="card-text mb-auto">${vo.buaddr }</p>

							<div class="d-grid gap-2 col-8 mx-auto">

								<input class="btn btn-primary" type="button" value="방 상세보기"
									onclick="location.href='hotel_view.do?ownid=${vo.ownid}'">

							</div>

						</div>
					</div>
				</div>
			</form>
		</c:forEach>
	</main>
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
</body>

</html>
