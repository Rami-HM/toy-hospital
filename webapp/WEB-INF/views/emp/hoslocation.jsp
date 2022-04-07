<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>
</head>

<body>
	<div id="container">
		<header>
			<a href="/"><img src="/img/hlogo.png" width="240"></a>
		</header>
		<nav>
			<script type="text/javascript" src="/js/menulist.js"></script>
			<%@include file="/WEB-INF/include/menulist.jspf"%>
		</nav>

		<section>
			<div id="imgslide" class="all">
				<div class="mainbn" style="height: 200px;">
					<img src="/img/mainbn2.png" width="1000" height="200">
					<img src="/img/mainbn.jpg" width="1000" height="200">
					<img src="/img/mainbn3.jpg" width="1000" height="200">
				</div>
			</div>
			<div>

				<h2 style="margin: 30px; display: inline-block;">원내위치도</h2>
				<div style="display: block; position: absolute; right: 0; top:300px;">
					<span style="margin: 30px; display:inline-block;">무슨 과로 가시나요?</span> <select name="jump" onchange="location.href=this.value" id="ab">
						<option>선택</option>
						<option value="/Emp/Location?dept_num=10">내과</option>
						<option value="/Emp/Location?dept_num=20">외과</option>
						<option value="/Emp/Location?dept_num=30">신경과</option>
						<option value="/Emp/Location?dept_num=40">정신과</option>
						<option value="/Emp/Location?dept_num=50">피부과</option>
					</select>
				</div>
			</div>

			<div>
				<img src="/img/map.jpg" width="1000" height="600">
			</div>

		</section>

	</div>

	<footer style="height: 100px;"></footer>

</body>
</html>


