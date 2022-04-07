$(window).ready(function() {
	$('.menuBar>li').on('mouseover', function() {
		var tab = $(this).index();
		$('.sub').hide();
		$('.sub').eq(tab).stop().slideDown();
	});
	$('nav').mouseout(function() {
		$(".sub").stop().slideUp()
	});
});