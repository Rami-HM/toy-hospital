<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>부경대학교병원</title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<style>

.div_result {
	border: 1px solid #ccc;
	display: inline-block;
	text-align: center;
	margin-top: 100px;
	width: 1000px;
	height: 200px;
}

p {
	margin-top: 80px;
}

span {
	font-weight: bold;
	color: blue;
}

input[type=button] {
	width:100px;
	border-radius:8px;
	font-weight:bold;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>
<script>
	$(function(){
		$("#btnGoToLogin").click(function() {
			window.location.replace("/login");
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
			<div class="div_result">
				<p>
					조회된 아이디는 <span>'${ pat_id }'</span> 입니다.
				</p>
				<br/>
				<input type="button" value="돌아가기" id="btnGoToLogin" />
			</div>
		</section>
		<footer></footer>
	</div>
</body>
</html>