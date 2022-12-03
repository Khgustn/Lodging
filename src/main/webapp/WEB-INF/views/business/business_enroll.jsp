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

<script src="/lodsing/resources/js/bootstrap.js"></script>
<script src="/lodsing/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/lodsing/resources/css/bootstrap.css">
<link rel="stylesheet" href="/lodsing/resources/css/custom.css">


<script type="text/javascript"
	src="/lodsing/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function idCheck(f) {
		var ownid = f.ownid.value.trim();
		var check = false;

		var url = "buidcheck.do";
		var param = "ownid=" + ownid;
		sendRequest(url, param, resultFunc, "post");

	}
	function resultFunc() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//컨트롤러에서 삭제후 return해준 데이터를 받는다. 
			var data = xhr.responseText;

			if (data == 'yes_id') {
				alert("중복 아이디 입니다.");
				check = false;
			} else if (data == 'no_id') {
				alert("아이디가 없습니다. 회원 가입 할 수 있습니다.");
				check = true;
			}
		}
	}

	// 게시글 업로드
	function insert(f) {
		var ownid = f.ownid.value.trim();
		var ownname = f.ownname.value.trim();
		var ownpwd = f.ownpwd.value.trim();
		var ownpwd2 = f.ownpwd2.value.trim();
		var owntel = f.owntel.value.trim();
		var buname = f.buname.value.trim();
		var buaddr = f.buaddr.value.trim();
		var bucate = f.bucate.value.trim();
		var photo = f.photo.value.trim();

		if (ownid == "") {
			alert("아이디를 입력하세요.");
			f.ownid.focus();
			return;
		}
		if (ownname == "") {
			alert("이름 입력하세요.");
			f.ownname.focus();
			return;
		}
		if (ownpwd == "") {
			alert("비밀번호를 입력하세요.");
			f.ownpwd.focus();
			return;
		}
		if (ownpwd != ownpwd2) {
			alert("비밀번호 확인이 되지 않았습니다.");
			f.ownpwd2.focus();
			return;
		}

		if (owntel == "") {
			alert("전화번호를 입력하세요.");
			f.owntel.focus();
			return;
		}
		if (buname == "") {
			alert("업체 이름을 입력하세요.");
			f.buname.focus();
			return;
		}
		if (buaddr == "") {
			alert("주소를 입력하세요.");
			f.buaddr.focus();
			return;
		}
		if (bucate == "") {
			alert("카테고리를 입력하세요.");
			f.bucate.focus();
			return;
		}

		if (check == false) {
			alert("중복 확인을 해주세요.");
			f.ownid.focus();
			return;
		}

		f.action = "business_enroll.do";
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

	var cnt = new Array();
	cnt[0] = new Array('전체');
	cnt[1] = new Array('전체', '신촌', '영등포', '수유', '미아', '동대문', '을지로', '충무로',
			'성신여대', '성북', '월곡', '구로', '신림', '강남', '이태원', '용산', '서울역', '건대',
			'신도림', '금천', '왕십리');
	cnt[2] = new Array('전체', '해운대', '센텀시티', '재송', '서면', '양정', '초읍', '부산시민공원',
			'성동래', '사직', '온천장', '부산대', '구서', '서동', '송정', '광안리', '수영', '남포동',
			'중앙동', '태종대', '영도', '경성대', '대연', '용호동', '문현', '부산역', '범일동', '부산진역');
	cnt[3] = new Array('전체', '동성로', '서문시장', '대구시청', '삼덕동', '교동', '동대구역', '죽전동',
			'신암동', '신천동', '대구역', '칠성시장', '경북대', '엑스코', '태전동', '금호지구', '계명대',
			'논공', '가창');
	cnt[4] = new Array('전체', '수원역', '광명', '부천', '안양', '평택', '김포', '구리', '동탄',
			'양평', '동인천', '안산', '군포', '파주', '시흥');
	cnt[5] = new Array('전체', '상무지구', '유스퀘어', '첨단지구', '양산동', '광주역', '전대사거리',
			'충장로', '대인시장', '국립아시아문화전당', '하남', '광주여대', '송정역');
	cnt[6] = new Array('전체', '유성구', '동구', '대덕구', '중고은행', '서구');
	cnt[7] = new Array('전체', '남구', '중구(삼산)', '중구(성남)', '중구(무거)', '중구(신정)',
			'동구', '북구', '울주군(일산)', '울주군(진장)', '울주군(진하)', '울주군(KTX역)',
			'울주군(영남알프스)');
	cnt[8] = new Array('전체', '고양', '과천', '광명', '구리', '군포', '남양주', '동두천', '부천',
			'성남', '수원', '시흥', '안산', '안양', '오산', '의왕', '의정부', '평택', '하남', '가평',
			'광주', '김포', '안성', '양주', '양평', '여주', '연천', '용인', '이천', '파주', '포천',
			'화성');
	cnt[9] = new Array('전체', '춘천', '정동진', '영월', '평창', '양양', '정선', '원주', '강릉역',
			'속초', '동해', '삼척', '태백');
	cnt[10] = new Array('전체', '청주흥덕', '서원', '충주', '수안보', '진천', '청주상당', '청원',
			'제천', '단양', '보은', '괴산', '증평', '영동');
	cnt[11] = new Array('전체', '천안', '아산', '계룡', '논산', '금산', '태안', '안면도', '서산',
			'보령', '대천해수욕장', '공주', '동학사', '세종', '예산', '홍성', '당진', '서천', '부여');
	cnt[12] = new Array('전체', '전주덕진구', '군산', '남원', '임실', '순창', '무주', '전주완산구',
			'전주완주', '익산', '정읍', '부안', '김제');
	cnt[13] = new Array('전체', '여수', '광양', '나주', '함평', '영광', '장성', '해남', '완도',
			'진도', '강진', '장흥', '보성', '고흥', '순천', '목포', '무안', '영암', '신안', '담양',
			'곡성', '화순', '구례');
	cnt[14] = new Array('전체', '포항남구', '경주보문', '경주감포', '영천', '청도', '문경', '영주',
			'예천', '군위', '의성', '봉화', '울릉도', '포항북구', '구미', '안동', '김천', '칠곡',
			'성주', '울진', '영덕', '청송');
	cnt[15] = new Array('전체', '상남동', '용호동', '중앙동', '창원시청', '마산', '김해', '장유',
			'진주', '사천', '남해', '거창', '함안', '창녕', '합천', '명서동', '봉곡동', '팔용동',
			'북면온천', '창원종합버스터미널', '진해', '양산', '밀양', '거제', '통영', '고성', '하동',
			'신천', '함양');
	cnt[16] = new Array('전체', '하귀', '애월', '한림', '제주시', '제주공항', '서귀포시');

	function change(add) {
		sel = document.form.bucounty
		/* 옵션메뉴삭제 */
		for (i = sel.length - 1; i >= 0; i--) {
			sel.options[i] = null
		}
		/* 옵션박스추가 */
		for (i = 0; i < cnt[add].length; i++) {
			sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
		}
	}
</script>
</head>
<body>
	

	<div class="container">
		<div class="seongi">
			<a class="seongi" href="main.do"><img
				src="/lodsing/resources/img/business/logo.png"></a>
		</div>
		<form name="form" method="post" enctype="multipart/form-data">
			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>사업자 등록 양식</h4></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="userID"
							name="ownid" maxLength="20" placeholder="아이디를 입력해주세요."></td>
						<td style="width: 110px;"><button class="btn btn-primary"
								type="button" onclick="idCheck(this.form);">중복체크</button></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input class="form-control" type="password"
							onkeyup="passwordCheckFunction();" id="userPassword1"
							name="ownpwd" maxLength="20" placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 확인</h5></td>
						<td colspan="2"><input class="form-control " type="password"
							onkeyup="passwordCheckFunction();" id="userPassword2"
							name="ownpwd2" maxLength="20" placeholder="비밀번호를 확인해주세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userName" name="ownname" maxLength="20"
							placeholder="이름을 입력해주세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>전화 번호</h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userAge" name="owntel" maxLength="20"
							placeholder="나이를 입력해주세요."></td>
					</tr>

					<tr>
						<td style="width: 110px;"><h5>숙박 업체 이름</h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userEmail" name="buname" maxLength="20"
							placeholder="숙박 업체 이름을 입력해주세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>지역 선택</h5></td>
						<td colspan="2"><select name="bucity" class=" form-control "
							aria-label="Default select example"
							onchange="change(this.selectedIndex);" class=input>
								<option value='전체'>지역 선택</option>
								<option value='서울'>서울</option>
								<option value='부산'>부산</option>
								<option value='대구'>대구</option>
								<option value='인천'>인천</option>
								<option value='광주'>광주</option>
								<option value='대전'>대전</option>
								<option value='울산'>울산</option>
								<option value='경기'>경기도</option>
								<option value='강원'>강원도</option>
								<option value='충북'>충북</option>
								<option value='충남'>충남</option>
								<option value='전북'>전북</option>
								<option value='전남'>전남</option>
								<option value='경북'>경북</option>
								<option value='경남'>경남</option>
								<option value='제주'>제주도</option>

						</select><br> <select class=" form-control "
							aria-label="Default select example" name="bucounty" class=select>
								<option value=''>지역선택</option>
						</select></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>숙박 업체 주소</h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userEmail" name="buaddr" maxLength="20"
							placeholder="숙박 업체 주소 입력해주세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>숙박 업체 카테고리</h5></td>
						<td colspan="2"><select name="bucate" class=" form-control "
							aria-label="Default select example">
								<option selected>숙박업소 종류를 선택해주세요</option>
								<option value="모텔">모텔</option>
								<option value="호텔">호텔</option>
								<option value="펜션">펜션</option>
						</select></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>사진 첨부</h5></td>
						<td colspan="2"><input class="form-control" id="userEmail"
							type="file" name="photo" maxLength="20"></td>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>