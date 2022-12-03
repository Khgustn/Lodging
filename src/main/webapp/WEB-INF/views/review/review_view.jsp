<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
<script src="/lodsing/resources/js2/jquery-scrollbar.js"></script>
<script src="/lodsing/resources/js2/main.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>



<script>
	function reply(f) {

		location.href = "reply_form.do?idx=" + f.idx.value + "&ref="
				+ f.ref.value + "&buname=" + f.buname.value+"&ownid="+f.ownid;

	}
	// 삭제
	function review_del(f) {
		if (confirm("삭제하시겠습니까?")) {

			var url = "review_del.do";
			var param = "idx=" + f.idx.value + "&filename=" + f.filename.value;
			sendRequest(url, param, resultFun, "post");
		} else {
			alert("실패하였습니다.");
		}
	}

	function resultFun() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			var data = xhr.responseText;

			if (data == "yes") {
				alert("삭제성공");
				location.href = "list.do?page=${param.page}";
			} else {
				alert("삭제실패");

			}
		}
	}

	// 수정
	function send_modify(f) {

		f.method = "POST";
		f.action = "send_modify.do?idx=" + idx+"&ownid="+ownid;
		f.submit();
	}
</script>

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
					</ul>
					<c:if test="${user.verify =='관리자'}">
						<li><a href="admin.do" class="nav-link text-black"> 관리자
								페이지 </a></li>
					</c:if>
				</div>
			</div>
		</div>
	</header>
	<section>
	<img src="/lodsing/resources/img/main/logo.png" style="width:400px; margin-top:50px;" />
		<table class="table table-borderless rounded-4 col-8" border="1" width="600" style="margin-top:50px; ">
	<form>
		<input type="hidden" name="idx" value="${vo.idx}"> <input
			type="hidden" name="ref" value="${vo.ref}"> <input
			type="hidden" name="filename" value="${vo.filename}"> 
			<input type="hidden" name="buname" value="${vo.buname}">
			<input type="hidden" name="ownid" value="${ownid}">
			

			<tr>
				<th style="margin-top:20px;">제목</th>
				<td>${vo.subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td >${vo.memid}</td>
			</tr>
			<tr>
				<th>호텔이름</th>
				<td>${vo.buname}</td>
			</tr>
			<tr>

				<c:if test="${vo.depth ne 0  }">
					<th></th>
					<td><h5>::사업자댓글::</h5></td>
				</c:if>
				<c:if test="${vo.rating == '0'}">
					<th>별점</th>
					<td style="color:orange;">☆☆☆☆☆</td>
				</c:if>
				<c:if test="${vo.rating == '1'}">
					<th>별점</th>
					<td style="color:orange;">★☆☆☆☆</td>
				</c:if>
				<c:if test="${vo.rating == '2'}">
					<th>별점</th>
					<td style="color:orange;">★★☆☆☆</td>
				</c:if>
				<c:if test="${vo.rating == '3'}">
					<th>별점</th>
					<td style="color:orange;">★★★☆☆</td>
				</c:if>
				<c:if test="${vo.rating == '4'}">
					<th>별점</th>
					<td style="color:orange;">★★★★☆</td>
				</c:if>
				<c:if test="${vo.rating == '5'}">
					<th>별점</th>
					<td style="color:orange;">★★★★★</td>
				</c:if>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${fn:split(vo.regdate, ' ')[0]}</td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${vo.filename ne 'no_file'}">
						<img src="/lodsing/resources/upload/${vo.filename}"
							class="card-img-top" style="width: 30%; margin-top: 10px">
					</c:if> <pre>${vo.content}</pre></td>
			</tr>


			<tr>
				<td colspan="2"><input type="button"
					class="btn btn-secondary btn-sm " value="목록으로"
					onclick="history.back(-1);"> <c:choose>
						<c:when test="${vo.depth lt 1 }">
							<%-- <c:if test="${user.verify  == '관리자' }">
								<input type="button" class="btn btn-secondary btn-sm "
									value="삭제하기" onclick="review_del(this.form);">
							</c:if> --%>
							<c:if test="${user.memid == vo.memid }">
								<input type="button" class="btn btn-secondary btn-sm "
									value="수정하기"
									onclick="location.href='send_modify.do?idx=${vo.idx}&page=${empty param.page ? 1 : param.page}&ownid=${ownid}'">
									<input type="button" class="btn btn-secondary btn-sm "
									value="삭제하기" onclick="review_del(this.form);">
							</c:if>
							<c:if
								test="${user.memid == vo.memid } && ${user.verify  == '관리자' }">
								<input type="button" class="btn btn-secondary btn-sm "
									value="삭제하기" onclick="review_del(this.form);">
							</c:if>
						</c:when>
					</c:choose></td>
			</tr>
		</table>

	</form>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>