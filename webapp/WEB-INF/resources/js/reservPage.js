$(window).ready(function() {
	$("input[name='btn']").on("click", function() {
		/* alert($("input[name='res_date']").val());
		event.preventDefault();
		event.stopPropagation(); */
		if ($("input[name='res_date']").val() == "") {
			alert("원하시는 날짜를 선택해 주세요.");
			event.preventDefault();
			event.stopPropagation();
		} else {
			return true;
		}
	});
});
$(window).ready(
		function() {
			$('nav').mouseover(function() {
				$(".submenu").stop().slideDown()
			});

			$(function date() {
				var dt = new Date();
				if (dt.getMonth() <= 9 && dt.getMonth() >= 1) {
					var z = '0' + (dt.getMonth() + 1);
					console.log(z);
					var ymd = dt.getFullYear() + '-' + z + '-' + dt.getDate();
				} else {
					var ymd = dt.getFullYear() + '-' + dt.getMonth() + '-'
							+ dt.getDate();
				}

				$("input[type='date']").attr("min", ymd);

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