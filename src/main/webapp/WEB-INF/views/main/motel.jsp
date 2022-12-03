<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 할때 lodging</title>
    <link href="/lodsing/resources/img/titlelog.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/lodsing/resources/css2/index.css">
    <link rel="stylesheet" href="/lodsing/resources/css2/main.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/lodsing/resources/js2/jquery-3.6.0.min.js"></script>
    <script src="/lodsing/resources/js2/jquery-scrollbar.js"></script>
    <link rel="stylesheet" href="/lodsing/resources/css2/swiper.css" type="text/css">
    <link rel="stylesheet" href="/lodsing/resources/js/swiper.min.css" type="text/css">
    <script src="/lodsing/resources/js2/swiper.js"></script>
    <script src="/lodsing/resources/js2/swiper.min.js"></script>
    <script src="/lodsing/resources/js2/main.js"></script>
    
    <style>
        .selectm {
            padding-bottom: 10px;
            margin-top: 50px;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .table {
            border: 1px solid #F0F0F0;
        }
    </style>
</head>

<body>
    <header class="jbTitle">
        <div class="px-3 py-2 bg-white text-white  navbar-light bg-light">
            <div class="container container-fluid" class="box1" style="padding: 20px;">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="main.do"
                        class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                        <img class="bi me-2" width="120" height="32" aria-label="Bootstrap"
                            src="/lodsing/resources/img/main/logo.png">

                    </a>
                    <ul id="main_menu" class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                        <li>
                            <a href="#" class="nav-link text-black">
                                내주변
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-black">
                                예약내역
                            </a>
                        </li>
                        <li>
                            <div class="btn-group">
                                <button class="btn  dropdown-toggle text-black" type="button" id="dropdownMenuButton"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    더보기
                                </button>
                                <ul class="dropdown-menu text-black" aria-labelledby="dropdownMenuButton">
                                    <li><a class="dropdown-item" href="#">공지사항</a></li>
                                    <li><a class="dropdown-item" href="qna.do">자주묻는 질문</a></li>
                                    <li><a class="dropdown-item" href="#">약관 및 정책</a></li>
                                </ul>
                            </div>

                        </li>
                        <li>
                            <a href="#" class="nav-link text-black">
                                로그인
                            </a>
                        </li>

                    </ul>


                </div>
            </div>
        </div>
    </header>
    <section class="container bg-white" style="padding: 20px;">
        <div class="justify-content-center">
            <div style="border-bottom: 1px black solid; margin-bottom: 10px;">
                <h4 class="text-gray">지역선택</h4>
            </div>


            <div class="accordion row justify-content-center selectm" id="accordionExample">
                <div class="col-4" >
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading1">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">서울</button>
                        </h2>
                        <div id="collapse1" class="accordion-collapse collapse " aria-labelledby="heading1"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신촌">신촌</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=홍대">홍대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=합정">합정</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=미아">미아</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동대문">동대문</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=을지로">을지로</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=충무로">충무로</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list_list.do?bucounty=성신여대">성신여대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=성북">성북</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=월곡">월곡</a></td>
                                            </tr>
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=구로">구로</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신림">신림</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=강남">강남</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=이태원">이태원</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=용산">용산</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서울역">서울역</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=건대">건대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신도림">신도림</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=금천">금천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=왕십리">왕십리</a></td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false"
                                aria-controls="collapseTwo">인천</button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부평">부평</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=송도">송도</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=연수">연수</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=강화">강화</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=웅진">웅진</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동암">동암</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=간석">간석</a></td>
                                            </tr>

                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=주안">주안</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신포">신포</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동인천">동인천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=연안부두">연안부두</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=계양">계양(작전)</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=남동구">남동구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=호구포">호구포</a></td>
                                            </tr>

                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false"
                                aria-controls="collapseThree">제주</button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=하귀">하귀</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=애월">애월</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=한림">한림/협재</a></td>
                                            </tr>



                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=제주시">제주시</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=제주공항">제주공항</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서귀포시">서귀포시</a></td>
                                            </tr>




                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseFour" aria-expanded="false"
                                aria-controls="collapseFour">충북</button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=청주흥덕">청주 흥덕</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서원">서원</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=충주">충주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=수안보">수안보</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=진천">진천</a></td>
                                            </tr>

                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=청주상당">청주 상당</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=청원">청원(청주 국제공항)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=제천">제천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=단양">단양</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=보은">보은</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=괴산">괴산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=증평">증평</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영동">영동</a></td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFive">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseFive" aria-expanded="false"
                                aria-controls="collapseFive">부산</button>
                        </h2>
                        <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=해운대">해운대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=센텀시티">센텀시티</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=재송">재송</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서면">서면</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=양정">양정</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=초읍">초읍</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부산시민공원">부산시민공원</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=성동래">성동래</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=사직">사직</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=온천장">온천장</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부산대">부산대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=구서">구서</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서동">서동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=송정">송정</a></td>
                                            </tr>
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=광안리">광안리</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=수영">수영</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=남포동">남포동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=중앙동">중앙동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=태종대">태종대</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=송도">송도</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영도">영도</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=경성대">경성대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=대연">대연</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=용호동">용호동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=문현">문현</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부산역">부산역</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=범일동">범일동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부산진역">부산진역</a></td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading6">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse6" aria-expanded="false"
                                aria-controls="collapse6">경남</button>
                        </h2>
                        <div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=상남동">창원 상남동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=용호동">용호동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=중앙동">중앙동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=창원시청">창원시청</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=마산">마산</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=김해">김해</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=장유">장유</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=진주">진주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=사천">사천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=남해">남해</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=거창">거창</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=함안">함안</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=창녕">창녕</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=합천">합천</a></td>
                                            </tr>
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=명서동">명서동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=봉곡동">봉곡동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=팔용동">팔용동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=북면온천">북면온천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=창원종합버스터미널">창원종합버스터미널</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=진해">진해</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=양산">양산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=밀양">밀양</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=거제">거제</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=통영">통영</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=고성">고성</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=하동">하동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신천">신천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=함양">함양</a></td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading7">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse7" aria-expanded="false"
                                aria-controls="collapse7">경북</button>
                        </h2>
                        <div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=포항남구">포항 남구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=경주보문">경주(보문)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=경주감포">경주(감포)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영천">영천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=청도">청도</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=문경">문경</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=상주">상주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영주">영주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=예천">예천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=군위">군위</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=의성">의성</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=봉화">봉화</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=울릉도">울릉도</a></td>
                                            </tr>
                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=포항북구">포항 북구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=구미">구미</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=안동">안동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=김천">김천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=칠곡">칠곡</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=성주">성주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=울진">울진</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영덕">영덕</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=청송">청송</a></td>
                                            </tr>
                                            
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading8">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse8" aria-expanded="false"
                                aria-controls="collapse8">전남</button>
                        </h2>
                        <div id="collapse8" class="accordion-collapse collapse" aria-labelledby="heading8"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=여수">여수</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=광양">광양</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=나주">나주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=함평">함평</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영광">영광</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=장성">장성</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=해남">해남</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=완도">완도</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=진도">진도</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=강진">강진</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=장흥">장흥</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=보성">보성</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=고흥">고흥</a></td>
                                            </tr>
                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=순천">순천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=목포">목포</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=무안">무안</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영암">영암</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신안">신안</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=담양">담양</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=곡성">곡성</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=화순">화순</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=구례">구례</a></td>
                                            </tr>
                                            
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                   
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading9">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse9" aria-expanded="false" aria-controls="collapse9">경기</button>
                        </h2>
                        <div id="collapse9" class="accordion-collapse collapse" aria-labelledby="heading9"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=수원역">수원역</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=광명">광명</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부천">부천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=안양">안양</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=평택">평택</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=김포">김포</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=구리">구리</a></td>
                                            </tr>

                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동탄">동탄</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=양평">양평</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동인천">동인천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=안산">안산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=군포">군포</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=파주">파주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=시흥">시흥</a></td>
                                            </tr>

                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading10">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse10" aria-expanded="false" aria-controls="collapse10">강원</button>
                        </h2>
                        <div id="collapse10" class="accordion-collapse collapse" aria-labelledby="heading10"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=춘천">춘천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=정동진">정동진</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=영월">영월</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=평창">평창</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=양양">양양</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=정선">정선</a></td>
                                            </tr>



                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=원주">원주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=강릉역">강릉역</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=속초">속초</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동해">동해</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=삼척">삼척</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=태백">태백</a></td>
                                            </tr>




                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading11">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse11" aria-expanded="false"
                                aria-controls="collapse11">대전</button>
                        </h2>
                        <div id="collapse11" class="accordion-collapse collapse" aria-labelledby="heading11"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=유성구">유성구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동구">동구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=대덕구">대덕구</a></td>
                                            </tr>
                                            

                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=중고은행">중고(은행/대흥/선화/유천)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서구">서구</a></td>
                                            </tr>
                                            

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading12">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse12" aria-expanded="false" aria-controls="collapse12">충남/세종</button>
                        </h2>
                        <div id="collapse12" class="accordion-collapse collapse" aria-labelledby="heading12"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=천안">천안</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=아산">아산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=계룡">계룡</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=논산">논산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=금산">금산</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=태안">태안</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=안면도">안면도</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서산">서산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=보령">보령</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=대천해수욕장">대천해수욕장</a></td>
                                            </tr>
                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=공주">공주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동학사">동학사</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=세종">세종</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=예산">예산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=홍성">홍성</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=당진">당진</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서천">서천</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부여">부여</a></td>
                                            </tr>
                                            
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading13">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse13" aria-expanded="false" aria-controls="collapse13">울산</button>
                        </h2>
                        <div id="collapse13" class="accordion-collapse collapse" aria-labelledby="heading13"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=남구">남구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=중구(삼산)">중구(삼산)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=중구(성남)">중구(성남)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=중구(무거)">중구(무거)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=중구(신정)">중구(신정)</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동구">동구</a></td>
                                            </tr>
                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=북구">북구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=울주군(일산)">울주군(일산)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=울주군(진장)">울주군(진장)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=울주군(진하)">울주군(진하)</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=울주군(KTX역)">울주군(KTX역)</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=울주군(영남알프스)">울주군(영남알프스)</a></td>
                                            </tr>
                                            
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading14">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse14" aria-expanded="false" aria-controls="collapse14">대구</button>
                        </h2>
                        <div id="collapse14" class="accordion-collapse collapse" aria-labelledby="heading14"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동성로">동성로</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=서문시장">서문시장</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=대구시청">대구시청</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=삼덕동">삼덕동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=교동">교동</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=동대구역">동대구역</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=죽전동">죽전동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신암동">신암동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=신천동">신천동</a></td>
                                            </tr>
                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=대구역">대구역</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=칠성시장">칠성시장</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=경북대">경북대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=엑스코">엑스코</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=태전동">태전동</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=금호지구">금호지구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=계명대">계명대</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=논공">논공</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=가창">가창</a></td>
                                            </tr>
                                            
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading15">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse15" aria-expanded="false" aria-controls="collapse15">광주</button>
                        </h2>
                        <div id="collapse15" class="accordion-collapse collapse" aria-labelledby="heading15"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=상무지구">상무지구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=유스퀘어">유스퀘어</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=첨단지구">첨단지구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=양산동">양산동</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=광주역">광주역</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=전대사거리">전대사거리</a></td>
                                            </tr>
                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=충장로">충장로</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=대인시장">대인시장</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=국립아시아문화전당">국립아시아문화전당</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=하남">하남</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=광주여대">광주여대</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=송정역">송정역</a></td>
                                            </tr>
                                            
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading16">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse16" aria-expanded="false" aria-controls="collapse16">전주/전북</button>
                        </h2>
                        <div id="collapse16" class="accordion-collapse collapse" aria-labelledby="heading16"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="container">
                                    <div class="row">
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=전주덕진구">전주 덕진구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=군산">군산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=남원">남원</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=임실">임실</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=순창">순창</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=무주">무주</a></td>
                                            </tr>
                                            
                                        </table>
                                        <table class="table table-hover col table-light">
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=전주완산구">전주 완산구</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=전주완주">전주 완주</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=익산">익산</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=정읍">정읍</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="motel_list.do?bucounty=부안">부안</a></td>
                                            </tr>

                                            <tr>
                                                <td><a href="motel_list.do?bucounty=김제">김제</a></td>
                                            </tr>
                                            
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
</body>

</html>