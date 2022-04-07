<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>로그인 실패</title>
		<script>
			// 로그인 실패 경고창 출력
			alert("${msg}");
			
			// 로그인 페이지로 이동
			location.href="/login";
		</script>
	</head>

</html>