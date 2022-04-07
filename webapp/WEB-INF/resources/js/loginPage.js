$(function() {
	// 로그인 버튼 클릭
	$("#div_btnLogin").click(function() {
		event.preventDefault();
		event.stopPropagation();

		$("#form_login").attr("action", "loginProcess");
		$("#form_login").submit();
	});
});
