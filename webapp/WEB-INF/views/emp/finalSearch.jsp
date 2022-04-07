<!-- home에서 검색시 나올 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>의료진 검색</title>
<link rel="stylesheet" href="/css/homePage.css/" />
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<style>
table {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
	border : none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {

		$('#search').click(
				function() {
					var search = $('#check').val();
					$('#value').attr(
							'action',
							"/Emp/finalSearch?dept_name=" + search
									+ "&emp_name=" + search);
					$('#search').submit();

				});

		$('#check').keypress(function(e) {
			if (e.which == 13) {
				$('#search').click();
			}
		});

		$('[type=radio]').click(function() {
			if ($('[type=radio]')[0].checked) {
				$("#basic").attr("style", "display:inline");
				$("#spell").attr("style", "display:none");
			}
			if ($('[type=radio]')[1].checked) {
				$("#basic").attr("style", "display:none");
				$("#spell").attr("style", "display:inline");
			}

		});

	})
</script>
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

	<!-- ------------------------------------------------------------------------------------------------------- -->
	<section>
			<div class="main" style="height: auto;">
				<div class="contTitleWrap">
					<div class="btnWrap">
						<a href="/Emp/introStaff" style="text-decoration: none"
							class="btnType02 btnSmall" role="button"><h3>진료과 전체</h3></a>
					</div>
				</div>

				<div>

					<form method="post" action="" id="value">
						<input type="text" size="50" name="search"
							placeholder="의료진/질병명 검색하기" id="check">
						<button id="search">검색</button>
					</form>

					<div style="text-align: right">
						<input type="radio" name="chk_info" value="basic"
							checked="checked">기본 <input type="radio" name="chk_info"
							value="spell">가나다순
					</div>
				</div>




				<hr>

				<!-- -------------------------------------------------------------------------- -->

				<!-- 검색어가 무엇인지 가르켜 줌 -->
				<p>${result}</p>

				<c:choose>
					<c:when test="${empty finalSearch }">
						<p>${result2}</p>
					</c:when>
					<c:when test="${not empty finalSearch }">
						<p>
							검색 결과 총 <b style="color: blue">${finalSearch.size()}</b>명
							검색되었습니다.
						</p>
						<br>

						<div id="basic">

							<c:set var="i" value="0" />
							<c:set var="j" value="4" />
							<table>

								<c:forEach var="doctor" items="${finalSearch}">
									<c:if test="${i%j == 0 }">
										<tr>
									</c:if>

									<td height="230" width="1000"
										style="text-align: center; padding: 10px;"><a
										href="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}"
										role="button"> <img src="/img/${doctor.emp_img}"
											alt="${doctor.emp_name }" width=100% height=100%></a> <span
										style="font-size: 20px; font-weight: bold;">${doctor.emp_name}선생님</span>
										/ ${doctor.dept_name } <c:if test="${i%j == j-1 }">
											</tr>
										</c:if> <c:set var="i" value="${i+1 }" />
								</c:forEach>
							</table>
						</div>


						<div id="spell" style="display: none">

							<c:set var="i" value="0" />
							<c:set var="j" value="4" />

							<table>

								<c:forEach var="doctor" items="${finalSearch2}"
									varStatus="status2" begin="0" end="${ finalSearch.size()}"
									step="1">
									<c:if test="${i%j == 0 }">
										<tr>
									</c:if>
									<td height="230" width="1000" style="text-align: center"><a
										href="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}"
										role="button"> <img src="/img/${doctor.emp_img}"
											alt="${doctor.emp_name }" width=100% height=100%></a><a
										href="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}"
										role="button">자세히보기</a></td>

									<td height="200" width="200" style="text-align: center"><a
										href="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}"
										role="button">${doctor.emp_name }선생님</a><br /> <a
										href="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}"
										role="button" id="btn"> 예약하기</a><br> 담당:<em
										style="color: blue">${doctor.dept_name }</em><br />
										${doctor.emp_position }</td>

									<c:if test="${i%j == j-1 }">
										</tr>
									</c:if>
									<c:set var="i" value="${i+1 }" />

								</c:forEach>
							</table>
						</div>

					</c:when>
				</c:choose>
			</div>
		</section>
	<footer></footer>
	</div>
</body>
</html>

