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
<script src="/lodsing/resources/js/httpRequest.js"></script>
<script src="/lodsing/resources/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="/lodsing/resources/css/bootstrap.css">
<script>
	/*삭제 버튼 클릭 */
	function del(f) {
		var pwd = f.pwd.value; //원본 비밀번호
		var c_pwd = f.c_pwd.value;//비교를 위한 번호

		if (pwd != c_pwd) {
			alert('비밀번호가 다릅니다. ');
			return;
		}

		//Ajax를 통해 idx 를 서버로 전송
		var url = "business_delete.do";
		var param = "id=" + f.id.value;
		sendRequest(url, param, resultFunc, "post");

	} //del()
	/*삭제 결과를 확인할 콜백메서드*/

	function resultFunc() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//컨트롤러에서 삭제후 return해준 데이터를 받는다. 
			var data = xhr.responseText;

			if (data == 'no') {
				alert("삭제실패");
				return;
			} else {
				alert("삭제성공");
				location.href = "business_list.do";
			}
		}
	}
</script>
</head>
<body>
	<div id="main_box">
		<h1>:::방명록 리스트 :::</h1>
		<div align="center">
			<input type="button" value="방등록"
				onclick="location.href='business_enroll_form.do'">
		</div>

		<c:forEach var="vo" items="${m_list }">
			<div class="visit_box">
				<div class="type_content">${vo.ownid}</div>
				<div class="type_name">${vo.ownname}</div>
				<div class="type_regdate">${vo.ownpwd }</div>
				<div class="type_regdate">${vo.owntel }</div>
				<div class="type_regdate">${vo.buname }</div>
				<div class="type_regdate">${vo.buaddr }</div>
				<div class="type_regdate">${vo.bucate }</div>
				<div class="type_regdate">${vo.bucity }</div>
				<div class="type_regdate">${vo.bucounty }</div>
				<div>
					<img src="/lodsing/resources/upload/${vo.filename}" width="200">
				</div>

				<div>
					<form>
						<input type="hidden" name="id" value="${vo.ownid }"> <input
							type="hidden" name="pwd" value="${vo.ownpwd }"> 비밀번호<input
							type="password" name="c_pwd"> <input type="button"
							value="수정" onclick="modify(this.form);"> <input
							type="button" value="삭제" onclick="del(this.form);">
					</form>


				</div>





			</div>






		</c:forEach>


	</div>









</body>
</html>