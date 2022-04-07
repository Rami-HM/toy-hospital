window.onload = function() {
	// 아이디 중복확인 버튼 클릭
	document.getElementById("idcheck").onclick = function() {
		// 입력된 아이디가 없는 경우
		if (document.getElementById("id").value.length == 0) {
			msg = '아이디를 입력하여 주세요.';
			document.getElementById('msgId').innerHTML = msg;
		} else {
			var url = "/login/regMember/idCheck?id=" + $("#id").val();
			window
					.open(url, "checkIdPage",
							"width=400, height=250, resizable=no, scrollbars=no, top=200, left=500");
		}
	}

	// 주소찾기 버튼 클릭
	document.getElementById("btnfindaddress").onclick = function() {
		msg = '';
		document.getElementById('msgAdd1').innerHTML = msg; // 주소 찾기 버튼 클릭시 기존 메시지 초기화

		window.name = "regMemberForm";

		var url = "/login/regMember/findAddressForm";
		window
				.open(url, "FindAddressFormPage",
						"width=800, height=500, resizable=no, scrollbars=no, top=150, left=500");
	}

	// 취소버튼 클릭
	document.getElementById('btnCancel').onclick = function() {
		location.href = '/login';
	}

	// 아이디 입력 시 기존 메세지 초기화
	document.getElementById("id").onkeypress = function() {
		document.getElementById('idbtncheck').value = ''; // 아이디 변경시 중복확인 값 초기화
		msg = '';
		document.getElementById('msgId').innerHTML = msg;
	}

	// 이메일 처리
	var second_email = document.getElementById('second_email');
	var listEmail = document.getElementById('listEmail');
	if (listEmail.value == '#') {
		second_email.readOnly = true;
	}
	listEmail.onchange = function() {
		// 이메일 리스트 변경시 기존 메세지 초기화
		msg = '';
		document.getElementById('msgEmail').innerHTML = msg;
		if (listEmail.value == '#') {
			second_email.value = '';
			second_email.readOnly = true;
		} else if (listEmail.value == 'naver.com') {
			second_email.value = 'naver.com';
			second_email.readOnly = true;
		} else if (listEmail.value == 'daum.net') {
			second_email.value = 'daum.net';
			second_email.readOnly = true;
		} else if (listEmail.value == 'google.com') {
			second_email.value = 'google.com';
			second_email.readOnly = true;
		} else {
			second_email.value = '';
			second_email.readOnly = false;
		}
	}

	// 이름 입력 시 기존 메세지 초기화
	document.getElementById("name").onkeypress = function() {
		msg = '';
		document.getElementById('msgName').innerHTML = msg;
	}

	// 주민등록번호 입력 시 기존 메세지 초기화
	document.getElementById("first_ssn").onkeypress = function() {
		msg = '';
		document.getElementById('msgSsn').innerHTML = msg;
	}
	document.getElementById("second_ssn").onkeypress = function() {
		msg = '';
		document.getElementById('msgSsn').innerHTML = msg;
	}

	// 이메일 입력 시 기존 메세지 초기화
	document.getElementById("first_email").onkeypress = function() {
		msg = '';
		document.getElementById('msgEmail').innerHTML = msg;
	}

	// 연락처 입력 시 기존 메세지 초기화
	document.getElementById("second_tel").onkeypress = function() {
		msg = '';
		document.getElementById('msgTel').innerHTML = msg;
	}
	document.getElementById("third_tel").onkeypress = function() {
		msg = '';
		document.getElementById('msgTel').innerHTML = msg;
	}

	// 주소 입력 시 기존 메세지 초기화
	document.getElementById("rest_address").onkeypress = function() {
		msg = '';
		document.getElementById('msgAdd2').innerHTML = msg;
	}

	// 회원가입 버튼 클릭
	document.getElementById("btnCheck").onclick = function() {
		// 아이디 중복확인 클릭 값 확인
		var idchecknum = document.getElementById('idbtncheck').value;

		// 아이디 미입력 확인
		if (document.getElementById("id").value.length == 0) {
			msg = "아이디를 입력하여 주세요.";
			document.getElementById('msgId').innerHTML = msg;
			return false;
		} else {
			msg = '';
			document.getElementById('msgId').innerHTML = msg;
		}

		// 패스워드 미입력
		if (document.getElementById("password").value.length == 0
				|| document.getElementById("passwordcheck").value.length == 0) {
			msg = '패스워드를 입력하여 주세요.'
			document.getElementById('msgPw').innerHTML = msg;
			return false;
		}
		// 패스워드 불일치
		else if (document.getElementById("password").value != document
				.getElementById("passwordcheck").value) {
			msg = '패스워드 값이 서로 일치하지 않습니다.';
			document.getElementById('msgPw').innerHTML = msg;
			return false;
		} else {
			msg = '';
			document.getElementById('msgPw').innerHTML = msg;
		}

		// 이름 미입력
		if (document.getElementById("name").value.length == 0) {
			msg = '이름를 입력하여 주세요.'
			document.getElementById('msgName').innerHTML = msg;
			return false;
		}

		// 주민등록번호 미입력
		if (document.getElementById("first_ssn").value.length == 0
				|| document.getElementById("second_ssn").value.length == 0) {
			msg = '주민등록번호를 입력하여 주세요.'
			document.getElementById('msgSsn').innerHTML = msg;
			return false;
		}

		// 주민등록번호 형식확인 정규식
		var ssnCheck = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;

		// 주민등록번호 형식 불일치
		if (!ssnCheck.test(document.getElementById("first_ssn").value + '-'
				+ document.getElementById("second_ssn").value)) {
			msg = '주민등록번호를 확인하여 주세요.';
			document.getElementById('msgSsn').innerHTML = msg;
			return false;
		} else {
			msg = '';
			document.getElementById('msgEmail').innerHTML = msg;
		}
		//성별확인
		var g_n = $("#second_ssn")[0].value.substr(0,1);
	       var pat_gender ="";               
	       
	       if(g_n == 1 || g_n == 3 || g_n == 5 || g_n == 7 || g_n == 9) {
	          pat_gender = "M";
	       } else {
	          pat_gender = "F";
	       }
	       $("#pat_gender").attr("value", pat_gender);

		// 이메일 형식확인 정규식
		var emailCheck1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*/;
		var emailCheck2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

		// 이메일 형식 불일치
		if (!emailCheck1.test(document.getElementById("first_email").value)
				|| !emailCheck2
						.test(document.getElementById("second_email").value)) {
			msg = '이메일을 확인하여 주세요.';
			document.getElementById('msgEmail').innerHTML = msg;
			return false;
		} else {
			msg = '';
			document.getElementById('msgEmail').innerHTML = msg;
		}

		// 연락처 정규식
		var telCheck1 = /^([0-9]{3,4})$/;
		var telCheck2 = /^([0-9]{4})$/;

		// 연락처 형식 확인
		if (!telCheck1.test(document.getElementById("second_tel").value)
				|| !telCheck2.test(document.getElementById("third_tel").value)) {
			msg = '연락처를 확인하여 주세요.';
			document.getElementById('msgTel').innerHTML = msg;
			return false;
		} else {
			msg = '';
			document.getElementById('msgTel').innerHTML = msg;
		}

		// 주소확인
		if (document.getElementById("main_address").value.length == 0) {
			msg = '주소를 입력하여 주세요.';
			document.getElementById('msgAdd1').innerHTML = msg;
			return false;
		} else {
			msg = '';
			document.getElementById('msgAdd1').innerHTML = msg;
		}
		if (document.getElementById("rest_address").value.length == 0) {
			msg = '나머지 주소를 입력하여 주세요.'
			document.getElementById('msgAdd2').innerHTML = msg;
			return false;
		} else {
			msg = '';
			document.getElementById('msgAdd2').innerHTML = msg;
		}

		// 아이디 중복확인 버튼 클릭 확인
		if (idchecknum === '') {
			alert('아이디 중복확인이 필요합니다.')
			return false;
		} else {
			return true;
		}
	} // onclick end
} // onload end