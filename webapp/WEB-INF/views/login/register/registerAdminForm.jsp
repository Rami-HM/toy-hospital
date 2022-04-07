<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 페이지</title>
		<!-- <link href="/css/regMember.css" rel="stylesheet" type="text/css"> -->
		<style>
			#table { 
				border:2px solid black;
				width:1050px;
				padding:50px;
				margin:100px auto;
	 
			}
			th,td {
				padding:20px;
				font-size:20px;
			}
			th {
				width:140px;
			}
			span {
				color:red;
				font-size:12px;
			}
			input {
				line-height:25px;
			}
			select {			
				height:25px;
			}
			input[type=button] {
			    width: 100px;  height:30px;
			    font-size:14px;
			}
			input[type=submit] {
			    width: 100px;  height:30px;
			    margin-right:80px;
			    font-size:14px;
			}
		</style>
		
		<script src="https://code.jquery.com/jquery.min.js"></script>
		<script>
			window.onload = function() {
				// 아이디 중복확인 버튼 클릭
				document.getElementById("idcheck").onclick = function() {
					if(document.getElementById("id").value.length == 0) // 입력된 아이디가 없는 경우 
					{ 
						msg = '아이디를 입력하여 주세요.';
						document.getElementById('msgId').innerHTML = msg; 
					} else {
						var url = "/regMember/idCheck?pat_id=" + $("#id").val();
						window.open(url,
							"checkIdPage", "width=400, height=250, resizable=no, scrollbars=no, top=200, left=500");
					}
				}
				
				// 아이디 입력 시 기존 메세지 초기화
				document.getElementById("id").onkeypress = function() {
					document.getElementById('idbtncheck').value = ''; // 아이디 변경시 중복확인 값 초기화
					msg   = '';
					document.getElementById('msgId').innerHTML = msg;
				}
				
				// 주소찾기 버튼 클릭
				document.getElementById("btnfindaddress").onclick = function() {
					msg = '';
					document.getElementById('msgAdd1').innerHTML = msg; // 주소 찾기 버튼 클릭시 기존 메시지 초기화
					
					window.name = "regMemberForm";
					
					var url = "/regMember/findAddressForm";
					window.open(url,
						"FindAddressFormPage", "width=800, height=500, resizable=no, scrollbars=no, top=150, left=500");
				}
				
				// 이메일 처리
				var second_email = document.getElementById('second_email');
				var listEmail    = document.getElementById('listEmail'); 
				
				if(listEmail.value == '#') {
					second_email.readOnly = true;
				} 
				listEmail.onchange = function() {
					msg = '';
					document.getElementById('msgEmail').innerHTML = msg; // 이메일 리스트 변경시 기존 메세지 초기화 
					
					if(listEmail.value == '#') {
						second_email.value = '';
						second_email.readOnly = true;
					} else if(listEmail.value == 'naver.com') {
						second_email.value = 'naver.com';
						second_email.readOnly = true;
					} else if(listEmail.value == 'daum.net') {
						second_email.value = 'daum.net';
						second_email.readOnly = true;
					} else if(listEmail.value == 'google.com') {
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
				document.getElementById("first_rss").onkeypress = function() {
					msg = '';
					document.getElementById('msgRss').innerHTML = msg;
				}
				document.getElementById("second_rss").onkeypress = function() {
					msg = '';
					document.getElementById('msgRss').innerHTML = msg;
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
					// 아이디 중복확인 클릭 확인을 위한 값
					var idchecknum = document.getElementById('idbtncheck').value;
					
					// 아이디 미입력 확인
					if(document.getElementById("id").value.length == 0) {
						msg = "아이디를 입력하여 주세요.";
						document.getElementById('msgId').innerHTML = msg;
						return false;
					} else {
						msg = '';
						document.getElementById('msgId').innerHTML = msg;
					}
					
								
					// 패스워드 미입력
					if(document.getElementById("password").value.length == 0 || document.getElementById("passwordcheck").value.length == 0) {
						msg = '패스워드를 입력하여 주세요.'
						document.getElementById('msgPw').innerHTML = msg;
						return false;
					}
					// 패스워드 불일치
					else if(document.getElementById("password").value != document.getElementById("passwordcheck").value) {
						msg = '패스워드 값이 서로 일치하지 않습니다.';
						document.getElementById('msgPw').innerHTML = msg;
						return false;
					} else {
						msg = '';
						document.getElementById('msgPw').innerHTML = msg;
					}
					
					// 이름 미입력
					if(document.getElementById("name").value.length == 0) {
						msg = '이름를 입력하여 주세요.'
						document.getElementById('msgName').innerHTML = msg;
						return false;
					}
					
					// 주민등록번호 미입력
					if(document.getElementById("first_rss").value.length == 0 || document.getElementById("second_rss").value.length == 0) {
						msg = '주민등록번호를 입력하여 주세요.'
						document.getElementById('msgRss').innerHTML = msg;
						return false;
					}
					
					// 주민등록번호 형식확인 정규식
					var rssCheck = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;

					// 주민등록번호 형식 불일치
					if(!rssCheck.test(document.getElementById("first_rss").value + '-' + document.getElementById("second_rss").value)) {
						msg = '주민등록번호를 확인하여 주세요.';
						document.getElementById('msgRss').innerHTML = msg;
						return false;
					} else {
						msg = '';
						document.getElementById('msgEmail').innerHTML = msg;						
					}
					
					// 이메일 형식확인 정규식
					var emailCheck1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*/;
					var emailCheck2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
					
					// 이메일 형식 불일치
					if(!emailCheck1.test(document.getElementById("first_email").value) ||
							!emailCheck2.test(document.getElementById("second_email").value)) {
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
					if(!telCheck1.test(document.getElementById("second_tel").value) ||
							!telCheck2.test(document.getElementById("third_tel").value)) {
						msg = '연락처를 확인하여 주세요.';
						document.getElementById('msgTel').innerHTML = msg;
						return false;
					} else {
						msg = '';
						document.getElementById('msgTel').innerHTML = msg;
					}
										
					
					// 주소확인
					if(document.getElementById("main_address").value.length == 0) {
						msg = '주소를 입력하여 주세요.';
						document.getElementById('msgAdd1').innerHTML = msg;
						return false;
					} else {
						msg = '';
						document.getElementById('msgAdd1').innerHTML = msg;
					}
					if(document.getElementById("rest_address").value.length == 0) {
						msg = '나머지 주소를 입력하여 주세요.'
							document.getElementById('msgAdd2').innerHTML = msg;
						return false;
					} else {
						msg = '';
						document.getElementById('msgAdd2').innerHTML = msg;
					} 
					
					// 아이디 중복확인 버튼 클릭 확인
					if(idchecknum === '') {
						alert('아이디 중복확인이 필요합니다.')
						return false; 
					} else {
						return true;
					}
					
				} // onclick end
				
				
				// 취소버튼 클릭
				document.getElementById('btnCancel').onclick = function() {
					location.href='LoginForm.html';
				}
	
			} // onload end
		</script>
		
	</head>
	<body>	
		<form action="/regMember/submit" method="POST">
			<table id="table">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="id" autocomplete=off size="40" /> <input type="button" id="idcheck" value="중복확인" />
						<input type="hidden" name="idbtncheck" id="idbtncheck" value=""/> <span id="msgId"></span>
					</td> 
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="password" id="password" size="40" /> <span id="msgPw"></span></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td><input type="password" name="passwordcheck" id="passwordcheck" size="40" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name" size="40" autocomplete="off"/> <span id="msgName"></span></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td>
						<input type="text" name="first_rss" id="first_rss" size="16" autocomplete="off"/> -
						<input type="text" name="second_rss" id="second_rss" size="16" autocomplete="off"/> <span id="msgRss"></span>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="first_email" id="first_email" size="20" autocomplete="off"/> @ <input type="text" name="second_email" id="second_email" size="25" autocomplete="off"/> 
						<select name="second_email" id="listEmail" >
							<option value="#" selected>주소선택</option>
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="google.com">google.com</option>
						</select>
						<span id="msgEmail"></span>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<select name="first_tel">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" name="second_tel" id="second_tel" size="6" autocomplete="off"/> -
						<input type="text" name="third_tel" id="third_tel" size="6" autocomplete="off"/>
						<span id="msgTel"></span>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="zipcode" id="zipcode" size="20" readonly /><br>
						<input type="text" name="main_address" id="main_address" size="60" readonly /> <input type="button" id="btnfindaddress" value="주소찾기" /><span id="msgAdd1"></span><br>
						<input type="text" name="rest_address" id="rest_address" size="60" placeholder="나머지주소" autocomplete="off"/> <span id="msgAdd2"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입" id="btnCheck" />
						<input type="button" value="취소" id="btnCancel"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>