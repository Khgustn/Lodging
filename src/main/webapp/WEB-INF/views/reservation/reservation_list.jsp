<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">

<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<script src="/lodsing/resources/js2/jquery-scrollbar.js"></script>
<script src="/lodsing/resources/js2/main.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35d71e137b481a1c8d8befd339cf5e29&libraries=services"></script>

<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<link rel="stylesheet" href="/lodsing/resources/css/style.css">
 <link rel="stylesheet" href="/lodsing/resources/css/reservationList.css">
<link rel="stylesheet" href="/lodsing/resources/css/lee.css">

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>

<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->

<script>
	function cancel(booknum) {
		var result = confirm('예약을 취소하시겠습니까?');
		if (result) {
			location.href = "reservationcancel.do?booknum="
					+ booknum;
		} else {
			return;
		}
	}
	
	function bookingDetail(booknum) {
		const url = 'reservationdetail.do?booknum='
				+ bo_num
		const op = 'width=450, height=730, location=no, toolbar=no'
		open(url, '예약정보', op)
	}
	
	function review(booknum) {
		const url = 'review?booknum='
				+ booknum
		const op = 'width=450, height=500, location=no, toolbar=no'
		popup=open(url, '리뷰 작성', op)
		
		popup.addEventListener('beforeunload', function() {
			  	setTimeout(() => {
					window.location.reload();
			  	}, 1000)
			});
	}
	
</script>
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
									<li><a class="dropdown-item" href="#">자주묻는 질문</a></li>
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


	<section class=" container">
		<div class="row justify-content-center">
			
			<div
				class="col-2 d-flex flex-column flex-shrink-0 p-3 text-black bg-light side_menu"
				  style="margin-right:35px; width:17%">
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item fw-bold"><a href="reservationlist.do"
						class="nav-link  rhda "><span class="red"> 예약내역 </span></a></li>
					<li class="nav-item link-dark"><a href="memberinfo.do"
						class="nav-link  rhda ">내정보관리 </a></li>
					<li class="nav-item link-dark fw-bold" ><a
						href="myreview.do?memid=${user.memid}" class="nav-link rhda fw-bold" >
							내가 작성한 리뷰 </a></li>
					<li class="nav-item fw-bold"><a
						href="${pageContext.request.contextPath}/member/myWish"
						class="nav-link text-black  rhda"> 찜한 숙소 </a></li>

				</ul>
			</div>

			<div class="col-8 mt-5">
				<ul class="nav nav-tabs nav-justified">
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="tab" href="#status_1" style="color: black;">예약완료</a>
					</li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#status_2" style="color: black;">예약취소</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#status_3" style="color: black;">이용완료</a></li>
				</ul>

				<div class="tab-content">



					<div class="tab-pane active" id="status_1">

						<c:forEach var="booking" items="${bookinglist}" varStatus="s">
							<c:if test="${booking.bookstatus == 1}">
								<div class="reserveMember_room">

									<p class="reserveMember_pic_view">
										<img src="/lodsing/resources/upload/${booking.filename}">
									</p>
									<span class="reserveMember_room_title">${booking.buname}</span>
									<span class="reserveMember_room_name">${booking.roomname}</span>

									<div class="mt-2">
										<span class="reserveMember_room_date">
											${fn:substring(booking.bookcheckin,0,4)}.
											${fn:substring(booking.bookcheckin,4,6)}.
											${fn:substring(booking.bookcheckin,6,8)} ~
											${fn:substring(booking.bookcheckout,0,4)}.
											${fn:substring(booking.bookcheckout,4,6)}.
											${fn:substring(booking.bookcheckout,6,8)} </span>
									</div>

									<hr class="gray_line">

									<div class="mt-2">
										<span class="reserveMember_room_name"> <b><fmt:formatNumber
													value="${booking.bookprice}" pattern="#,###" />원</b>
										</span> <span class="reserveMember_room_date mt-2">
											${fn:substring(booking.bookregdate,0,4)}년
											${fn:substring(booking.bookregdate,4,6)}월
											${fn:substring(booking.bookregdate,6,8)}일 ㆍ
											${booking.bookpayment} </span>
									</div>

									<div class="row">
										<div class="col-sm-6 center_box">
											<button type="button"
												class="reserveMember_room_btn default_btn medium_text rounded"
												onclick="bookingDetail('${booking.booknum}')">예약 정보</button>
										</div>
										<div class="col-sm-6 center_box">
											<button type="button" onclick="cancel('${booking.booknum}')"
												class="reserveMember_room_btn default_btn medium_text rounded"
												style="background-color: red;">예약 취소</button>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<div class="tab-pane fade" id="status_2">
						<c:forEach var="booking" items="${bookinglist}" varStatus="s">
							<c:if test="${booking.bookstatus == 2}">
								<div class="reserveMember_room">
									<p class="reserveMember_pic_view">
										<img src="/lodsing/resources/upload/${booking.filename}">
									</p>
									<span class="reserveMember_room_title">${booking.buname}</span>
									<span class="reserveMember_room_name">${booking.roomname}</span>

									<div class="mt-2">
										<span class="reserveMember_room_date">
											${fn:substring(booking.bookcheckin,0,4)}.
											${fn:substring(booking.bookcheckin,4,6)}.
											${fn:substring(booking.bookcheckin,6,8)} ~
											${fn:substring(booking.bookcheckout,0,4)}.
											${fn:substring(booking.bookcheckout,4,6)}.
											${fn:substring(booking.bookcheckout,6,8)} </span>
									</div>

									<hr class="gray_line">

									<div class="mt-2">
										<span class="reserveMember_room_name"> <b><fmt:formatNumber
													value="${booking.bookprice}" pattern="#,###" />원</b>
										</span> <span class="reserveMember_room_date mt-2">
											${fn:substring(booking.bookregdate,0,4)}년
											${fn:substring(booking.bookregdate,4,6)}월
											${fn:substring(booking.bookregdate,6,8)}일 ㆍ
											${booking.bookpayment} </span>
									</div>

									<div class="center_box">
										<button type="button"
											class="reserveMember_room_btn default_btn medium_text rounded"
											onclick="bookingDetail('${booking.booknum}')">예약 정보</button>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<div class="tab-pane fade" id="status_3">
						<c:forEach var="booking" items="${bookinglist}" varStatus="s">
							<c:if
								test="${booking.bookstatus == 3 || booking.bookstatus == 4}">
								<div class="reserveMember_room">
									<p class="reserveMember_pic_view">
										<img src="/lodsing/resources/upload/${booking.filename}">
									</p>
									<span class="reserveMember_room_title">${booking.buname}</span>
									<span class="reserveMember_room_name">${booking.roomname}</span>

									<div class="mt-2">
										<span class="reserveMember_room_date">
											${fn:substring(booking.bookcheckin,0,4)}.
											${fn:substring(booking.bookcheckin,4,6)}.
											${fn:substring(booking.bookcheckin,6,8)} ~
											${fn:substring(booking.bookcheckout,0,4)}.
											${fn:substring(booking.bookcheckout,4,6)}.
											${fn:substring(booking.bookcheckout,6,8)} </span>
									</div>

									<hr class="gray_line">

									<div class="mt-2">
										<span class="reserveMember_room_name"> <b><fmt:formatNumber
													value="${booking.bookprice}" pattern="#,###" />원</b>
										</span> <span class="reserveMember_room_date mt-2">
											${fn:substring(booking.bookregdate,0,4)}년
											${fn:substring(booking.bookregdate,4,6)}월
											${fn:substring(booking.bookregdate,6,8)}일 ㆍ
											${booking.bookpayment} </span>
									</div>

									<div class="row">
										<div class="col-sm-6 center_box">
											<button type="button"
												class="reserveMember_room_btn default_btn medium_text rounded"
												onclick="bookingDetail(${booking.booknum})">예약 정보</button>
										</div>
										<div class="col-sm-6 center_box">
											<c:choose>
												<c:when test="${booking.revNum != 0}">
													<button type="button"
														class="reserveMember_room_btn default_btn medium_text rounded"
														disabled>후기 작성 완료</button>
												</c:when>

												<c:otherwise>
													<button type="button"
														onclick="review('${booking.booknum}')"
														class="reserveMember_room_btn default_btn medium_text rounded">
														후기 작성</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<!-- 이용완료 끝 -->
				</div>
			</div>
		</div>
	</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>