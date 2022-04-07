$(function() {

	// 회원 로그인 선택
	$(".pat_aTag").click(function() {
		event.preventDefault();
		event.stopPropagation();

		$(this).attr("style", "background-color:#FDC00D");
		$(".adm_aTag").attr("style", "background-color:#0080FF");
		$(".div_box_pat").attr("style", "display:block");
		$(".div_box_adm").attr("style", "display:none");
	});
	// 회원 로그인 버튼 클릭
	$(".btnLogin1").click(function() {
		event.preventDefault();
		event.stopPropagation();

		$(".form_login1").attr("action", "login/Process");
		$(".form_login1").submit();
	});
	// 회원 가입 페이지로 이동
	$(".regMember").click(function() {
		event.preventDefault();
		event.stopPropagation();

		location.href = "/login/regMember";
	});

	// 관리자 로그인 선택
	$(".adm_aTag").click(function() {
		event.preventDefault();
		event.stopPropagation();

		$(this).attr("style", "background-color:#FDC00D");
		$(".pat_aTag").attr("style", "background-color:#0080FF");
		$(".div_box_adm").attr("style", "display:block");
		$(".div_box_pat").attr("style", "display:none");
		$(".regAdminMember").attr("style", "visibility:hidden");
	});
	// 관리자,의료진 로그인 버튼 클릭
	$(".btnLogin2").click(function() {
		event.preventDefault();
		event.stopPropagation();

		if ($(".admin_login")[0].checked) {
			$(".form_login2").attr("action", "/login/AdminProcess");
			$(".form_login2").submit();
		} else {
			$(".form_login2").attr("action", "/login/EmpProcess");
			$(".form_login2").submit();
		}
	});

	// 회원 아이디/패스워드 찾기 페이지로 이동
	$(".findPersonalData").click(function() {
		event.preventDefault();
		event.stopPropagation();

		location.href = "/login/findPersonalData";
	});
});