<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 페이지</title>
		<link href="/css/registerForm.css" rel="stylesheet" type="text/css">

		<style>
			header {
			   width: 100%;
			   height: 60px;
			   margin: 0 auto;
			}
			
			header img {
			   position: absolute;
			   left: 50%;
			   margin-left: -120px;
			   margin-top: 15px;
			}
		</style>
		
		<script src="https://code.jquery.com/jquery.min.js"></script>
		<script type="text/javascript" src = "/js/registerForm.js"></script>

	</head>
	<body>	
		<header style = "text-align : center;">
                <a href="/"><img src="/img/hlogo.png" width="240"></a>
           </header>
		<form action="/login/regMember/submit" method="POST">
			<input type="hidden" name="pat_gender" value="" id="pat_gender"/>
			<table id="table">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="id" autocomplete=off size="60" /> <input type="button" id="idcheck" value="중복확인" />
						<input type="hidden" name="idbtncheck" id="idbtncheck" value=""/> <span id="msgId"></span>
					</td> 
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="password" id="password" size="60" /> <span id="msgPw"></span></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td><input type="password" name="passwordcheck" id="passwordcheck" size="60" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name" size="60" autocomplete="off"/> <span id="msgName"></span></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td>
						<input type="text" name="first_ssn" id="first_ssn" size="31" autocomplete="off"/> -
						<input type="password" name="second_ssn" id="second_ssn" size="31" autocomplete="off"/> <span id="msgSsn"></span>
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