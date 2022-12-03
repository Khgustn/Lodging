<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png"
	rel="shortcut icon" type="image/x-icon">

<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/swiper.min.css"
	type="text/css">
<script src="/lodsing/resources/js2/main.js"></script>
<style>
a {
	text-decoration: none;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: inherit;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$('li.tabs a').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('li.tabs a').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	});
	
	$(document).ready(function(){
		$('li.tabs a').click(function(){
			
		$('li.tabs a').removeClass('rhda');
		$('li.tabs a').removeClass('red');
		$(this).addClass('red');
		$('li.tabs a').addClass('rhda');
		
		})
	});
</script>
</head>
<body>
	<header class="jbTitle">
		<div class="px-3 py-2 bg-white text-white navbar-light bg-light">
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
						<li><a href="reservationlist.do" class="nav-link text-black">
								예약내역 </a></li>
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
						<%-- <li><c:if test="${ empty user }">
								<a href="login_form.do" class="nav-link text-black"> 로그인 </a>
							</c:if>
							  <c:if test="${ !empty user }">
								<a href="logout.do" class="nav-link text-black"> 로그아웃 </a>
							</c:if></li>
					<c:if test="${user.verify =='관리자'}">
						<li><a href="admin.do" class="nav-link text-black"> 관리자
								페이지 </a></li>
					</c:if> --%>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<section class="container">
		<div class="row justify-content-center">
			<div
				class="d-flex flex-column flex-shrink-0 p-3 text-black bg-white col-3 side_menu">

				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#"
						class="nav-link text-black rhda" aria-current="page"> 공지사항 </a></li>
					<li><a href="#" class="nav-link text-black "> <span
							class="red">자주묻는 질문</span>
					</a></li>
					<li><a href="#" class="nav-link text-black rhda"> 약관 및 정책
					</a></li>
					<li><a href="#" class="nav-link text-black rhda"> 채용약관 </a></li>
					<li><a href="#" class="nav-link text-black rhda"> </a></li>
				</ul>
			</div>
			<div class="accordion accordion-flush col-8 "
				id="accordionFlushExample"
				style="margin-bottom: 80px; margin-top: 40px;">
				<div class="headermenu tabs"
					style="padding: 20px; border-bottom: 2px solid rgb(3, 101, 125);">
					<ul  style="display:inline-block">
						<li class="tabs">
						<a class="tab-link current red" data-tab="tab-1"  style="cursor:pointer;"> TOP 7</a>
						<a class="tab-link rhda" data-tab="tab-2" style="cursor:pointer;">이용문의</a>
						<a class="tab-link rhda" data-tab="tab-3"  style="cursor:pointer;">결제/영수증</a>
						<a class="tab-link rhda" data-tab="tab-4"  style="cursor:pointer;">쿠폰/포인트</a>
						<a class="tab-link rhda" data-tab="tab-5"  style="cursor:pointer;">리뷰</a>
						<a class="tab-link rhda" data-tab="tab-6"  style="cursor:pointer;">국내숙소</a></li>
					</ul>

				</div>
				<div id="tab-1" class="tab-content current">
					<div class="accordion-item " style="padding-top: 15px;">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
								[숙박]예약을 취소하고 싶어요</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">예약취소는 앱/웹 > 내정보 > 예약/구매내역에서 직접
								가능합니다. 예약/결제 진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 취소수수료를
								차감한 금액으로 환불 처리됩니다. 일부 숙소에 한해 취소가 가능한 시점이나 앱/웹에서 취소가 불가할 수 있으니 이
								경우에는 고객행복센터로 요청해 주시길 바랍니다.</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed " type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								[공통]천재지변/감염병으로 인한 예약취소는 어떻게 하나요?</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body"
								style="background-color: rgb(240, 240, 240);">
								<p>
									천재지변(기상악화), 법정 감염병 등 불가항력적인 사유로 제휴점 이용이 불가할 경우 고객행복센터로 예약내역 및
									증빙서류(결항확인서, e-티켓, 진단확인서 등)를 보내주시면 확인 후 예약취소 가능 여부를 확인해 드립니다.<br>

									다만, 당사는 판매 중개 플랫폼의 입장으로 제휴점에 대하여 취소/환불을 강제할 수 없어 각 제휴점의 규정에
									근거하여 상황에 따라 수수료가 발생하거나 취소가 어려울 수 있는 점 양해 부탁드립니다.<br>

									[접수방법]<br> ※ 이메일 : help@goodchoice.kr (예약자명, 숙소명, 체크인 날짜
									필수)<br> ※ 카카오톡 : 카카오톡 내 플러스 친구 > 여기어때 고객행복센터 추가<br>
								</p>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								[숙박]예약대기 건 예약취소하고 싶어요.</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse"
							aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="accordion-body">예약 대기중에는 여기어때 고객행복센터에 예약취소
								요청해주시길 바랍니다. 단, 예약확정이 될 경우 수수료가 발생하거나 예약취소가 불가할 수 있습니다.</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFour">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">
								[숙박]체크인 날짜/객실타입을 변경하고 싶어요.</button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse"
							aria-labelledby="headingFour" data-bs-parent="#accordionExample">
							<div class="accordion-body">예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은
								불가합니다. 예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소 후 재결제
								하셔서 이용 부탁드립니다. 만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길
								바랍니다.</div>
						</div>
					</div>
					<div class="accordion-item">

						<h2 class="accordion-header" id="headingFive">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFive"
								aria-expanded="false" aria-controls="collapseFive">
								[공통] 현금영수증을 받고싶어요.</button>
						</h2>
						<div id="collapseFive" class="accordion-collapse collapse"
							aria-labelledby="headingFive" data-bs-parent="#accordionExample">
							<div class="accordion-body">현금영수증은 현금성 결제수단으로 결제 시 발급이
								가능합니다. 결제 단계에서 현금영수증을 신청하면 자동으로 발행되지만, 신청을 누락했거나 발행받지 못한 경우라면
								영수증 확인 후 국세청에서 자진발급분을 등록해 주시길 바랍니다. [네이버페이] - 결제 단계에서 현금영수증 신청하면
								자동으로 발행 (19년 12월 26일 시행) - 자진발급 : 네이버페이 > 결제내역 > 주문건 > 주문상세정보 >
								영수증 발급내역 > 현금영수증 확인 - 단, 19년 12월 26일 10시 이전 결제 건은 여기어때 고객행복센터로
								요청 [간편계좌이체 / TOSS / PAYCO] - 결제 단계에서 현금영수증 신청하면 자동으로 발행 - 단,
								간편계좌이체의 경우 신청 누락 시 여기어때 고객행복센터로 요청 [카카오페이] - 카카오페이머니 결제 시 자동으로
								발행 - 자진발급 : 카카오톡 > pay > 우측톱니바퀴(나의 카카오페이) > 이용내역 > 결제 > 개별 상세내역
								> 현금영수증 확인</div>
						</div>
					</div>
					<div class="accordion-item">

						<h2 class="accordion-header" id="headingSix">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseSix"
								aria-expanded="false" aria-controls="collapseSix">[공통]
								영수증(거래내역서)발급받고 싶어요.</button>
						</h2>
						<div id="collapseSix" class="accordion-collapse collapse"
							aria-labelledby="headingSix" data-bs-parent="#accordionExample">
							<div class="accordion-body">예약정보와 결제정보가 기재되어 있는 영수증(거래내역서)은
								여기어때 고객행복센터로 문의하시면 발급이 가능합니다. 예약내역, 영수증을 받으실 이메일 주소(또는 FAX번호)를
								1:1문의 또는 카카오 상담톡으로 남겨주시길 바라며, 발급 완료까지는 영업일 기준 최대 1~2일 소요되오니 시간
								양해 부탁드립니다.</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingSeven">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseSeven"
								aria-expanded="false" aria-controls="collapseSeven">
								[공통]엘리트 적립이 안돼요.</button>
						</h2>
						<div id="collapseSeven" class="accordion-collapse collapse"
							aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
							<div class="accordion-body">엘리트는 여기어때를 통해 숙소/모바일티켓 상관없이 실
								결제금액 3만원 이상 예약한 경우에만 적용되며 숙소는 체크아웃(퇴실), 모바일티켓은 이용 완료 후 자동 적립됩니다.

								쿠폰/포인트 사용 후 실 결제금액이 3만원 미만일 경우 적립이 불가하오니 결제금액을 확인해주시길 바랍니다.
								공간대여/실시간 렌터카 상품은 엘리트 적립에서 제외됩니다.</div>
						</div>
					</div>
				</div>
				<div id="tab-2" class="tab-content ">
					<div class="accordion-item " style="padding-top: 15px;">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
								[이용문의] 고객센터 연결 지연 시 어떻게 하나요?</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수 있습니다. &nbsp; <span
									style="font-size: 13.3333px;">여기어때를 통해 숙소/모바일티켓 상관없이 실
									결제금액 3만원 이상 5번을 예약하면 자동 등업되어 엘리트가 됩니다.</span> <span
									style="font-size: 13.3333px;">나의 적립 상태는 앱 하단 내정보 &gt;
									엘리트 메뉴에서 확인해 주세요!</span> <span style="font-size: 13.3333px;">공간대여/실시간
									렌터카 상품은 엘리트 적립에서 제외되니 참고바랍니다.</span>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed " type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								[이용문의] 어떻게하면 엘리트가 될 수 있나요?</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body"
								style="background-color: rgb(240, 240, 240);">
								<span style="font-size: 13.3333px;">여기어때를 통해 숙소/모바일티켓
									상관없이 실 결제금액 3만원 이상 5번을 예약하면 자동 등업되어 엘리트가 됩니다.</span> <span
									style="font-size: 13.3333px;">나의 적립 상태는 앱 하단 내정보 &gt;
									엘리트 메뉴에서 확인해 주세요!</span> <span style="font-size: 13.3333px;">공간대여/실시간
									렌터카 상품은 엘리트 적립에서 제외되니 참고바랍니다.</span>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								[이용문의] 엘리트 적립이 안돼요.</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse"
							aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<span style="font-size: 13.3333px;">엘리트는 여기어때를 통해
									숙소/모바일티켓 상관없이 실 결제금액 3만원 이상 예약한 경우에만 적용되며 숙소는 체크아웃(퇴실), 모바일티켓은
									이용 완료 후 자동 적립됩니다.</span> <span style="font-size: 13.3333px;">쿠폰/포인트
									사용 후 실 결제금액이 3만원 미만일 경우 적립이 불가하오니 결제금액을 확인해주시길 바랍니다.</span> <span
									style="font-size: 13.3333px;">공간대여/실시간 렌터카 상품은 엘리트 적립에서
									제외되니 참고바랍니다.</span>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFour">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">
								[이용문의] 정확한 내 위치 확인이 안돼요.</button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse"
							aria-labelledby="headingFour" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<span style="font-family: arial; font-size: 10pt;">여기어때는
									위치기반 서비스로 정확한 위치가 인식되어야 정상적인 이용이 가능합니다.&nbsp;</span> <span
									style="font-family: arial; font-size: 10pt;">단말기의 GPS를
									통한 내 위치 설정 시, 단말기 상태에 따라 위치 인식에 예외사항이 발생할 수 있으니, GPS 재설정을 통해
									정확하게 확인해 주시기 바랍니다.</span> <span
									style="font-family: arial; font-size: 10pt;">만약 같은 불편을
									계속 겪으실 경우, 단말기의 소프트웨어 업데이트 또는 데이터 환경 확인 및 앱을 완전히 삭제 후 재설치
									부탁드립니다.</span>
							</div>
						</div>
					</div>
					<div class="accordion-item">

						<h2 class="accordion-header" id="headingFive">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFive"
								aria-expanded="false" aria-controls="collapseFive">
								[이용문의] 숙소 정보를 공유하는 기능이 있나요?</button>
						</h2>
						<div id="collapseFive" class="accordion-collapse collapse"
							aria-labelledby="headingFive" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<span style="font-family: arial; font-size: 10pt;">숙소
									상세페이지 &gt; 오른쪽 상단의 공유하기 아이콘을 클릭하시면 카카오톡, 문자메시지로 빠르게 공유할 수 있습니다.</span>
								<span style="font-family: arial; font-size: 10pt;">여기어때의
									공유 기능을 통해 주변 지인들에게 숙소를 공유해 보세요!</span>

							</div>
						</div>
					</div>
					<div class="accordion-item">

						<h2 class="accordion-header" id="headingSix">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseSix"
								aria-expanded="false" aria-controls="collapseSix">
								[이용문의] 운영중인 숙소를 등록하고 싶어요.</button>
						</h2>
						<div id="collapseSix" class="accordion-collapse collapse"
							aria-labelledby="headingSix" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<span style="font-size: 13.3333px;">여기어때 입점 광고를 원하실 경우
									고객행복센터로 문의해 주시면 친절하게 안내드리겠습니다.</span> <span
									style="font-size: 13.3333px;">※ 전화문의 : 1544-4087 (상담시간 :
									오전 9시~익일 3시)&nbsp;</span>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingSeven">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseSeven"
								aria-expanded="false" aria-controls="collapseSeven">
								[회원정보] 회원탈퇴는 어떻게 하나요?</button>
						</h2>
						<div id="collapseSeven" class="accordion-collapse collapse"
							aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="text-align: left;">
								<span style="font-size: 13.3333px;">회원탈퇴는 아래 방법을 통해
									가능하며,&nbsp;</span> <span
									style="font-size: 13.3333px; font-family: arial;">반드시
									주의사항을 확인 후 진행해 주시기 바랍니다.</span><br> <span
									style="font-size: 13.3333px;">[일반회원]</span><br> <span
									style="font-size: 13.3333px;">- lodging 웹 &gt; 내정보 &gt;
									내정보 관리 &gt; 회원탈퇴&nbsp;</span><br> <span
									style="font-size: 13.3333px;">[기업회원]</span><br> <span
									style="font-size: 13.3333px;">- 개별적으로 회원탈퇴 불가</span><br> <span
									style="font-size: 13.3333px;">- 기업 담당자 문의 또는 여기어때
									고객행복센터로 기업회원 탈퇴요청&nbsp;</span><br> <span
									style="font-size: 13.3333px;">*주의사항</span><br> <span
									style="font-size: 13.3333px;">· 회원탈퇴 시 계정 정보는 복구가 불가하며
									1일 이후 재가입이 가능합니다.</span><br> <span style="font-size: 13.3333px;">·
									현재 보유 중인 포인트, 쿠폰은 모두 소멸되며 복구할 수 없습니다.</span><br> <span
									style="font-size: 13.3333px;">· 탈퇴 후, 기존 가입 휴대기기로 재가입 시
									첫 혜택을 받을 수 없습니다. (신규 회원 쿠폰, 첫 리뷰 작성 1,000포인트 등)</span><br> <span
									style="font-family: arial; font-size: 13.3333px;">· 등록된
									리뷰는 자동으로 삭제되지 않습니다. 삭제를 원하실 경우 탈퇴 전 개별적으로 삭제해 주시기 바랍니다.</span>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingEight">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseEight"
								aria-expanded="false" aria-controls="collapseEight">
								[회원정보] 소셜회원 로그인 해제는 어떻게 하나요?</button>
						</h2>
						<div id="collapseEight" class="accordion-collapse collapse"
							aria-labelledby="headingEight" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<span style="font-size: 13px; white-space: pre-wrap;">소셜
									회원의 로그인은 가입 시 연동 된 계정으로 자동 로그인 됩니다. 동일한 소셜의 다른 계정으로 로그인을 원하시는
									경우 연동 로그인 해제 후 </span> <span
									style="font-size: 13px; white-space: pre-wrap; font-family: Arial;">접속을
									원하는 계정으로 로그인을 시도해 주시길 바랍니다.</span> <span
									style="font-size: 13px; white-space: pre-wrap;"> [네이버] ①
									여기어때 APP내 로그인 되어있는 이메일 주소로 네이버 로그인 진행 ② 네이버 설정 접속 후 내정보/보안기능 접속
									③ 네이버와 연결된 서비스 관리 선택 ④ 여기어때 선택 후 정보 제공 철회 버튼 클릭 -&gt; 여기어때 APP
									재접속 후 원하는 네이버 연동 아이디 선택 후 로그인 가능 [카카오톡] ① 여기어때 APP내 로그인 되어있는
									카카오 계정으로 카카오톡 접속 ② 카카오톡 전체 설정 선택 후 개인/보안 클릭 ③ 개인정보 관리 선택 후
									카카오계정 및 연결된 서비스 접속 ④ 연결된 서비스 관리에서 여기어때 선택 후 모든 정보 삭제 클릭 -&gt;
									여기어때 APP 재접속 후 원하는 네이버 연동 아이디 선택 후 로그인 가능 [페이스북] ① 여기어때 APP내
									로그인 되어있는 ID로 페이스북 접속 ② 페이스북 설정 선택 후 앱과 웹사이트 접속 ③ 페이스북 계정으로 로그인한
									앱 및 웹사이트 클릭 후 여기어때 삭제 -&gt; 여기어때 APP 재접속 후 원하는 네이버 연동 아이디 선택 후
									로그인 가능</span>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="heading1">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapse1"
								aria-expanded="false" aria-controls="collapse1">[회원정보]
								여러 개의 아이디를 만들 수 있나요?</button>
						</h2>
						<div id="collapse1" class="accordion-collapse collapse"
							aria-labelledby="heading1" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<span style="font-family: arial; font-size: 10pt;">여기어때는
									한 명이 여러 개의 아이디를 만드는 것을 허용합니다.</span> <span
									style="font-family: arial; font-size: 10pt;">단, 개별 아이디에
									적립된 포인트나 쿠폰, 구매내역 등은 통합 또는 양도가 불가하며, 각각의 아이디에서만 확인 가능합니다.</span>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="heading2">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapse2"
								aria-expanded="false" aria-controls="collapse2">[회원정보]
								아이디와 비밀번호를 잊었어요.</button>
						</h2>
						<div id="collapse2" class="accordion-collapse collapse"
							aria-labelledby="heading2" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="ans on">
									<div>
										<span style="font-size: 13.3333px;">[아이디 찾기]</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">&nbsp;&nbsp;</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">1. 이메일 주소로 가입한 회원 :
											가입 시 등록한 닉네임이나 이메일 주소 일부를 고객행복센터에 조회 요청</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">2. 카카오톡/페이스북/네이버
											계정으로 가입한 회원 : 해당 계정관리 업체의 고객센터에 문의</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">&nbsp;</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">[비밀번호 찾기]</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">- 이메일주소 가입만 해당</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">&nbsp;&nbsp;</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">1. 이메일로 로그인하기 &gt;
											비밀번호 재설정&nbsp;</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">2. 가입 시 등록한 이메일 주소
											입력</span>

									</div>
									<div>
										<span style="font-size: 13.3333px;">3. 인증수단 선택 (휴대폰번호
											또는 이메일 주소)</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">4. 발급받은 인증번호 입력을 통해
											새로운 비밀번호 생성</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">&nbsp;&nbsp;</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">위 방법으로도 이용에 불편을 겪으실
											경우 여기어때 고객행복센터로 문의해주시길 바랍니다.</span>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="heading3">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapse3"
								aria-expanded="false" aria-controls="collapse3">[회원정보]
								회원정보 수정은 어떻게 하나요?</button>
						</h2>
						<div id="collapse3" class="accordion-collapse collapse"
							aria-labelledby="heading3" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="ans on" style="text-align: left;">
									<div>
										<div>
											<span style="font-family: arial; font-size: 10pt;">앱
												하단 내정보 &gt; 내 정보 관리에서 회원정보를 수정할 수 있습니다.&nbsp;</span>
										</div>
										<div>
											<br>
										</div>
										<div>
											<span style="font-family: arial; font-size: 10pt;">닉네임
												변경 시, 이미 사용중인 닉네임으로는 변경이 어려우며, 최근 30일 동안 1회만 변경 가능합니다.</span>
										</div>
									</div>
									<div>
										<br>
									</div>
									<div>
										<span style="font-family: arial; font-size: 10pt;">*
											회원정보 : 닉네임, 예약자명, 휴대폰 번호, 비밀번호(이메일 로그인 시에만 변경 가능)</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="tab-3" class="tab-content ">
					<div class="accordion-item " style="padding-top: 15px;">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
								현금영수증 발급받고 싶어요.</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<div>
									<span style="font-size: 13.3333px;">현금영수증은 현금성 결제수단으로 결제
										시 발급이 가능합니다.</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>

								</div>
								<div>
									<span style="font-size: 13.3333px;">결제 단계에서 현금영수증을 신청하면
										자동으로 발행되지만,</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">신청을 누락했거나 발행받지 못한
										경우라면 영수증 확인 후 국세청에서 자진발급분을 등록해 주시길 바랍니다.</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>

								</div>
								<div>
									<span style="font-size: 13.3333px;">[네이버페이]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 결제 단계에서 현금영수증 신청하면
										자동으로 발행 (19년 12월 26일 시행)</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 자진발급 : 네이버페이 &gt;
										결제내역 &gt; 주문건 &gt; 주문상세정보 &gt; 영수증 발급내역 &gt; 현금영수증 확인</span>

								</div>
								<div>
									<span style="font-size: 13.3333px;">- 단, 19년 12월 26일 10시
										이전 결제 건은 여기어때 고객행복센터로 요청</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>

								</div>
								<div>
									<span style="font-size: 13.3333px;">[간편계좌이체 / TOSS /
										PAYCO]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 결제 단계에서 현금영수증 신청하면
										자동으로 발행</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 단, 간편계좌이체의 경우 신청
										누락 시 여기어때 고객행복센터로 요청</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>

								</div>
								<div>
									<span style="font-size: 13.3333px;">[카카오페이]&nbsp;</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 카카오페이머니 결제 시 자동으로
										발행</span></font>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 자진발급 : 카카오톡 &gt;
										pay &gt; 우측톱니바퀴(나의 카카오페이) &gt; 이용내역 &gt; 결제 &gt; 개별 상세내역 &gt;
										현금영수증 확인</span>
								</div>


							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed " type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								영수증(거래내역서) 발급받고 싶어요.</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body"
								style="background-color: rgb(240, 240, 240);">
								<div>
									<span style="font-size: 13.3333px;">예약정보와 결제정보가 기재되어 있는
										영수증(거래내역서)은 여기어때 고객행복센터로 문의하시면 발급이 가능합니다.</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>

								</div>
								<div>
									<span style="font-size: 13.3333px;">예약내역, 영수증을 받으실 이메일
										주소(또는 FAX번호)를 1:1문의 또는 카카오 상담톡으로 남겨주시길 바라며, 발급 완료까지는 영업일 기준 최대
										1~2일 소요되오니 시간 양해 부탁드립니다.</span>
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">결제
								영수증 발급받고 싶어요.</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse"
							aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<div>
									<span style="font-size: 13.3333px;">결제 영수증은 결제수단에 따라
										확인/발급 방법이 상이하오니 아래 내용을 참고해 주시기 바랍니다.</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">[신용/체크카드/KB pay]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 여기어때 앱 &gt; 하단 내정보
										&gt; 예약/구매내역 &gt; 결제 증빙 보기</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 예약내역이 삭제되었을 경우
										토스페이먼츠 홈페이지에서 조회</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">[휴대폰 결제, PAYCO,
										카카오페이, 토스, 간편계좌이체]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 여기어때 앱 &gt; 하단 내정보
										&gt; 예약/구매내역 &gt; 결제 증빙 보기</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 예약내역이 삭제되었을 경우 각
										결제 대행사 홈페이지에서 조회</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">[네이버페이]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 네이버페이 &gt; 결제내역
										&gt; 상품 &gt; 결제 상세 &gt; 영수증 조회</span>
								</div>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFour">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">계좌
								등록 후 은행에서 문자가 왔어요.</button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse"
							aria-labelledby="headingFour" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<div>
									<div>
										<span style="font-family: arial; font-size: 10pt;">간편계좌이체,
											TOSS에 계좌 등록 시 은행에서 자동이체 서비스가 등록되었다는 문자가 발송될 수 있습니다.</span>
									</div>
								</div>
								<div>
									<br>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">매달 일정
										금액이 자동이체 되는 것이 아니라, 결제 시 비밀번호 인증 후 이체되는 서비스이니 안심하고 이용해주시길
										바랍니다.</span>
								</div>


							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFive">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFive"
								aria-expanded="false" aria-controls="collapseFive">
								간편계좌이체 등록 해지는 어떻게 하나요?</button>
						</h2>
						<div id="collapseFive" class="accordion-collapse collapse"
							aria-labelledby="headingFive" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<div>
									<span style="font-size: 13.3333px;">숙소 예약 페이지 내에서 변경이
										가능합니다.&nbsp;</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">[해지 방법]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">예약 페이지 &gt; 간편계좌이체
										결제수단 선택 &gt; 결제하기 버튼 &gt; 해지할 은행 선택&gt; 계좌/비밀번호 관리 메뉴에서 해지 가능</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">*결제완료전 단계로 실제 결제가
										발생되지 않습니다.</span>
								</div>

							</div>
						</div>
					</div>
					<div class="accordion-item">

						<h2 class="accordion-header" id="headingSix">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseSix"
								aria-expanded="false" aria-controls="collapseSix">
								간편계좌이체 한도 초과로 결제가 불가해요.</button>
						</h2>
						<div id="collapseSix" class="accordion-collapse collapse"
							aria-labelledby="headingSix" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<div>
									<span style="font-size: 13.3333px;">간편계좌이체 한도는 1일 1회
										2백만원, 월 5백만원으로 설정되어 있습니다.</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>

								</div>
								<div>
									<span style="font-size: 13.3333px;">은행 이체 한도와는 관계없이
										간편계좌이체 거래금액 한도 초과 시 결제가 불가하오니 이 경우 다른 결제수단을 사용하여 이용해 주시길 바랍니다.</span>
								</div>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingSeven">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseSeven"
								aria-expanded="false" aria-controls="collapseSeven">
								사용가능한 카드 종류가 없어요.</button>
						</h2>
						<div id="collapseSeven" class="accordion-collapse collapse"
							aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
							<div class="accordion-body">


								<div>
									<span style="font-family: arial; font-size: 10pt;">여기어때
										예약 서비스 결제 시 사용 가능한 카드 종류는 PG사(전자결제 대행사)에서 정하는 부분이므로 일부 카드는
										결제지원이 불가할 수 있습니다.</span>
								</div>
								<div>
									<br>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">IBK기업은행
										카드의 경우 목록에서 비씨를 선택하시면 결제 가능하오니 이용에 참고 부탁드립니다.</span>
								</div>


							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="heading1">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapse1"
								aria-expanded="false" aria-controls="collapse1">[포인트]
								포인트 사용과 관련된 상세 내역을 확인할 수 있나요?</button>
						</h2>
						<div id="collapse1" class="accordion-collapse collapse"
							aria-labelledby="heading1" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<div>
									<span style="font-family: arial; font-size: 10pt;">네, 상세
										내역을 확인할 수 있어요.</span>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">상세
										내역에서 크게 3가지 정보를 제공해요. 사용된 포인트 전체 금액과 사용 날짜 그리고 사용 기간(최초 적립일
										기준)을 알려드려요.</span>
								</div>
								<div>
									<br>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">포인트
										'사용' 내역을 확인하고 싶다면, 화면 상단의 '전체' 또는 '사용' 버튼을 누른 뒤 사용한 포인트 금액을
										선택해주세요.</span>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">포인트
										'사용 취소' 내역을 확인하고 싶다면, '전체' 또는 '적립' 버튼을 누른 뒤 사용 취소한 금액을 선택해주세요.</span>
								</div>

							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="heading2">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapse2"
								aria-expanded="false" aria-controls="collapse2">'영수증
								확인하기' 누르면 흰색 화면만 보여요.</button>
						</h2>
						<div id="collapse2" class="accordion-collapse collapse"
							aria-labelledby="heading2" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<div>
									<span style="font-family: arial; font-size: 10pt;">사용하는
										모바일 브라우저의 팝업이 차단되었을 경우, 빈 화면만 보이거나 하얗게 보일 수 있습니다.</span>
								</div>
								<div>
									<br>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">모바일
										브라우저의 팝업을 허용 한 후 다시 한 번 시도 부탁드립니다.</span>
								</div>
								<div>
									<br>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">[안드로이드]</span>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">사용하는
										모바일 브라우저 설정 &gt; 사이트 설정 &gt; 팝업 허용</span>
								</div>
								<div>
									<br>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">[아이폰]</span>
								</div>
								<div>
									<span style="font-family: arial; font-size: 10pt;">아이폰
										&gt; 설정 &gt; Safari &gt; 팝업 허용</span>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div id="tab-4" class="tab-content ">
					
						<div class="accordion-item " style="padding-top: 15px;">
							<h2 class="accordion-header" id="flush-headingOne">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
									aria-expanded="false" aria-controls="flush-collapseOne">
									[포인트]포인트는 무엇인가요?</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse"
								aria-labelledby="flush-headingOne"
								data-bs-parent="#accordionFlushExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">리얼리뷰
											작성이나 이벤트 참여 등 여기어때 서비스를 이용하면서 적립된 포인트를 말해요.</span>
									</div>
									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">포인트는
											사용 기간 내에 여기어때 서비스를 이용할 때 쓸 수 있어요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingTwo">
								<button class="accordion-button collapsed " type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									[포인트]포인트 사용 기간이 궁금해요.</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse"
								aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								<div class="accordion-body"
									style="background-color: rgb(240, 240, 240);">
									<span
										style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">포인트
										사용 기간은 적립일에 따라 각각 달라요.</span>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingThree">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									[포인트]포인트 차감 순서가 궁금해요.</button>
							</h2>
							<div id="collapseThree" class="accordion-collapse collapse"
								aria-labelledby="headingThree"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">포인트
											차감 순서는 적립된 포인트 중 사용 기간이 가장 짧은 포인트부터 먼저 차감돼요.</span>
									</div>
									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">사용
											기간이 똑같다면, 적립일이 빠른 포인트부터 소멸돼요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingFour">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">
									[포인트] 소멸 예정 포인트는 무엇인가요?</button>
							</h2>
							<div id="collapseFour" class="accordion-collapse collapse"
								aria-labelledby="headingFour" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">소멸
											예정 포인트는 30일 이내에 소멸되는 포인트를 말해요.</span>
									</div>
									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">사용
											기간이 지난 포인트는 자동으로 소멸되고, 소멸된 포인트는 복원되지 않아요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">

							<h2 class="accordion-header" id="headingFive">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFive"
									aria-expanded="false" aria-controls="collapseFive">
									[포인트] 소멸 예정인 포인트를 확인할 수 있나요?</button>
							</h2>
							<div id="collapseFive" class="accordion-collapse collapse"
								aria-labelledby="headingFive" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">소멸
											예정 포인트는 30일 이내에 소멸되는 포인트를 말해요.</span>
									</div>
									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">사용
											기간이 지난 포인트는 자동으로 소멸되고, 소멸된 포인트는 복원되지 않아요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">

							<h2 class="accordion-header" id="headingSix">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseSix"
									aria-expanded="false" aria-controls="collapseSix">
									[포인트] 소멸 예정인 포인트를 확인할 수 있나요?</button>
							</h2>
							<div id="collapseSix" class="accordion-collapse collapse"
								aria-labelledby="headingSix" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">네,
											30일 이내에 소멸될 포인트는 '내 정보&gt; 포인트'에서 안내하고 있어요.</span>
									</div>
									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">30일
											이내에 소멸될 포인트가 없다면 따로 안내하지 않아요.</span>
									</div>
									<div>
										<span
											style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">추가로
											상세 내역을 통해 30일 이내 소멸될 포인트의 건수와 금액 그리고 사용 기간을 자세히 확인할 수 있어요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingSeven">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseSeven"
									aria-expanded="false" aria-controls="collapseSeven">
									[포인트] 사용하지 않은 포인트는 자동 소멸 되나요?</button>
							</h2>
							<div id="collapseSeven" class="accordion-collapse collapse"
								aria-labelledby="headingSeven"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">네,
											포인트 사용 기간 내에 쓰지 않은 포인트는 자동으로 소멸돼요.</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;"><br></span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">포인트는
											적립일에 따라 사용 기간이 다르기 때문에 사전 확인이 필요해요.</span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">참고로
											소멸 예정인 포인트는 '내 정보&gt; 포인트'에서 확인할 수 있어요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading1">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse1"
									aria-expanded="false" aria-controls="collapse1">[포인트]
									포인트 사용과 관련된 상세 내역을 확인할 수 있나요?</button>
							</h2>
							<div id="collapse1" class="accordion-collapse collapse"
								aria-labelledby="heading1" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span style="font-family: arial; font-size: 10pt;">네,
											상세 내역을 확인할 수 있어요.</span>
									</div>
									<div>
										<span style="font-family: arial; font-size: 10pt;">상세
											내역에서 크게 3가지 정보를 제공해요. 사용된 포인트 전체 금액과 사용 날짜 그리고 사용 기간(최초 적립일
											기준)을 알려드려요.</span>
									</div>
									<div>
										<br>
									</div>
									<div>
										<span style="font-family: arial; font-size: 10pt;">포인트
											'사용' 내역을 확인하고 싶다면, 화면 상단의 '전체' 또는 '사용' 버튼을 누른 뒤 사용한 포인트 금액을
											선택해주세요.</span>
									</div>
									<div>
										<span style="font-family: arial; font-size: 10pt;">포인트
											'사용 취소' 내역을 확인하고 싶다면, '전체' 또는 '적립' 버튼을 누른 뒤 사용 취소한 금액을
											선택해주세요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading2">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse2"
									aria-expanded="false" aria-controls="collapse2">[포인트]
									포인트 사용 취소할 경우, 사용기간이 지난 포인트는 소멸되나요?</button>
							</h2>
							<div id="collapse2" class="accordion-collapse collapse"
								aria-labelledby="heading2" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span style="font-family: arial; font-size: 10pt;">네,
											소멸돼요. 포인트 사용 기간은 포인트를 처음 지급받은 날을 기준으로 적용돼요.</span>
									</div>
									<div>
										<span style="font-family: arial; font-size: 10pt;">예를
											들어, 사용한 포인트를 취소할 때 해당 포인트의 사용 기간이 지났다면 자동으로 소멸돼요.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading3">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse3"
									aria-expanded="false" aria-controls="collapse3">[쿠폰]
									쿠폰함에서 쿠폰이 사라졌어요.</button>
							</h2>
							<div id="collapse3" class="accordion-collapse collapse"
								aria-labelledby="heading3" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">네,
											포인트 사용 기간 내에 쓰지 않은 포인트는 자동으로 소멸돼요.</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;"><br></span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">포인트는
											적립일에 따라 사용 기간이 다르기 때문에 사전 확인이 필요해요.</span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">참고로
											소멸 예정인 포인트는 '내 정보&gt; 포인트'에서 확인할 수 있어요.</span>
									</div>


								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading4">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse4Seven"
									aria-expanded="false" aria-controls="collapse4Seven">[쿠폰]
									무료초대권은 어떻게 사용하나요?</button>
							</h2>
							<div id="collapse4Seven" class="accordion-collapse collapse"
								aria-labelledby="heading4" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span style="font-size: 13.3333px;">앱 하단 내정보 &gt; 쿠폰함에서
											무료초대권을 확인한 후 숙소에 직접 예약 문의하시면 됩니다.</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;"><br></span>
									</div>
									<div>
										<span style="font-size: 13.3333px;">숙소마다 사용조건이 다르며, 현장
											상황에 따라 잔여 객실이 없을 수 있기 때문에 꼭! 사용 희망일 최소 3일 전 숙소에 문의 후 이용해 주시길
											바랍니다.</span>
									</div>

								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading5">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse5"
									aria-expanded="false" aria-controls="collapse5">[쿠폰]
									예약 시 사용가능한 쿠폰이 없어요.</button>
							</h2>
							<div id="collapse5" class="accordion-collapse collapse"
								aria-labelledby="heading5" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">네,
											포인트 사용 기간 내에 쓰지 않은 포인트는 자동으로 소멸돼요.</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;"><br></span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">포인트는
											적립일에 따라 사용 기간이 다르기 때문에 사전 확인이 필요해요.</span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">참고로
											소멸 예정인 포인트는 '내 정보&gt; 포인트'에서 확인할 수 있어요.</span>
									</div>


								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading6">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapse6"
									aria-expanded="false" aria-controls="collapse6">[쿠폰]
									사용한 쿠폰을 쿠폰함에서 삭제하고 싶어요.</button>
							</h2>
							<div id="collapse6" class="accordion-collapse collapse"
								aria-labelledby="heading6" data-bs-parent="#accordionExample">
								<div class="accordion-body">

									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">네,
											포인트 사용 기간 내에 쓰지 않은 포인트는 자동으로 소멸돼요.</span>
									</div>
									<div>
										<span style="font-size: 13.3333px;"><br></span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">포인트는
											적립일에 따라 사용 기간이 다르기 때문에 사전 확인이 필요해요.</span>
									</div>
									<div>
										<span
											style="font-size: 10pt; font-family: arial; color: rgb(0, 0, 0);">참고로
											소멸 예정인 포인트는 '내 정보&gt; 포인트'에서 확인할 수 있어요.</span>
									</div>


								</div>
							</div>
						</div>
					</div>
			<div id="tab-5" class="tab-content ">
				<div class="accordion-item " style="padding-top: 15px;">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
							리뷰는 어떻게 등록할 수 있나요?
						</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							
								<div>
									<div>
										<p class="p1"
											style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: "
											apple="" sd="" gothic="" neo";"="">실제 숙소를 이용한 회원만 리뷰를 작성할 수 있습니다. <br>모텔 :
											체크인 시간~체크아웃 14일 이내<br>모텔 외 : 체크인 시간~체크아웃 30일 이내</p>
									</div>
								</div>
								<div><span
										style="font-size: 13.3333px; color: rgb(37, 37, 37); font-family: arial;"><br></span>
								</div>
								<div><span
										style="font-size: 13.3333px; color: rgb(37, 37, 37); font-family: arial;">[등록방법]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 방문한 숙소 리뷰
											페이지 상단 '리얼리뷰 작성하기'에서 리뷰 작성</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">- 앱 하단 내정보
											&gt; 숙소 예약내역 &gt; 이용전/이용후 예약상세 &gt; 리뷰 작성&nbsp;</span>
								</div>
							

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed " type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							리뷰 등록 포인트는 얼마인가요?
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
						data-bs-parent="#accordionExample">
						<div class="accordion-body" style="background-color: rgb(240, 240, 240);">
							
								<div>
									<span style="font-size: 13.3333px;">숙소 상품 이용 후 리얼리뷰를 남겨 주시면 포인트가
											자동 적립됩니다.</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">포인트는 최초 리얼리뷰 기준으로 적립되며, 수정 시
											추가 지급은 없습니다.</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">&nbsp;</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">[모텔, 게스트하우스]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">기본 리뷰 작성 시
											200포인트&nbsp;&nbsp;</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">100자 이상 리뷰 작성 시
											1,000포인트</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">[호텔, 리조트, 펜션, 캠핑,
											홈&amp;빌라]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">기본 리뷰 작성 시
											500포인트&nbsp;&nbsp;</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">200자 이상 + 사진1장 이상 리뷰 작성 시
											2,000포인트</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;"><br></span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">[모바일티켓]</span>
								</div>
								<div>
									<span style="font-size: 13.3333px;">포인트 적립혜택 제외</span>
								</div>
							

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							등록한 리뷰를 수정/삭제 하고 싶어요.
						</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							
								<p>
									<span style="font-size: 13.3333px;">등록한 리뷰는 앱 하단 내정보 &gt; 나의 리뷰에서
											직접 수정/삭제가 가능합니다. </span>
								</p>
								<p>
									<span style="font-size: 13.3333px;"><br></span>
								</p>
								<p>
									<span style="font-size: 13.3333px;">단, 리뷰 수정은 작성 후 48시간 이전까지만
											가능하며 리뷰 삭제 시 지급된 포인트는 차감되는 점 참고 부탁드립니다.</span>
								</p>
							


						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
							등록한 리뷰가 사라졌어요.
						</button>
					</h2>
					<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							
								<div><span style="font-family: arial; font-size: 10pt;">리얼리뷰는 리뷰 관리 정책에 의거하여 운영되고
										있습니다.</span></div>
								<div><span style="font-family: arial; font-size: 10pt;"><br></span></div>
								<div><span style="font-family: arial; font-size: 13.3333px;">리뷰 관리 정책에 위배될 경우 사전 고지 없이
										삭제 처리가 되며, 적립된 포인트도 차감되는 점 이용에 참고 부탁드립니다.</span></div>
								<div><span style="font-family: arial; font-size: 10pt;"><br></span></div>
								<div><span style="font-size: 10pt; font-family: arial;">[삭제 정책]</span></div>
								<div><span style="font-size: 10pt; font-family: arial;">1) 욕설, 비속어, 음란성</span></div>
								<div><span style="font-size: 10pt; font-family: arial;">2) 스팸, 광고, 도배성</span></div>
								<div><span style="font-size: 10pt; font-family: arial;">3) 방문한 숙소와 전혀 관계없는 내용</span>
								</div>
								<div><span style="font-size: 10pt; font-family: arial;">4) 리모델링, 사업주 변경의 경우</span></div>
								<div><span style="font-size: 10pt; font-family: arial;">5) 타업체를 거론한 게시물</span></div>
								<div><span style="font-size: 10pt; font-family: arial;">6) 예약을 취소한 리뷰</span></div>
						

						</div>
					</div>
				</div>
		  </div>
					<div id="tab-6" class="tab-content ">
					<div class="accordion-item " style="padding-top: 15px;">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
							예약을 취소하고 싶어요.
						</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<div><span style="font-size: 13.3333px;">예약취소는&nbsp; 앱/웹 &gt; 내정보 &gt; 예약/구매내역에서 직접
									가능합니다.</span></div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">예약/결제 진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우
									취소수수료를 차감한 금액으로 환불 처리됩니다.</span></div>
							<div><span style="font-size: 13.3333px;">일부 숙소에 한해 취소가 가능한 시점이나 앱/웹에서 취소가 불가할 수 있으니 이 경우에는
									고객행복센터로 요청해 주시길 바랍니다.</span></div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed " type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							예약확인은 어떻게 하나요?
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
						data-bs-parent="#accordionExample">
						<div class="accordion-body" style="background-color: rgb(240, 240, 240);">
							<div><span style="font-size: 13.3333px;">예약은 앱 하단 내정보 &gt; 예약/구매내역에서 확인 가능하며, 예약정보를
									알림톡(카카오톡) 또는 SMS로 발송해 드립니다.</span></div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">단, 예약대기로 진행되는 상품은 예약대기와 예약확정 여부에 대해 각각 발송해 드리고 있으니
									참고 부탁드립니다.</span></div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">*예약대기 : 예약 시 대기 상태로 접수되며, 숙소의 확인 후 예약확정 여부가
									안내됩니다.&nbsp;</span></div>
							<div><span style="font-size: 13.3333px;">만약 숙소 사정으로 예약이 불가할 경우 결제된 금액은 자동으로 취소됩니다.</span>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							천재지변으로 인한 예약취소는 어떻게 하나요?
						</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-size: 13.3333px;">천재지변(기상악화)으로 숙소 이용이 불가할 경우 고객행복센터로 예약내역 및
									증빙서류(결항확인서, e-티켓 등)를 보내주시면 확인 후 예약취소 여부를 안내해 드립니다.</span></div>
							<div><span style="font-size: 13.3333px;">다만, 상황에 따라 취소가 어려울 수 있는 점 참고 부탁드립니다.</span></div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">[접수방법]</span></div>
							<div><span style="font-size: 13.3333px;">※ 이메일 : help@goodchoice.kr (예약자명, 숙소명, 체크인 날짜
									필수)</span></div>
							<div><span style="font-size: 13.3333px;">※ 카카오톡 : 카카오톡 내 플러스 친구 &gt; 여기어때 고객행복센터 추가</span>
							</div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
							비회원도 예약 가능한가요?
						</button>
					</h2>
					<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-family: arial; font-size: 10pt;">여기어때 회원이 아니더라도 비회원으로 예약 및 결제가
									가능합니다.</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">다만, 비회원으로 예약 시 할인쿠폰/포인트 지급 및 사용이 불가한
									점 참고 부탁드립니다.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">

					<h2 class="accordion-header" id="headingFive">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
							예약대기 건 예약취소하고 싶어요.
						</button>
					</h2>
					<div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-size: 13.3333px;">예약 대기중에는 여기어때 고객행복센터에 예약취소 요청해주시길 바랍니다.</span>
							</div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">단, 예약확정이 될 경우 수수료가 발생하거나 예약취소가 불가할 수 있습니다.</span>
							</div>

						</div>
					</div>
				</div>
				<div class="accordion-item">

					<h2 class="accordion-header" id="headingSix">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
							미성년자도 예약이 가능한가요?
						</button>
					</h2>
					<div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-family: arial; font-size: 10pt;">만 19세 미만의 미성년자는 청소년 보호법에 의거하여 숙박업소
									출입/고용이 불가하며, 숙박시설 이용에 제한이 있을 수 있습니다.&nbsp;</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">&nbsp;</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">미성년자 예약으로 인해 발생하는 입실 거부에 대해서는 취소나
									환불이 불가하오니, 예약 진행 전 반드시 숙소에 확인해 주시기 바랍니다.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingSeven">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
							숙소에서 예약취소 했어요. 어떻게 하나요?
						</button>
					</h2>
					<div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<p><span style="font-size: 13px; white-space: pre-wrap;">여기어때는 숙소 사정으로 예약하신 상품이 취소된 경우 대안
									숙소를 찾아드리는 안심예약제를 운영하고 있습니다.

									단순 환불 처리에 그치지 않고 더 좋은 숙소에서 이용하실 수 있도록 도움드리고 있사오니 아래 적용/제외 기준을 참고하여 고객행복센터로 문의해 주시길
									바랍니다.

									[적용기준]
									- 여기어때 예약 서비스를 이용한 예약 건
									- 숙소의 귀책으로 발생되는 취소 건
									- 모든 숙박 카테고리 동일 적용 (액티비티 제외, 안심예약 가능 업체만 적용)

									[제외기준]
									- 고객의 귀책(변심 등)으로 인한 취소 건
									- 타 사이트, 타 플랫폼을 통한 예약 건
									- 페이백/엘리트 등급의 예약 건
									- 예약대기 상태의 취소 건
									- 부대시설 이용 불가 건</span></p>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading1">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
							체크인날짜/객실타입을 변경하고 싶어요.
						</button>
					</h2>
					<div id="collapse1" class="accordion-collapse collapse" aria-labelledby="heading1"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-size: 13.3333px;">예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다.</span></div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소
									후 재결제 하셔서 이용 부탁드립니다.</span></div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길
									바랍니다.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading2">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
							여러 개의 객실을 동시에 예약할 수 있나요?
						</button>
					</h2>
					<div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-size: 10pt; font-family: arial;">여기어때 예약 서비스 이용 시, 한 번에 예약 가능한 객실 수는
									1개입니다.</span></div>
							<div><br></div>
							<div><span style="font-size: 10pt; font-family: arial;">여러 개 객실이 필요하신 경우, 필요하신 수량의 객실을 각각 결제
									부탁드립니다.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading3">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
							연박예약도 가능한가요?
						</button>
					</h2>
					<div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div>
								<div><span style="font-size: 10pt; font-family: arial;">여기어때 예약 서비스는 최대 90일 전까지 날짜를 선택하여
										미리예약이 가능하며, 최대 7일까지 연박예약을 할 수 있습니다.</span></div>
								<div><br></div>
								<div><span style="font-size: 10pt; font-family: arial;">연박예약 시, 일정 선택 달력은 당일 하루 예약 건으로
										자동 설정되어 있으므로 체크인/체크아웃 날짜를 직접 지정하여 검색해주셔야 연박예약이 가능한 숙소를 확인할 수 있습니다.</span></div>
							</div>


						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading4">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
							취소수수료 계산 기준은 어떻게되나요?
						</button>
					</h2>
					<div id="collapse4Seven" class="accordion-collapse collapse" aria-labelledby="heading4"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-size: 13.3333px;">취소수수료는 할인쿠폰 적용 전 객실 판매금액 기준으로 계산되며, 실 결제금액에서 취소수수료를
									차감한 금액으로 환불 처리됩니다.</span></div>
							<div><span style="font-size: 13.3333px;">만약, 결제 시 포인트를 사용한 경우 포인트 -&gt; 현금 순으로 차감됩니다.</span>
							</div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">환불 예정금액은 조회 시점 및 실제 환불 진행 시점에 따라 달라질 수 있으므로 예약/결제
									진행 당시 안내된 취소/환불 규정을 꼭 숙지하여 이용해 주시길 바랍니다.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading5">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
							전월 휴대폰 결제 취소는 어떻게 하나요?
						</button>
					</h2>
					<div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-size: 13.3333px;">전월 휴대폰 결제 건은 결제 금액이 휴대폰 대금으로 청구 되기 때문에 여기어때
									고객행복센터에서 예약취소 후 예약자 본인 명의의 통장으로 환불 처리를 도와드리고 있습니다.</span></div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">예약내역, 예금주명(예약자 성함과 동일), 계좌번호, 은행명을 고객행복센터에 남겨주시길
									바라며, 접수 후 처리까지는 영업일 기준 최대 5~7일 소요되오니 시간 양해 부탁드립니다.</span></div>


						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading6">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
							금액이 실시간으로 변경되는 이유는 뭔가요?
						</button>
					</h2>
					<div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-size: 13.3333px;">객실 요금은 해당 숙소의 수요, 공급 등 여러 상황에 따라 변동될 수 있습니다.</span>
							</div>
							<div><span style="font-size: 13.3333px;"><br></span></div>
							<div><span style="font-size: 13.3333px;">단, 예약확정 후 선택하셨던 숙소/객실의 금액이 변동되더라도 추가 요금이 발생되거나 차액
									환불이 진행되지 않으니 참고 부탁드립니다.</span></div>


						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading7">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
							예약취소했는데 언제 환불되나요?
						</button>
					</h2>
					<div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-family: arial; font-size: 10pt;">환불은 예약취소 후 PG사 승인 취소 기간에 따라 주말, 공휴일을
									제외한 영업일 기준 최대 3~5일 소요되오니 시간 양해 부탁드립니다.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading8">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse8" aria-expanded="false" aria-controls="collapse8">
							부대시설, 조식 등 부가요금은 어떻게 지불하나요?
						</button>
					</h2>
					<div id="collapse8" class="accordion-collapse collapse" aria-labelledby="heading8"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div><span style="font-size: 13.3333px;">객실 예약 이외의 추가발생(조식, 추가인원, 침구 등) 요금은 현장 결제로
									진행됩니다.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading9">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse9" aria-expanded="false" aria-controls="collapse9">
							[모텔] 당일예약은 몇 시까지 예약이 가능하나요?
						</button>
					</h2>
					<div id="collapse9" class="accordion-collapse collapse" aria-labelledby="heading9"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-family: arial; font-size: 10pt;">입실 당일 오전 3시부터 익일 새벽 3시 이전 판매하고 있는
									객실에 한해 당일예약이 가능합니다.</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">&nbsp;</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">예시)</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">2/27 새벽 1시에 2/26 객실 예약 하는 경우 :
									당일예약</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">2/27 새벽 1시에 2/27 객실 예약 하는 경우 :
									미리예약</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">2/27 새벽 4시에 2/27 객실 예약 하는 경우 :
									당일예약</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">&nbsp;</span></div>
							<div><span style="font-family: arial; font-size: 10pt;">오전 3시에 오늘 날짜로 업데이트 되오니 예약 시 이용을 원하는
									날짜가 맞는지 꼭 확인해 주세요.</span></div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading9">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
							data-bs-target="#collapse9" aria-expanded="false" aria-controls="collapse9">
							[모텔] 페이백 객실은 언제 예약할 수 있나요?
						</button>
					</h2>
					<div id="collapse9" class="accordion-collapse collapse" aria-labelledby="heading9"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">

							<div><span style="font-family: arial; font-size: 10pt;">페이백 객실의 당일예약은 오전 9시~자정까지만 가능하며,
									미리예약은 최대 10일 이내의 건만 가능합니다.</span></div>
							<div><span style="font-family: arial; font-size: 10pt;"><br></span></div>
							<div><span style="font-family: arial; font-size: 10pt;">다만,&nbsp; 페이백 객실 수량이 실시간 예약으로 조기
									소진되는 경우에는 예약이 불가합니다.</span></div>

						</div>
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