<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
	function send(f) {

		f.action = "reviewinsert.do";
		f.method = "post";
		f.submit();

	}
</script>
<style>
*{
margin:0 auto;}
#rating {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#rating input[type=radio] {
	display: none;
}

#rating label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#rating label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#rating label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#rating input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
</style>
</head>
<body>
	<jsp:include page="check_login.jsp" />
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
									<li><a class="dropdown-item" href="qna.do">자주묻는 질문</a></li>
									<li><a class="dropdown-item" href="#">약관 및 정책</a></li>
								</ul>
							</div>

						</li>
						<li> <c:if test="${ !empty user }">
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
	<div class="row align-items-center">
	<div class="col-7">
			<table class=" table table-borderless" align="center" style="margin-top:30px;">
		<form method="post" class="row" enctype="multipart/form-data">
			<input type="hidden" name="memid" value="${user.memid}"> 
			<input type="hidden" name="buname" value="${buname}">
			<input type="hidden" name="ownid" value="${ownid}">
			
				<tr>
					<th>Title</th>
					<td><input class="form-control form-control-sm"
						id="formFileSm" name="subject" style="width: 300px"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${user.memid}</td>
				</tr>
				<tr>
					<th>호텔이름</th>
					<td>${buname}</td>
				</tr>

				<tr>
					<th>사진첨부</th>
					<td><input class="form-control form-control-sm"
						id="formFileSm" type="file" name="photo"></td>
				</tr>
				<tr>
					<th>별점</th>
					<td>
						<fieldset id="rating">
							<input type="radio" name="rating" value="5" id="rate1">
							<label for="rate1">★</label> 
							<input type="radio" name="rating" value="4" id="rate2"> 
							<label for="rate2">★</label> 
							<input type="radio" name="rating" value="3" id="rate3"> 
							<label for="rate3">★</label> 
							<input type="radio" name="rating" value="2" id="rate4"> 
							<label for="rate4">★</label> 
							<input type="radio" name="rating" value="1" id="rate5"> 
							<label for="rate5">★</label>
						</fieldset>
					</td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea class="form-control"
							id="exampleFormControlTextarea1" name="content" rows="10"
							cols="70"></textarea></td>
				</tr>


				<tr>
					<td colspan="2" align="right"><input
						class="btn btn-secondary btn-sm" type="button" value="등록"
						onclick="send(this.form);"> <input
						class="btn btn-secondary btn-sm" type="button" value="취소"
						onclick="history.back(-1);"></td>
				</tr>
		</form>
			</table>
</div>
	</div>
</body>
</html>