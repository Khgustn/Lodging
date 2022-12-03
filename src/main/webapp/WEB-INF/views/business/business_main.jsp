<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/lodsing/resources/css2/main.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/swiper.css"
	type="text/css">
<link rel="stylesheet" href="/lodsing/resources/js2/swiper.min.css"
	type="text/css">
<script src="/lodsing/resources/js2/main.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/custom.css"
	type="text/css">
<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<style>
.nav-link {
	display: block;
	padding: 0.5rem 1rem;
	color: #0d6efd;
	text-decoration: none;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out;
}

@media ( prefers-reduced-motion : reduce) {
	.nav-link {
		transition: none;
	}
}

.nav-link:hover, .nav-link:focus {
	color: #0a58ca;
}

.business_menu ul {
	background-color: whitesmoke;
	padding-top: 10px;
	text-align: center;
	color: black;
	
}

.business_menu li {
	display: inline;
	margin-left:20px;

}

.business_menu a:link, a:visited, a:active {
	color: black;
	text-decoration: none;
}
body{
	background-color:white;
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


					<c:if test="${ !empty business }">
						<div class="user_name">${business.ownname}님환영합니다.</div>
					</c:if>

					<c:if test="${ user == admin }">
						<div class="user_name">${user.memname}님환영합니다.</div>
					</c:if>




					<ul id="main_menu"
						class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">

						<li><a href="#" class="nav-link text-black"> 내주변 </a></li>
						<li><a href="#" class="nav-link text-black"> 예약내역 </a></li>
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
						<li><c:if test="${ empty business }">
								<a href="login_form.do" class="nav-link text-black"> 로그인 </a>
							</c:if> <c:if test="${ !empty business }">
								<a href="business_logout.do" class="nav-link text-black"> 로그아웃 </a>
							</c:if></li>
					</ul>
					
				</div>
			</div>
		</div>
	</header>

	<div class="container">
		<section class="col-8 container bg-white"
			style="padding: 20px; margin-top: 2%; "background-color:whitesmoke;">
			<div class="justify-content-center" style="background-color:whitesmoke; height:50px; padding-top:12px;">
				<div>
					<ul class="business_menu" >
						<li><a href="room_insert_form.do">객실 등록</a></li>
						<li>|</li>
						<li><a href="#">객실 정보</a></li>
						<li>|</li>
						<li><a href="#">매출</a></li>
						<li>|</li>
						<li><a href="#">예약 확인</a></li>
						<li>|</li>
						<li><a href="todayCheckin.do?ownid=${business.ownid }">체크인</a></li>
						<li>|</li>
						<li><a href="todayCheckout.do?ownid=${business.ownid }">체크아웃</a></li>
						<li>|</li>
						<li><a href="reviewlist.do?ownid=${business.ownid}">리뷰</a></li>
						
					</ul>
				</div>
			</div>
		</section>
	</div>
	
	<main class="container">
		
		<c:forEach var="vo" items="${m_list }">
			<form>
				<div class="row d-flex justify-content-center"
					style="margin: 50px auto;">
					<div
						class="row  col-8 g-0 border rounded overflow-hidden flex-md-row mb- shadow-sm h-md-250 position-relative">
						<div class="col-auto d-none d-lg-block text-white"
							style="margin-right: 10px;">

							<img class="bd-placeholder-img" width="400" height="250"
								src="/lodsing/resources/upload/${vo.filename}"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title>
							<rect width="100%" height="100%" fill="#55595c"></rect>
							
							</img>

						</div>
						<div class="col p-4 d-flex flex-column position-static" style="margin-right:1%;">
							<h1 class="mb-0 text-black" style="font-size: 40px;">
								${vo.roomname }
							</h1>
							<br>

							<p class="card-text mb-auto" >이용 인원 : ${vo.roomcount } 명</p>
							<h5 class="card-text mb-auto" style="margin-right:5px"> ${vo.roomprice } 원</h5>
							
							

							

						</div>
					</div>
				</div>
			</form>
		</c:forEach>
	</main>
	<footer style="margin-top:40px;">
		<!-- Footer -->
		<div class="box2">
			<ul class="link">
				<li><a href="#" target="_blank">회사소개</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms"
					data-default="term">이용약관</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms/privacy"
					data-default="privacy">개인정보처리방침</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms/consumer"
					data-default="consumer">소비자 분쟁해결 기준</a><span>|</span></li>
				<li><button type="button" onclick="pop_licence();return false;">사업자
						정보확인</button> <span>|</span></li>
				<li><a href="//ad.goodchoice.kr/" target="_blank">Lodging
						마케팅센터</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/contentsInfo">콘텐츠산업진흥법에의한
						표시</a></li>
			</ul>
			<p>
				<b>고객행복센터 1588-5890</b><span>오전 9시 - 오후 6시</span>
			</p>
			<address>
				<span>코리아IT아카데미</span> 주소 : 서울특별시 마포구 서강로 136 아이비타워 2,3층 | 대표이사 :
				이선기 | <br> 통신판매업번호 : 2015 - 서울강남 - 03148호 | 전화번호 : 010-2978-1641|
				E-mail : koreais@koreaedugroup.com<br> <span>(주)
					여기어때컴퍼니는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각
					판매자에게 있습니다.</span><br> copyright ⓒ 2015 KOREA INFORMATION TECHNOLOGY
				ACADEMY. ALL RIGHTS RESERVED
			</address>

			

		</div>

	</footer>
	
</body>
</html>