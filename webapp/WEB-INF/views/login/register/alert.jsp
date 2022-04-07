<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>회원가입 성공</title>
		<script>
			// 회원가입 성공메세지 출력
			alert("${registerSuccessMsg}");
			
			// 메인페이지로 이동
			location.href="/";
		</script>
	</head>
</html>