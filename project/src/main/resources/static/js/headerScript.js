$(document).ready(function() {
    let mouseOverTimeout, mouseLeaveTimeout;

    $('.header').on('mouseover', function() {
        clearTimeout(mouseLeaveTimeout); // 이전에 설정된 mouseLeaveTimeout을 지웁니다.
        mouseOverTimeout = setTimeout(function() {
            $('.headerNav .navInner').stop(true, true).slideDown(500); // 모든 .navInner를 엽니다.
        }, 100); // 300ms 딜레이
    });

    $('.header').on('mouseleave', function() {
        clearTimeout(mouseOverTimeout); // 이전에 설정된 mouseOverTimeout을 지웁니다.
        mouseLeaveTimeout = setTimeout(function() {
            $('.headerNav .navInner').stop(true, true).slideUp(500); // 모든 .navInner를 닫습니다.
        }, 100); // 300ms 딜레이
    });
});
