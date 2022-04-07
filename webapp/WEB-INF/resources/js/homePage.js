start();
var imgs = 2;
var now = 0;
function start() {
	$(".mainbn>img").eq(0).siblings().css({
		"margin-left" : "-2000px;"
	})
	setInterval(function() {
		slide();
	}, 2000);
}
function slide() {
	now = now == imgs ? 0 : now += 1;
	$(".mainbn>img").eq(now - 1).css({
		"margin-left" : "-2000px"
	});
	$(".mainbn>img").eq(now).css({
		"margin-left" : "0px"
	});
}
$(function() {
	// $("nav li").mouseover(".subnav li".slideDown());

	// 로그인 페이지로 이동
	$(".login").click(function() {
		location.href = "/login";
	});

});