$(window).ready(function() {
	$('#ssn').hide();
	$(function() {
		$('.before').on("click", function() {
			if ($("input[type='password']").val() == '')
				alert('인증이 완료 되어야 수정이 가능합니다.');
		});

		$('.pverify').on("click", function() {
			event.preventDefault();
			event.stopPropagation();
			if ($("input[type='password']").val() == '') {
				alert('인증이 완료 되어야 수정이 가능합니다.');

			} else if ($('#nowpwd').val() == '${rv.pat_pw}') {
				alert('인증이 완료되었습니다.');
				$('.before').attr("readonly", false);
				$('#ssn').show();
			} else {
				alert('비밀번호가 틀렸습니다. 다시 입력해 주세요.');
			}
		});/* .pverify */
		$('.reverify').on("click", function() {
			event.preventDefault();
			event.stopPropagation();
			if ($('#updatepwd').val() == '${rv.pat_pw}') {
				alert('최근 사용한 비밀번호와 동일합니다. 다른 비밀번호를 입력해 주세요.');
			} else if ($('#updatepwd').val() == $('#vupdatepwd').val()) {
				alert('비밀번호가 변경되었습니다.');
			} else {
				alert('입력한 비밀번호와 일치하지 않습니다. 정확히 입력해 주세요.');
			}
		}) /* reverify */
		$('input[type="submit"]').on("click", function() {
			alert("회원정보 수정이 성공적으로 완료되었습니다. ");
		}); /* submit */
	});
});