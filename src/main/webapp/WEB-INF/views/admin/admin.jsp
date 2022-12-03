<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">
<script src="/lodsing/resources/js/bootstrap.js"></script>
<script src="/lodsing/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css/bootstrap.css">
<link rel="stylesheet" href="/lodsing/resources/css/custom.css">

<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>



<style>
th, td {
	text-align: center;
}
</style>



<script type="text/javascript">
	function send(f) {

		var url = "admin_business_modify.do";
		var param = "ownid=" + f.ownid.value;
		sendRequest(url, param, resultFunc, "post");

	}

	function resultFunc() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//컨트롤러에서 삭제후 return해준 데이터를 받는다. 
			var data = xhr.responseText;

			if (data == 'no') {
				alert("수정되지 않았습니다.");

			} else if (data == 'yes') {
				alert("수정 완료");
				location.href = "admin.do";
			}
		}
	}

	function send1(f) {

		var url = "admin_business_cancel.do";
		var param = "ownid=" + f.ownid.value;
		sendRequest(url, param, resultFunc1, "post");
	}

	function resultFunc1() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//컨트롤러에서 삭제후 return해준 데이터를 받는다. 
			var data = xhr.responseText;

			if (data == 'no') {
				alert("수정되지 않았습니다.");

			} else if (data == 'yes') {
				alert("수정 완료");
				location.href = "admin.do";
			}
		}
	}
</script>

<style>
th, td {
	text-align: center;
}
</style>
</head>
<body>

	<div class="seongi" style="margin-top: 50px;">
		<a class="seongi" href="main.do"><img
			src="/lodsing/resources/img/main/logo.png"></a>
	</div>

	<div class="business_table">

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="admin.do" style="font-weight: bold;">사업자
					관리</a></li>
			<li class="nav-item"><a class="nav-link" href="admin_member_list.do"
				style="font-weight: bold;">회원 관리</a></li>
			<li class="nav-item"><a class="nav-link" href="admin_review_list.do"
				style="font-weight: bold;">리뷰 관리</a></li>

		</ul>



		<table class="table">




			<thead class="thead-dark">
				<tr>
					<th scope="col">사업자</th>
					<th scope="col">아이디</th>
					<th scope="col">업체 이름</th>
					<th scope="col">업체 연락처</th>
					<th scope="col">주소</th>
					<th scope="col">카테고리</th>
					<th scope="col">상태</th>
					<th scope="col">승인</th>
					<th scope="col">가입 취소</th>
				</tr>
			</thead>

			<tbody>



				<c:forEach var="vo" items="${m_list}">
					<form>
						<tr>
							<td>${vo.ownname}</td>
							<td>${vo.ownid}</td>
							<td>${vo.buname}</td>
							<td>${vo.owntel}</td>
							<td>${vo.buaddr}</td>
							<td>${vo.bucate}</td>
							<td>${vo.approval}</td>

							<td colspan="1">

								<div class="form-check">
									<input type="hidden" name="ownid" value="${vo.ownid}">
									<input type="button" onclick="send(this.form);"
										class="btn btn-primary" value="승인">

								</div>
							</td>



							<td colspan="1">
								<div class="form-check">
									<input type="button" onclick="send1(this.form);" value="승인 취소"
										class="btn btn-primary">
								</div>
							</td>
						</tr>

					</form>
				</c:forEach>


			</tbody>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>