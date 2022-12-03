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

<script>
	/* 삭제버튼 클릭 */
	function del(f) {

		//Ajax를 통해 idx를 서버로 전송
		var url = "admin_member_delete.do";
		var param = "memid=" + f.memid.value;
		sendRequest(url, param, resultFunc, "Post");

	}//del()

	/* 삭제결과를 확인할 콜백메서드 */
	function resultFunc() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			//컨트롤러에서 삭제 후 return해준 데이터를 받는다
			var data = xhr.responseText;

			if (data == 'no') {
				alert("삭제실패");
				return;
			} else {
				alert("삭제성공");
				location.href = "admin_member_list.do";
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
		<a class="aaa" href="main.do"><img
			src="/lodsing/resources/img/main/logo.png"></a>
	</div>

	<div class="business_table">

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link" aria-current="page"
				href="admin.do" style="font-weight: bold;">사업자 관리</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="admin_member_list.do" style="font-weight: bold;">회원 관리</a></li>
			<li class="nav-item"><a class="nav-link" href="admin_review_list.do"
				style="font-weight: bold;">리뷰 관리</a></li>


		</ul>


		<table class="table">

			<thead class="thead-dark">
				<tr>
					<th scope="col">아이디</th>
					<th scope="col">비밀번호</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
					<th scope="col">전화번호</th>
					
					<th scope="col">이메일</th>
					<th scope="col">생년월일</th>
					<th scope="col">권한</th>
					<th scope="col">추방</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${m_list}">
					<form>
						<tr>
							<td>${vo.memid}</td>
							<td>${vo.mempwd}</td>
							<td>${vo.memname}</td>
							<td>${vo.memgender}</td>
							<td>${vo.memtel}</td>
							<td>${vo.mememail}</td>
							<td>${vo.membirth}</td>
							<td>${vo.verify}</td>
							<td><input type="hidden" name="memid" value="${vo.memid}">
								<c:if test="${vo.verify =='회원'}">
									<input type="button" value="추방" onclick="del(this.form);"
										class="btn btn-primary">
								</c:if></td>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>