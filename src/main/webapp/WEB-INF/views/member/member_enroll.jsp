<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/lodsing/resources/js/bootstrap.js"></script>
<script src="/lodsing/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css/bootstrap.css">
<link rel="stylesheet" href="/lodsing/resources/css2/index.css">
<link rel="stylesheet" href="/lodsing/resources/css/custom.css">

<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>
	
<script type="text/javascript">
	//휴대폰 번호 인증

	function auth(f) {
		alert("인증번호 발송이 완료되었습니다.");
		var phone = f.memtel.value.trim();
		var url = "phoneAuth.do";
		var param = "memtel=" + phone;
		sendRequest(url, param, resultFunc1, "post");

	}

	function resultFunc1() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//컨트롤러에서 삭제후 return해준 데이터를 받는다. 
			var data = xhr.responseText;

			if (data == "error") {
				alert("유효한 번호를 입력해주셍");

			} else {
				alert("인증번호를 전송했습니다.");

				const code_btn = document.getElmentById("code_btn");
				code_btn.disabled = false;
				code2 = data;
			}
		}
	}
	function authCheck() {
		const code = document.f.code.value;
		$.ajax({
			type : 'POST',
			url : 'phoneAuthOk.do',
			header : {
				"Content-Type" : "application/json"
			},
			dateType : 'json',
			data : {
				code : code
			},
			success : function(result) {
				if (result == true) {
					alert('인증 번호가 다릅니다.')
					phoneAuth = true
					inputCheck()
				} else {
					alert('인증되었습니다')
					const input_tel = document.getElementById("input_tel")
					input_tel.readOnly = true

					const input_code = document.getElementById("input_code")
					input_code.readOnly = true

					const tel_btn = document.getElementById("tel_btn")
					tel_btn.disabled = true

					const code_btn = document.getElementById("code_btn")
					code_btn.disabled = true

					phoneAuth = false
					inputCheck()
				}
			}
		})
	}

	function idCheck(f) {
		var memid = f.memid.value.trim();
		var check = false;

		var url = "memidcheck.do";
		var param = "memid=" + memid;
		sendRequest(url, param, resultFunc, "post");

	}
	function resultFunc() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//컨트롤러에서 삭제후 return해준 데이터를 받는다. 
			var data = xhr.responseText;

			if (data == 'yes_id') {
				alert("중복되는 아이디 입니다.");
				check = false;
			} else if (data == 'no_id') {
				alert("가입 가능한 아이디입니다.");
				check = true;
			}
		}
	}

	// 게시글 업로드
	function insert(f) {
		var memid = f.memid.value.trim();
		var memname = f.memname.value.trim();
		var mempwd = f.mempwd.value.trim();
		var mempwd2 = f.mempwd2.value.trim();
		var memgender = f.memgender.value.trim();
		var mememail = f.mememail.value.trim();
		var membirth = f.membirth.value.trim();
		var memtel = f.memtel.value.trim();

		if (memid == "") {
			alert("아이디를 입력하세요.");
			f.memid.focus();
			return;
		}
		if (memname == "") {
			alert("이름 입력하세요.");
			f.memname.focus();
			return;
		}
		if (mempwd == "") {
			alert("비밀번호를 입력하세요.");
			f.mempwd.focus();
			return;
		}
		if (mempwd != mempwd2) {
			alert("비밀번호 확인이 되지 않았습니다.");
			f.mempwd2.focus();
			return;
		}

		if (memgender == "") {
			alert("성별을 입력하세요.");
			f.memgender.focus();
			return;
		}
		if (mememail == "") {
			alert("이메일을 입력하세요.");
			f.mememail.focus();
			return;
		}
		if (membirth == "") {
			alert("생년월일을 입력하세요.");
			f.membirth.focus();
			return;
		}

		if (memtel == "") {
			alert("전화번호를 입력하세요.");
			f.membirth.focus();
			return;
		}

		f.action = "member_enroll.do";
		f.method = "post";
		f.submit();
	}

	function passwordCheckFunction() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if (userPassword1 != userPassword2) {
			$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.').css("color",
					"red");
		} else {
			$('#passwordCheckMessage').html('비밀번호가 일치합니다.').css("color",
					"green");
		}
	}
</script>
</head>
<body>


	<div class="container" style="margin-top: 5%;">
		<div class="seongi">
			<a class="seongi" href="main.do"><img
				src="/lodsing/resources/img/business/logo.png"></a>
		</div>
		<form method="post" enctype="multipart/form-data">
			<table class="table table-bordered table-hover"
				style="text-align: left;">
				<thead>
					<tr>
						<th colspan="3"><h4>회원 가입</h4></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="userID"
							name="memid" maxLength="20" placeholder="아이디를 입력해주세요."></td>
						<td style="width: 110px;"><button class="btn btn-primary"
								type="button" onclick="idCheck(this.form);">중복체크</button></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input class="form-control" type="password"
							onkeyup="passwordCheckFunction();" id="userPassword1"
							name="mempwd" maxLength="20" placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 확인</h5></td>
						<td colspan="2"><input class="form-control " type="password"
							onkeyup="passwordCheckFunction();" id="userPassword2"
							name="mempwd2" maxLength="20" placeholder="비밀번호를 확인해주세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userName" name="memname" maxLength="20"
							placeholder="이름을 입력해주세요."></td>
					</tr>

					<tr>
						<td style="width: 110px;"><h5>성별</h5></td>
						<td colspan="2"><select name="memgender"
							class=" form-control " aria-label="Default select example">
								<option selected>성별을 선택해주세요</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
						</select></td>
					</tr>

					<tr>
						<td style="width: 110px;"><h5>휴대전화</h5></td>
						<td colspan="2">
							<!-- <input type="text" name="rand" id="rand"> 인증번호 확인용 -->
							<div class="row mt-5">
								<div class="col-sm-8">
									<input type="tel" name="memtel" id="input_tel"
										class="form-control form-control-lg" id="tel"
										placeholder="전화번호(- 빼고 작성해주세요)" pattern="[0-9]{11}" required>
								</div>
								<div class="col-sm-4">
									<button class="btn btn-primary" type="button" id="tel_btn" class="default_btn rounded"
										style="height: 48px;" onclick="auth(this.form)">인증코드
										전송</button>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-sm-8">
									<input type="text" name="code" id="input_code"
										class="form-control form-control-lg" placeholder="전송받은 코드"
										pattern="[0-9]{6}" required>
								</div>
								<div class="col-sm-4">
									<button  type="button" id="code_btn" class="btn btn-primary"
										style="height: 48px;" onclick="authCheck()" disabled>코드
										확인</button>
								</div>
							</div>

						</td>
					</tr>








					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td colspan="2"><input class="form-control" type="email"
							id="userEmail" name="mememail" maxLength="20"
							placeholder="이메일을 입력해주세요."></td>
					</tr>




					<tr>
						<td style="width: 110px;"><h5>생년 월일</h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userEmail" name="membirth" maxLength="20"
							placeholder="생년월일을 입력해주세요. ( ex : 19960515 )"></td>
					</tr>

					<tr>
						<td style="text-align: left" colspan="3">
							<h5 id="passwordCheckMessage"></h5> <input
							class="btn btn-primary pull-right" type="button" value="회원가입"
							onclick="insert(this.form);">

						</td>
					</tr>
				</tbody>
			</table>
		</form>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>