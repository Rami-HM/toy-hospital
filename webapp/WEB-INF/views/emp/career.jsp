<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--

병원소개->의료진 소개를 누르고 나오는 페이지
 
-->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<title></title>

<style>
table { border : none;}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>

<body>
	<div id="container">
		<header>
			<a href="/"><img src="/img/hlogo.png" width="240" /></a>
		</header>
		<nav>
			<script type="text/javascript" src="/js/menulist.js"></script>
			<%@include file="/WEB-INF/include/menulist.jspf"%>
		</nav>

		<div style='display: inline-block; min-width: 1000px;'>
			<div
				style='display: inline-block; float: left; width: 500px;'>
				<img src="${img}">
			</div>
			<div
				style='margin-left: 30px; display: inline-block; float: left; width: 450px;'>
				<br />
				<br />
				<span style = "font-size : 40px; font-weight: bold;">${vo.getEmp_name()} ${vo.getEmp_position()}</span> / 
				<span style = "font-size : 20px; ">${vo.getDept_name()}</span>
				<br />
				<br />
				<br />
				<br />
				<table>
					<c:forEach var="hlist" items="${historyList}">
						<tr>
							<td style="color:gray;">-${hlist.hst_date}</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;${hlist.hst_career}</td>
						</tr>
					</c:forEach>

				</table>
			</div>

		</div>
	</div>
</body>
</html>