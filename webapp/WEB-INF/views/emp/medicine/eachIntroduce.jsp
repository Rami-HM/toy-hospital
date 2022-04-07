<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>부경대학교병원</title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>

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
		<section>
			<br />
			<br />
			<br />
			<br />
			<h1>부경대학교병원 <span style="font-size: 20px; color: gray;">-내과</span></h1>
			<br /> <br /> <br />
			<div>
				<p class="desc2" style="color: #d77429; font-size: 18px;">첨단 시설과
					최상의 의료진으로 최고의 의료서비스를 제공하겠습니다.</p>
					<br />
				<div class="desc2">
					<img title="내과" style="border: 0px solid rgb(0, 0, 0); width: 250px; height: 300px; margin-right: 10px; margin-bottom: 10px; float: left;" alt="" 
					src="/img/medicine.png">
					<span>
						<b>부경대학교병원 내과에서는</b><br/>
					식도, 위, 소장, 대장, 간, 췌장, 담도 질환의 진료를 담당하고 있으며, 위장관, 간, 췌담도 질환에
						관해 전문적인 의료진들의 상세한 상담과 검사 및 치료를 받으실 수 있습니다.</span><br/>
					<span>
						<span style="line-height: 1.5;">&nbsp;</span>
					</span><br/>
					<span>
						<span style="line-height: 1.5;"><b>본원의 소화기 내시경실은</b></span>
					</span><br/>
					<span>
						<span style="line-height: 1.5;">상부위장관내시경, 대장내시경, 췌담도내시경,
							초음파 내시경, 캡슐내시경 등이 갖추어져 있으며, 임상 경험이 풍부한 전문의들에 의해 역류성 식도염, 위궤양,
							십이지장 궤양, 식도암, 위암, 대장암, 대장 용종, 담관 담석, 담도암, 췌장암, 소장 질환 등에 대한 진단과
							치료가 이루어 지고 있으며, 급성위장관 출혈에 관해서는 24시간 당직 시스템을 가동하여 응급 내시경 치료를 시행하고
							있습니다.</span>
					</span><br/>
					<span>
						<span style="line-height: 1.5;">&nbsp;</span>
					</span><br/>
					<span>
						<span style="line-height: 1.5;">또한 간암, 바이러스 및 알코올성 간질환,
							지방간, 급성 간부전 등에 관해 체계적이고 포괄적인 진료를 받으실 수 있으며, 특히 응급 진료를 요하는 급/만성
							간부전 환자에 관해 전문적인 중환자 치료를 수행하며, 필요할 경우 성공적인 간이식이 이루어질 수 있도록 최선을 다하고
							있습니다.</span>
					</span><br/>
					<span>
						<b style="line-height: 1.5;"><br></b>
					</span><br/>
					<span>
						<b style="line-height: 1.5;">부경대학교병원 소화기내과는</b>&nbsp;
					</span><br/>
					<span>진료, 학술 연구, 교육에 끊임없이 노력하여 소화기 질환에 관해 지역 사회의 선도적인 역할을 다할 수 있도록
						노력하고 있습니다. &nbsp;</span><br/>
				</div>
			</div>
		</section>
		<footer></footer>
	</div>
</body>
</html>