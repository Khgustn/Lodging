<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

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
<link rel="stylesheet" href="/lodsing/resources/css2/index.css"></script>

 <script type="text/javascript"
   src="/lodsing/resources/js/httpRequest.js"></script> 
<script>

// 신고된 리뷰 report 컬럼 유지로 변경

function send(f) {

   var url = "admin_review_modify.do";
   var param = "idx=" + f.idx.value;
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
         location.href = "admin_review_list.do";
      }
   }
}




   /* 삭제버튼 클릭 */
   function del(f) {

      //Ajax를 통해 idx를 서버로 전송
      var url = "admin_review_delete.do";
      var param = "idx=" + f.idx
      .value;
      sendRequest(url, param, resultFunc1, "Post");

   }//del()

   /* 삭제결과를 확인할 콜백메서드 */
   function resultFunc1() {

      if (xhr.readyState == 4 && xhr.status == 200) {

         //컨트롤러에서 삭제 후 return해준 데이터를 받는다
         var data = xhr.responseText;

         if (data == 'no') {
            alert("삭제실패");
            return;
         } else {
            alert("삭제성공");
            location.href = "admin_review_list.do";
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
            
         <li class="nav-item"><a class="nav-link "
            href="admin_member_list.do" style="font-weight: bold;">회원 관리</a></li>
            
         <li class="nav-item"><a class="nav-link active" 
         href="admin_review_list.do" style="font-weight: bold;">리뷰 관리</a></li>


      </ul>

   </div>

      <div>
      <c:forEach var="vo" items="${m_list}">
      <form>
      <c:if test="${vo.report =='신고'}">
                                    
         <div id="review-box" style="padding: 20px 20px 20px 20px;     margin:0 auto; margin-top:20px;
            width:50%; border : 1.5px solid rgba(0, 0, 0, 0.1); border-radius: 5px;">
            <div style="color:black; font-size: 14px">
               <div class="row">
                  <div class="col-sm-6 review_star">
                     <c:choose>
                        <c:when test="${vo.rating == '1' }">⭐</c:when>
                        <c:when test="${vo.rating == '2' }">⭐ ⭐</c:when>
                        <c:when test="${vo.rating == '3' }">⭐ ⭐ ⭐</c:when>
                        <c:when test="${vo.rating == '4' }">⭐ ⭐ ⭐ ⭐</c:when>
                        <c:when test="${vo.rating == '5' }">⭐ ⭐ ⭐ ⭐ ⭐</c:when>
                     </c:choose>   
                  </div>
                  
                  <div class="col-sm-6 review_email" style="text-align: right;">
                     ${fn:substring(vo.regdate,0,4)} -
                     ${fn:substring(vo.regdate,5,7)} -
                     ${fn:substring(vo.regdate,8,10)}
                  </div>
               </div>
   
               <div class="review_email">
               <br>
                  <span>No : ${vo.idx}</span> <br> 
                  <span>작성자 : ${vo.memid}</span> <br> 
                  <span>업체명 : ${vo.subject}</span>
                  
               </div>
            </div>
            
            <hr style="color: rgba(0, 0, 0, 0.5);">
            
            <div class="review_content mt-1">
               <span>${vo.content}</span>
            </div>
            <br>
            <br>
            
            <div class="review_content mt-1">
               <span>${vo.filename}</span>
            </div>
            
            <hr style="color: rgba(0, 0, 0, 0.5);">
            <input type="hidden" name="idx" value="${vo.idx}">
            <input type="button" value="삭제" onclick="del(this.form);" class="btn btn-primary">
            <input type="button" value="유지" onclick="send(this.form);" class="btn btn-primary">
         </div>
         </c:if>
         <!-- 리뷰 끝 -->
         </form>
      </c:forEach>
   </div>
   <footer>
		<!-- Footer -->
		<div class="box2">
			<ul class="link">
				<li><a href="http://www.withinnovation.co.kr/" target="_blank">회사소개</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms"
					data-default="term">이용약관</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms/privacy"
					data-default="privacy">개인정보처리방침</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/terms/consumer"
					data-default="consumer">소비자 분쟁해결 기준</a><span>|</span></li>
				<li><button type="button" onclick="pop_licence();return false;">사업자
						정보확인</button> <span>|</span></li>
				<li><a href="//ad.goodchoice.kr/" target="_blank">여기어때
						마케팅센터</a><span>|</span></li>
				<li><a href="//host.goodchoice.kr/" target="_blank">액티비티
						호스트센터</a><span>|</span></li>
				<li><a href="//hotel.goodchoice.kr/" target="_blank">HOTEL
						여기어때</a><span>|</span></li>
				<li><a href="https://www.goodchoice.kr/more/contentsInfo">콘텐츠산업진흥법에의한
						표시</a></li>
			</ul>
			<p>
				<b>고객행복센터 1588-5890</b><span>오전 9시 - 오후 6시</span>
			</p>
			<address>
				<span>코리아IT아카데미</span> 주소 : 서울특별시 마포구 서강로 136 아이비타워 2,3층 | 대표이사 :
				정해승 | <br> 통신판매업번호 : 2015 - 서울강남 - 03148호 | 전화번호 : 1588-5890|
				E-mail : koreais@koreaedugroup.com<br> <span>(주)
					여기어때컴퍼니는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각
					판매자에게 있습니다.</span><br> copyright ⓒ 2015 KOREA INFORMATION TECHNOLOGY
				ACADEMY. ALL RIGHTS RESERVED
			</address>

			<div>
				<a href="//www.facebook.com/goodchoiceofficial" target="_black"
					class="icon-icn_login_facebook"><span>여기어때 페이스북</span></a> <a
					href="//blog.gccompany.co.kr" target="_black" class="icon-ic_blog"><span>여기어때
						블로그</span></a> <a href="//post.naver.com/my.nhn?memberNo=25599212"
					target="_black" class="icon-ic_naverpost"><span>네이버포스트</span></a>
			</div>

		</div>

	</footer>

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>