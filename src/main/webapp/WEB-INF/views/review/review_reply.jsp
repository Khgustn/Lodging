<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>여행 할때 lodging</title>
	<link href="${pageContext.request.contextPath}/resources/img/titlelog.png" rel="shortcut icon" type="image/x-icon">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
	function send_check(f){
		//유효성 체크 했다고 하고
		
		
		f.submit();
		
	}
</script>
<style>
*{
margin:0 auto;}
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
						<div class="user_name">${user.memname}님 환영합니다.</div>
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
					<li>
						<a href="admin.do" class="nav-link text-black"> 관리자 페이지 </a>
						</li>
						</c:if>
				</div>
			</div>
		</div>
	</header>
	<div class="row">
	<div class="col-7 bg-light">
<table class="table table-borderless bg-white"  align="center" width="610" style="margin-top:30px;">
<form method="post" action="reply.do" enctype="multipart/form-data">
<input type="hidden" name="ownid" value="${ownid }">
<input type="hidden" name="buname" value="${buname }">
<input type="hidden" name="ref" value="${ref }">
<input type="hidden" name="idx" value="${idx }">

	<tr>
		<th>제목</th>
		<td><input class="form-control" name="subject" style="width:300px"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${ownid}</td>
	</tr>
	<tr>
		<th>호텔이름</th>
		<td>${buname}</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td><textarea class="form-control" name="content" rows="10" cols="70"></textarea></td>
	</tr>
	
	
	<tr>
	<td colspan="2" align="right">
	 <input class="btn btn-secondary" type="button" value="등록" onclick="send_check(this.form);">
	 <input class="btn btn-secondary" type="button" value="취소" onclick="location.href='hotel_view.do'">
	 
	</td>
	</tr>
</form>
</table>
</div>
</div>
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