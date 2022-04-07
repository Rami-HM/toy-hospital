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
	
	$(function(){
		$("input[type='submit']").on('click', function(){
 			event.preventDefault();
 			event.stopPropagation();
			$.ajax({
				url		:	'/Reserv/Check',
				data	: 	{	res_date : $('#res_date').val(), 
								res_time : $('#res_time').val(), 
								emp_name : $('#emp_name').val(), 
								pat_id 	 : $('#pat_id').val()
							 },
				datatype: 	'json',
				success	:	function(data){
					if(data == true){
					alert('예약이 성공적으로 완료되었습니다! \r\n 예약에 대한 확인은 마이페이지에서 가능합니다.');
					$('#form').submit();
					}else{
						alert("이미 같은 날짜, 같은 시간에 이루어진 예약이 있습니다. \r\n다른 시간을 선택해 주세요.");
						}
				},
				error	:	function(xhr){
					alert("이미 같은 날짜, 같은 시간에 이루어진 예약이 있습니다. \r\n다른 시간을 선택해 주세요.");
					location.href = "/Res/Update";
				}
			});/* ajax */
			
		})
	})
});