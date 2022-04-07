
$(window).ready(function() {
	$('nav').mouseover(function() {
		$(".submenu").stop().slideDown()
	});
	$('nav').mouseout(function() {
		$(".submenu").stop().slideUp()
	});
	$('.gnb>li').on('mouseover', function() {
		var tab = $(this).index();
		$('.sub').hide();
		$('.sub').eq(tab).stop().show();
	});
});