$(function () {
    $("#progress-bar").onscroll({ backgroundColor: "rgb(3,101,125)", height: "2px", position: "fixed" });
});




$("document").ready(function () {
    // swiper option
    const swiper = new Swiper('.swiper-container', {
        //기본 셋팅
        //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
        direction: 'horizontal',
        //한번에 보여지는 페이지 숫자
        slidesPerView: 1,
        //페이지와 페이지 사이의 간격
        spaceBetween: 30,
        //드레그 기능 true 사용가능 false 사용불가
        debugger: false,
        //마우스 휠기능 true 사용가능 false 사용불가
        mousewheel: false,
        //반복 기능 true 사용가능 false 사용불가
        loop: true,
        //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
        centeredSlides: false,
        // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
        effect: 'fade',
        fadeEffect: {
            rossFade: true,
        },

        //자동 스크를링
        autoplay: {
            //시간 1000 이 1초
            delay: 5000,
            disableOnInteraction: true,
        },

        //페이징
        pagination: {
            //페이지 기능
            el: '.swiper-pagination',
            //클릭 가능여부
            clickable: true,
        },



    });
});



$(document).ready(function () {
    var jbOffset = $('.jbTitle').offset();
    $(window).scroll(function () {
        if ($(document).scrollTop() > jbOffset.top) {
            $('.jbTitle').addClass('jbFixed', 'adda');
        }
        else {
            $('.jbTitle').removeClass('jbFixed', 'adda');
        }
    });
});

$(document).ready(
    function () {
        $('.Evn-hover').hover(
            function () {
                $('.add').css('display', 'block');
            },
            function () {
                $('.add').css('display', 'none');
            });
    });
