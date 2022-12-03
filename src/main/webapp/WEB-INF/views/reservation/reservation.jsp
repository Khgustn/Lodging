<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<link rel="stylesheet" href="/lodsing/resources/css2/swiper.css"
	type="text/css">
<link rel="stylesheet" href="/lodsing/resources/css2/swiper.min.css"
	type="text/css">
<script src="/lodsing/resources/js2/swiper.min.js"></script>
<script src="/lodsing/resources/js2/main.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35d71e137b481a1c8d8befd339cf5e29&libraries=services"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/lodsing/resources/css/style.css">
<link rel="stylesheet" href="/lodsing/resources/css/reservationList.css">
<link rel="stylesheet" href="/lodsing/resources/css/lee.css">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<style>
.btn-primary {
	background-color: #02647d;
	width: 350px;
	font-size: 27px;
}

#map {
	height: 300px;
	width: 50%;
	margin: 0 auto;
	z-index: 10;
}
</style>
<script>
function requestPay() {
  IMP.init('imp00134430');
  IMP.request_pay({
    pg: "html5_inicis",
    pay_method: "card",
    merchant_uid : 'merchant_'+new Date().getTime(),
    name : 'lodging',
    
    amount : 100,
    buyer_email : '${user.mememail}',
    buyer_name : '${user.memname}',
   
    buyer_postcode : '123-456',
  }, function (rsp) { 
      if (rsp.success) {
    	  $.ajax({
	        	type : "POST",
	        	url : "reservepro.do",
	        	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        	header:{"Content-Type":"application/json"},
	    		dateType:'json',
	    		data:{booknum:rsp.imp_uid, bookpayment:rsp.pay_method},
	        }).done(function(data){
	        	alert('결제완료');
	        	location.href='reservationlist.do'+data
	        })
      } else {
     	alert('결제 실패')
      }
  });
}
function chkReserve(){
	const check1 = document.querySelector('#check1')
	const check2 = document.querySelector('#check2')
	const check3 = document.querySelector('#check3')
	const btn = document.querySelector('#btn')
	
	if(check1.checked == true && check2.checked == true && check3.checked == true) {
		btn.disabled = false
	} else {
		btn.disabled = true
	}
}
</script>
<body>



	<div class="default_width mt-5">
		<div class="row" style="margin: 0 auto !important;">
			<div class="col-sm-8 reserve_left">
				<b class="large_text">예약자 정보</b>
				<div class="mt-5">
					<strong class="user_profile">예약자 이름</strong>
				</div>
				<input type="text" class="form-control form-control-lg mt-3"
					value="${member.memname}" readonly>



				<div class="mt-5" onclick="chkReserve()">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="check1"
							name="option1" value="something" required> <label
							class="form-check-label" for="check1">숙소이용규칙 및 취소/환불규정 동의</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="check2"
							name="option2" value="something" required> <label
							class="form-check-label" for="check2">개인정보 수집 및 이용 동의</label>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="check3"
							name="option2" value="something" required> <label
							class="form-check-label" for="check2">개인정보 제 3자 제공 동의</label>
					</div>

				</div>
			</div>

			<div class="col-sm-4 reserve rounded">
				<div class="reserve_body">
					<p class="reserve_info">
						<strong class="reserve_name">숙소이름</strong> <br>
						${booking.buname}
					</p>
					<p class="reserve_info">
						<strong class="reserve_name">객실타입</strong> <br>
						${booking.roomname }
					</p>
					<p class="reserve_info">
						<strong class="reserve_name">체크인</strong> <br>
						${booking.bookcheckin}
					</p>
					<p class="reserve_info">
						<strong class="reserve_name">체크아웃</strong> <br>
						${booking.bookcheckout}
					</p>
				</div>

				<div class="reserve_body">
					<strong class="reserve_name" style="color: black;">총 결제 금액</strong>
					<br> <strong class="reserve_name"
						style="color: #ffc107; font-size: 30px;"><fmt:formatNumber
							value="${booking.bookprice}" pattern="#,###" /></strong><strong
						class="reserve_name" style="color: black; font-size: 30px;">
						원</strong> <br>
				</div>
				<button class="btn" type="button" onclick="requestPay()" id="btn"
					disabled
					style="width: 100%; height: 56px; background: #ffc107; color: white; border: none;">결제하기</button>
			</div>

		</div>
	</div>
	

</body>
</html>