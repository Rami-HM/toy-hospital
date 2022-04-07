<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.resgo:hover {
		background:#018ace;
		color:#fff;
	}
	.Posiresev {
		color:blue;
	}
</style>
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/timetablePage.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<script type="text/javascript">
	$(function() {
		$(".Posiresev").parent().parent().click(function() {
			var time = $(this)[0].innerText.substring(0,8);
			
			$("[name=res_time]").val(time);
			
			var result = confirm('예약 하시겠습니까?');
			
			if(result) { 
				$('#form').submit();
			} 
			
			else {}
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
			<script type="text/javascript" src="/js/menulist.js"></script>
			<%@include file="/WEB-INF/include/menulist.jspf"%>
		</nav>
		<!--nav-->
		<section>
		<form action = "/Reserv/UpdateForm" method="POST" id = "form">
			<input type = "hidden" name = "res_date" value = '${rv.res_date}' />
			<input type = "hidden" name = "res_time" />
			<input type = "hidden" name = "emp_name" value = '${empVo.emp_name}' />
			
			<div class="schedule">
			<h1>온라인 예약</h1>
				<input type="hidden" name="reslistsize" value="${reslistsize}" />
				<h3>${rv.res_date } ${empVo.emp_name} 선생님의 진료 및 검사 스케쥴 입니다 :-)</h3>
				<br>
				<table class="morning">
					<tr>
						<td width="110" style="font-weight: bold;">시간</td>
						<td width="200" style="font-weight: bold;">환자 진료 스케줄</td>
					</tr>

				
					<c:forEach var="hour" begin="10" end="17" step="1">
						<tr class='resgo' select="false">
							<td>${hour}:00:00 ~ ${hour}:59:59</td>
							<td class='td2'>
							<c:set var = "check"><span class="Posiresev">예약하기</span></c:set>
							<c:set var="doneLoop" value="false"/> 
							<c:forEach var="time" items="${resVo}">
								<c:if test="${not doneLoop}">
								<c:set var = "restime">${hour}:00:00</c:set>
									<c:choose>
										<c:when test="${time.res_time eq restime}">
											<c:set var = "check" ><span class="done">예약완료</span></c:set>
											<c:set var="doneLoop" value="true"/> 
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
							${check}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</form>
		</section>
	</div>
	<footer></footer>
</body>
</html>