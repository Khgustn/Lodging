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
<style type="text/css">
th, td {
	font-size: 0.9em;
}

.btn {
	font-size: 0.9em;
	padding-top: 0;
	padding-bottom: 0;
}
</style>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<div class="row" style="margin: 50px auto; padding: 0 100px 0 100px;">

		<div class="col-sm-6" style="margin-top: 25px;">
			<h4 style="text-align: center;">입실 전</h4>
			<table class="table table-hover"
				style="margin-top: 30px; text-align: center;">
				<thead>
					<tr>
						<th>번호</th>
						<th>객실 이름</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>이름</th>
						<th>핸드폰번호</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="checkin" items="${nocheckin}" varStatus="i">
						<tr>
							<td class="over-td">${checkin.booknum }</td>
							<td class="over-td">${checkin.roomname}</td>
							<td>${checkin.bookcheckin}</td>
							<td>${checkin.bookcheckout}</td>
							<td>${checkin.memname}</td>
							<td>${checkin.memtel}</td>
							<td><input type="button" id="checkin"
								class="update btn btn-outline-warning" value="체크인"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

		<div class="col-sm-6" style="margin-top: 25px;">
			<h4 style="text-align: center;">입실완료</h4>
			<table class="table table-hover"
				style="margin-top: 30px; text-align: center;">
				<thead>
					<tr>
						<th>번호</th>
						<th>객실 이름</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>이름</th>
						<th>핸드폰번호</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="checkout" items="${checkinok}" varStatus="i">
						<tr>
							<td class="over-td">${checkout.booknum }</td>
							<td class="over-td">${checkout.roomname}</td>
							<td>${checkout.bookcheckin}</td>
							<td>${checkout.bookcheckout}</td>
							<td>${checkout.memname}</td>
							<td>${checkout.memtel}</td>
							<td>입실완료</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		// 버튼 클릭시 Row 값 가져오기
		$("#checkin").click(function() {
			const str = ""
			const tdArr = new Array(); // 배열 선언
			const checkBtn = $(this);

			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			const tr = checkBtn.parent().parent();
			const td = tr.children();

			//	테이블의 td에서 0번째위치한 td의 값 가져오기
			const no = td.eq(0).text();
			const result = confirm(no + '번의 예약상태를 변경하시겠습니까?');
			if (result) {
				alert('${business.ownid}');
				location.href = "updatetodaycheckin.do?booknum=" + no+ "&ownid=${business.ownid}";
			}
			console.log(no)
		})
	</script>
</body>
</html>