<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료예약페이지</title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/reservPage.css" type="text/css">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src ="/js/reservPage.js"></script>
<script type="text/javascript" src ="/js/homePage.js"></script>

<script type="text/javascript">

$(function() {
	$('input[type="submit"]').on("click", function() {
		var name = $(".sel").val();
		var res = name.substring(0,3);
		var idx = $(".sel").html("<option>"+ res +"</option>");
		var fin = emp_name + idx;
		$(".sel").attr("name", fin);
		});
});

</script>
</head>
<body>
	<div id="container">
            <header>
                <a href="/"><img src="/img/hlogo.png" width="240"></a>
            </header>
            <nav>
               <script type="text/javascript" src="/js/menulist.js" ></script>
               <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav><!--nav-->
		<section>
			<h1>온라인 예약</h1>
			<img src="/img/reservation.png">
			<form method="GET" action="/Reserv/TimeTable">
				<caption>원하시는 담당 선생님을 고르세요.</caption>
				<br> 
				<select class= "sel" name="emp_name">
					<c:forEach var="file" items="${empVo }">
						<option>${file.emp_name } / ${file.dept_num }</option>
					</c:forEach>
				</select><br>
				<caption>원하시는 예약 일자를 고르세요.</caption>
				<input type="date" name="res_date" size="20" min="" max="" /> 
				<input type="submit" value="조회" name="btn" id="btn" />
			</form>
			<div class="explain">
				<p>10 : 내과</p>
				<p>20 : 외과</p>
				<p>30 : 신경과</p>
				<p>40 : 정신과</p>
				<p>50 : 피부과</p>
			</div>
		</section>
		<footer></footer>
	</div>
</body>
</html>