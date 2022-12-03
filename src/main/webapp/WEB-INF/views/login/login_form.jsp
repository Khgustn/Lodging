<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/lodsing/resources/css/bootstrap.css">
<link rel="stylesheet" href="/lodsing/resources/css/custom.css">
<meta charset="UTF-8">
<title>여행 할때 lodging</title>
<link href="/lodsing/resources/img/main/titlelog.png" rel="shortcut icon"
	type="image/x-icon">
<script src="/lodsing/resources/js/httpRequest.js"></script>
<script>
	function send(f) {
		let url = "login.do";
		let param = "memid=" + f.memid.value + "&mempwd=" + f.mempwd.value;
		sendRequest(url, param, resultFn1, "POST");
	}
	function resultFn1() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//no_id, no_pwd, clear중 하나를 받는다
			let data = xhr.responseText;
			if (data == 'no_memid') {
				alert("아이디가 없습니다.");
			} else if (data == 'no_mempwd') {
				alert("비밀번호 불일치");
			} else {
				location.href = "main.do";
			}
		}
	}
	
	
	function businesssend(f) {
		let url = "business_login.do";
		var ownid= f.ownid.value;
		
		let param = "ownid=" +ownid + "&ownpwd=" + f.ownpwd.value;
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//no_id, no_pwd, clear중 하나를 받는다
			var data = xhr.responseText;
			
			var json = eval(data);
			//json ---> [{'res':'clear'}, {'id':'aaa'}]
			//json[0].res == 'clear'
			//json[1].id
			
			if (json[0].res == 'no_ownid') {
				alert("아이디가 없습니다.");
			} else if (json[0].res == 'no_ownpwd') {
				alert("비밀번호 불일치");
				
			} 
			else if(json[0].res=='no_approval'){
				alert("승인 대기중입니다.");
			}
			else {
				location.href = "business_main.do?ownid="+json[1].id;
			}
		}
	}
</script>
</head>


<body>

	<div class="seongi" style="margin-top:50px;">
		<a class="seongi" href="main.do"><img
			src="/lodsing/resources/img/main/logo.png"></a>
	</div>
	<div class="tabs" style="margin-top:10px;">
		<input id="all" type="radio" name="tab_item" checked> 
		<label class="tab_item" for="all">고객 로그인</label> 
		<input id="programming" type="radio" name="tab_item"> 
		<label class="tab_item" for="programming">사업자 로그인</label>



		<!-- 고객 로그인 폼 -->
		<div class="tab_content" id="all_content">

			<form>
						<div>
						
						<input id="ID_check" class="form-control" name="memid"
							placeholder="아이디를 입력해주세요.">
							
							
						<input id="ID_check2" class="form-control" type="password" name="mempwd"
							placeholder="비밀번호를 입력해주세요.">
							
						<input id="login-button" class="form-control" type="button" value="로그인"
							onclick="send(this.form)" >
					</div>
					
			</form>

			<ul style="margin-top:10px;">
				<li><a href="member_enroll_form.do" class="nav-link text-black" style="color:black;">회원가입</a></li>
				<li><a href="#" class="nav-link text-black" style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 재설정</a></li>
			</ul>
		</div>



		<!-- 사업자 로그인 폼 -->

		<div class="tab_content" id="programming_content">
			<form>

					<input id="ID_check" class="form-control" name="ownid" placeholder="사업자 아이디를 입력해주세요.">
					
						
					<input id="ID_check2" class="form-control" type="password" name="ownpwd" 
					placeholder="비밀번호를 입력해주세요.">

						<input id="login-button" class="form-control" 
							type="button" value="로그인" onclick="businesssend(this.form)">
			</form>
			<ul style="margin-top:10px;">
				<li><a href="business_enroll_form.do" class="nav-link text-black" style="color:black;">회원가입</a>
				</li>

				<li><a href="#" class="nav-link text-black" style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 재설정</a></li>
			</ul>
		</div>
		
	</div>
</body>
</html>