<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>부경대학교병원</title>
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<style type="text/css">
.table {
	width: 100%;
	height: 250px;
	border: 1px solid #eaeaea;
	background: white;
	display: block;
	padding-left: 10px;
}

.table p {
	padding-left: 10px;
	margin-left: -10px;
	font-size: 12px;
	color: #5E5D56;
	line-height: 18px;
}

.idwelcome {
	margin-left: 10px;
}

.logout {
	background: #faed00;
	display: block;
	text-align: center;
	border-radius: 5px;
	width: 180px;
	height: 33px;
	line-height: 33px;
	margin: 20px auto 0 22px;
}

.logout a {
	color: #5E5D56;
}

.link
{
	color:white;
	
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>


<script>
	$(window).ready(
			function() {

				$('#search').click(
						function() {
							var search = $('#check').val();
							$('#value').attr(
									'action',
									"/Emp/finalSearch?dept_name=" + search
											+ "&emp_name=" + search);
							$('#search').submit();

						});
				var win;
				if ($("[name = grade]").val() == 'true') {
					win = window.open("/echo", "chat",
							"height=500,width=280,top=100,left=100");
					win.focus();
				}

				$("#logout").click(function() {
					alert("로그아웃 되었습니다.");
					win.close();
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
			<script type="text/javascript" src="/js/menulist.js"></script>
			<%@include file="/WEB-INF/include/menulist.jspf"%>
		</nav>
		<div id="imgslide" class="all">
			<div class="mainbn">
				<img src="/img/mainbn2.png" width="1000" height="400">
				<img src="/img/mainbn.jpg" width="1000" height="400">
				<img src="/img/mainbn3.jpg" width="1000" height="400">
			</div>
		</div>

		<section>
			${close} <input type="hidden" name="grade" value="${grade}" /> <input type="hidden" name="mypageW" value="${mypageW}" />
			<div class="main">
				<ul>
					<li><c:choose>
							<c:when test="${ sessionScope.login.loginNum eq 1 }">
								<div class="table">
									<p>
										부경대학교병원을 <br /> 더 안전하고 편리하게 이용하세요.
									</p>
									<span class="idwelcome">${ sessionScope.login.id }님 환영합니다. ღ'ᴗ'ღ </span> <span class="logout"><a href="/logout" id="logout">로그아웃</a></span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="table">
									<p>
										부경대학교병원을 <br /> 더 안전하고 편리하게 이용하세요.
									</p>
									<button class="login" align="center">로그인</button>
								</div>
							</c:otherwise>
						</c:choose></li>
					<li>
						<div class="reserv">
							<h2>의료진 소개</h2>
							<p>
								각 부서의 의료진의 <br> 정보를 볼 수 있습니다.
							</p>
							<button style="border: 2px solid white; width: 120px; height: 50px; background: none;">
								<a href="/Emp/finalSearch" class="link">바로가기</a>
							</button>
						</div>
					</li>
					<li>
						<div class="center">
							<h2>진료과/센터</h2>
							<p>
								병원의 진료과/센터를 <br> 상세히 확인할 수 있습니다.
							</p>
							<button style="border: 2px solid white; width: 120px; height: 50px; background: none;">
							<a href="/Emp/introStaff" class="link">바로가기</a></button>
						</div>
					</li>
					<li>
						<div class="info">
							<h2>진료안내</h2>
							<p>
								대표전화 1588-5700 <br> 암환자 상담 02-2072-0707
							</p>
							<button style="border: 2px solid white; width: 120px; height: 50px; background: none;">
							<a href="/Center/home" class="link">바로가기</a></button>
						</div>
					</li>
				</ul>
			</div>
			<!--main-->
			<div class="doc">
				<img src="/img/bg_search01.jpg">



				<h1>의료진 찾기</h1>
				<form method="post" action="" id="value">
					<input type="text" size="50" name="search" placeholder="의료진/질병명 검색하기" id="check">
					<button id="search">검색</button>
				</form>
			</div>
			<div class="con1">
				<ul>
					<li><a href="#"><img src="/img/icon1.png"></a></li>
					<li><a href="#"><img src="/img/icon2.png"></a></li>
					<li><a href="#"><img src="/img/icon3.png"></a></li>
					<li><a href="#"><img src="/img/icon4.png"></a></li>
				</ul>
			</div>
			<div class="map">
				<table cellpadding="0" cellspacing="0" width="462">
					<tr>
						<td style="border: 1px solid #cecece;"><a href="https://map.naver.com/?searchCoord=67ff3364dc476514623c0094742a6d5b3a5110c790ae27a4e393ae5294f2ad63&query=67aA6rK964yA7ZWZ6rWQIOyaqeuLuey6oO2NvOyKpA%3D%3D&tab=1&lng=8336946423fddf52e953c00a96cbdbf2&mapMode=0&mpx=421f69f4635fde4e9b8e8207c3ca4c175ddeb621cbdc48dc20021e72f6db707cf0def734f7256df9af68955bab4eb131ab045d71a719cdb849a25754b70b1dce&lat=b3358b4abd5e24b033813aa6028c3a36&dlevel=10&enc=b64&menu=location" target="_blank"><img src="http://prt.map.naver.com/mashupmap/print?key=p1560349570512_184670746" width="460" height="340" alt="지도 크게 보기" title="지도 크게 보기" border="0" style="vertical-align: top;" /> </a></td>

					</tr>
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td height="30" bgcolor="#f9f9f9" align="left" style="padding-left: 9px; border-left: 1px solid #cecece; border-bottom: 1px solid #cecece;"><span style="font-family: tahoma; font-size: 11px; color: #666;">2019.6.12</span> &nbsp; <span style="font-size: 11px; color: #e5e5e5;">|</span> &nbsp; <a style="font-family: dotum, sans-serif; font-size: 11px; color: #666; text-decoration: none; letter-spacing: -1px;" href="https://map.naver.com/?searchCoord=67ff3364dc476514623c0094742a6d5b3a5110c790ae27a4e393ae5294f2ad63&query=67aA6rK964yA7ZWZ6rWQIOyaqeuLuey6oO2NvOyKpA%3D%3D&tab=1&lng=8336946423fddf52e953c00a96cbdbf2&mapMode=0&mpx=421f69f4635fde4e9b8e8207c3ca4c175ddeb621cbdc48dc20021e72f6db707cf0def734f7256df9af68955bab4eb131ab045d71a719cdb849a25754b70b1dce&lat=b3358b4abd5e24b033813aa6028c3a36&dlevel=10&enc=b64&menu=location" target="_blank"> 지도 크게 보기</a></td>

									<td width="98" bgcolor="#f9f9f9" align="right" style="text-align: right; padding-right: 9px; border-right: 1px solid #cecece; border-bottom: 1px solid #cecece;"><span style="float: right;"> <span style="font-size: 9px; font-family: Verdana, sans-serif; color: #444;">&copy;&nbsp;</span> &nbsp; <a style="font-family: tahoma; font-size: 9px; font-weight: bold; color: #2db400; text-decoration: none;" href="http://www.nhncorp.com" target="_blank">NAVER Corp.</a>
									</span></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</section>

		<footer></footer>
	</div>
</body>
</html>