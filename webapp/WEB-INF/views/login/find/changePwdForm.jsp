<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>부경대학교병원</title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<style>
body {
	text-align: center;
}

.div_pwChange {
	border: 1px solid #ccc;
	display: inline-block;
	text-align: center;
	margin-top: 100px;
	width: 1000px;
	height: 300px;
}

table {
	border: 1px solid #ccc;
	margin: 70px auto;
	padding:10px;
}

table td {
	text-align: center;
	padding:10px;
}

input[type=submit] {
	width:100px;
	border-radius:8px;
	font-weight:bold;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>
<script>
	$(function(){
		// 변경하기 버튼 클릭
		$("#btnGoToLogin").click(function() {
			var new_pat_pw = $("#new_pat_pw").val();
			var new_pat_pw_check = $("#new_pat_pw_check").val();
			
			if(new_pat_pw == "" || new_pat_pw_check == "") {
				alert("패스워드를 입력하여 주세요.");
			} else {
				if(new_pat_pw == new_pat_pw_check) {
					$.ajax({
						url	: "/login/find/findpw/changepw",
						data : { pat_id : $("#pat_id").val(),
							     pat_pw : $("#new_pat_pw").val()
							   },
						datatype : 'json',
						success : function(data) {
							if(data) {
								alert("성공적으로 비밀번호가 수정되었습니다.");
								window.location.replace("/login");
							}
						},
						error : function(xhr) {
							alert("비밀번호 변경 에러발생");
						}
					});	
				} else {
					alert("패스워드가 일치하지 않습니다.");
				}
			}
			return false;
		});
	});

</script>
</head>
<body>
	<div id="container">
		<header>
			<a href="/"><img src="/img/hlogo.png" width="240" /></a>
		</header>
		<nav>
			
		</nav>
		<section>
			<div class="div_pwChange">
				<form action="/login/find/findpw/changepw" method="POST">
					<input type="hidden" name="pat_id" id="pat_id" />
					<table>
						<tr>
							<th>변경할 패스워드</th>
							<td><input type="password" name="new_pat_pw" id="new_pat_pw" /></td>
						</tr>
						<tr>
							<th>패스워드 확인</th>
							<td><input type="password" id="new_pat_pw_check" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="돌아가기" id="btnGoToLogin" /></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
		<footer></footer>
	</div>
</body>
</html>