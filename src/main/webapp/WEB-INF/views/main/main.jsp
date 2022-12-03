<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">
	
<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/swiper.min.css"
	type="text/css">
<script src="/lodsing/resources/js2/swiper.min.js"></script>
<script src="/lodsing/resources/js2/main.js"></script>
<style>
a{
text-decoration:none;}
.box {
	position: absolute;
	bottom: 150px;
	left: 50%;
	/* transform: translate(-50%, -50%); */
	transform: translateX(-50%);
	z-index: 1;
	width: 50%;
}
.event1, .event2, .event3{
 width: 100%;
  height: 100%;
  text-align: center;
  position: relative;
  z-index: 1;
}
.event1::after{
width: 100%;
  height: 100%;
  content: "";
background-image: url('/lodsing/resources/img/main/롯데시티호텔.jpg');
position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.5;
}
.event2::after{
width: 100%;
  height: 100%;
  content: "";
background-image: url('/lodsing/resources/img/main/코코모호텔.jpg');
position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.5;
}
.event3::after{
width: 100%;
  height: 100%;
  content: "";
background-image: url('/lodsing/resources/img/main/포포인츠바이.jpg');
position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.5;
}
</style>
</head>

<body>
	<header class="jbTitle">
		<div
			class="px-3 py-2 bg-white text-white navbar-light bg-light">
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
						<div class="user_name" style="color:black;">${user.memname}님 환영합니다.</div>
						</c:if>
						
						<c:if test="${ user.verify == admin }">
						<div class="user_name">${user.memname}님 환영합니다.</div>
						</c:if>
						
						
						
						
					<ul id="main_menu"
						class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
	
						<li><a href="#" class="nav-link text-black"> 내주변 </a></li>
						<li><a href="reservationlist.do" class="nav-link text-black"> 예약내역 </a></li>
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
					<li>
						<a href="admin.do" class="nav-link text-black"> 관리자 페이지 </a>
						</li>
						</c:if>
				</div>
			</div>
		</div>
	</header>
	<section style="margin-top:10px;">
		<div class="swiper-container rounded-4" style="height: 60%;">
			<div class="swiper-wrapper">
				<div class="swiper-slide" style="height: 550px;">
					<img
						src="/lodsing/resources/img/main/KakaoTalk_20220823_171951836.jpg">
				</div>
				<div class="swiper-slide" style="height: 550px;">
					<img src="/lodsing/resources/img/main/back2.jpg">
				</div>
				<div class="swiper-slide" style="height: 550px;">
					<img src="/lodsing/resources/img/main/back3.jpg">
				</div>
			</div>

		</div>
		<div class="box">
			<div class="main_link" style="border: 2px solid rgb(3, 101, 125); box-shadow: 1px 1px 1px 1px gray;  ">
				<ul>
					<li><a href="motel.do"><img
							src="/lodsing/resources/img/main/bed.png" style="width: 75px;"></span>
							<p>모텔</p> </a></li>
					<li><a href="hotel.do"><img
							src="/lodsing/resources/img/main/apartment.png"
							style="width: 75px;"></span>
							<p>호텔·리조트</p> </a></li>
					<li><a href="pension.do"><img
							src="/lodsing/resources/img/main/building.png"
							style="width: 75px;"></span>
							<p>펜션</p> </a></li>
					<li><a href="#"><img
							src="/lodsing/resources/img/main/navigator.png"
							style="width: 75px;"></span>
							<p>내주변 맛집</p> </a></li>
				</ul>
			</div>

		</div>
		<div class="container  py-5" id="custom-cards">
			
			<h2 class="pb-2 border-bottom text-start"><span style="color: rgb(3 101 125); font-weight: bold;">Lodging</span> 소식</h2>
			
			<div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
			  <div class="col">
				  <div class="event1 card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg" >
					<div class=" d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
						<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">롯데시티 호텔</h2>
						<ul class="d-flex list-unstyled mt-auto">
							
							<li class="d-flex align-items-center me-3">
								<svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
								<small>서울 구로구</small>
					  </li>
					  <li class="d-flex align-items-center">
						  <small></small>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="event2 card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg" >
				<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1" >
					<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold" >코코모 호텔</h2>
					<ul class="d-flex list-unstyled mt-auto">
						
						<li class="d-flex align-items-center me-3">
							<svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
							<small>서울 구로구</small>
						</li>
						<li class="d-flex align-items-center">
							<svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
							<small></small>
					  </li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="event3 card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg" >
				<div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1"  >
					<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">포포인츠 바이 쉐라톤</h2>
					<ul class="d-flex list-unstyled mt-auto">
						
						<li class="d-flex align-items-center me-3">
							<svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
							<small>서울 구로구</small>
						</li>
						<li class="d-flex align-items-center">
							<svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
							<small></small>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
 
</div>
<div class="appdown" style="background-image: url('/lodsing/resources/img/main/bg_appdown.png');">
	
	<p>앱 다운 받고 <b>더 많은 혜택</b> 받으세요</p>
	<div>
		<a href="//play.google.com/store/apps/details?id=kr.goodchoice.abouthere" class="down_and" target="_blank" title="구글플레이 새창"><img src="/lodsing/resources/img/main/banner_and.png" alt="GET IT ON Google Play"></a>
		<a href="//itunes.apple.com/kr/app/yeogieottae-1deung-sugbag/id884043462?mt=8&amp;ign-mpt=uo%3D2" class="down_ios" target="_blank" title="앱스토어 새창"><img src="/lodsing/resources/img/main/banner_ios.png" alt="Download on the App Store"></a>
	</div>
</div>
<div class="container  py-5" id="custom-cards">
			
	<h2 class="pb-2 border-bottom text-start"><span style="color: rgb(3 101 125); font-weight: bold;">이벤트</span></h2>
	
	<div class="swiper-container2 swiper2 rounded-4 row row-cols-1 row-cols-lg-3">
		<div class="swiper-wrapper" >
			<div class="swiper-slide"><img src="/lodsing/resources/img/main/main-baner.jpg"></div>
			<div class="swiper-slide"><img src="/lodsing/resources/img/main/main-baner2.jpg"></div>
			<!-- <div class="swiper-slide"><img style="animation: none;" src=""></div> -->
		</div>
	</div>
</div>

</div>



</section>


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

	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>