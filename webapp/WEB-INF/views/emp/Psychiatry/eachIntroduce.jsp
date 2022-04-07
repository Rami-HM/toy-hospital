<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>부경대학교병원</title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
			<h1>부경대학교병원 <span style="font-size: 20px; color: gray;">-정신과</span></h1>
			<br /> <br /> <br />
			<div>

				<div class="editWrap">
					<div class="introduceWrap clearFix">
						<img title="정신과" style="border: 0px solid rgb(0, 0, 0); border-image: none; width: 250px; height: 250px; margin-right: 10px; margin-bottom: 10px; float: left;" alt="" 
						src="/img/Psychiatryicon.PNG">
						
						<p>부경대학교병원 정신건강의학과는 교수, 전임의, 전공의, 임상심리학자 등 정신의학 전문인력으로 구성되어 있으며 환자진료, 전문인력교육, 정신의학관련연구, 공공정신의료사업 등 다양한 활동을 하고 있습니다.</p>
						<p>
							<br>
						</p>
						<p>정신과적 면담과 검사를 통해 질병을 진단하고 개별 환자에 대해 생물학적∙심리적∙환경적 요인을 고려한 통합적인 치료를 하고 있습니다. 조현병, 양극성장애, 우울장애, 강박장애, 불안장애, 치매 및 노인정신질환, 정신신체장애, 중독장애, 수면장애, 통증장애 등 세부 질환을 전문적으로 다루는 특수 클리닉을 개설하여 최고의 진료를 제공합니다. 외래진료뿐 아니라 개방병동, 보호병동, 낮병원 등 다양한 형태의 입원치료와 다른 과에서 치료 중인 환자에 대한 협진도 제공하고 있습니다.</p>
						<p>
							<br>
						</p>
						<p>서울대학교 의과대학의 정신과학 및 행동과학 교육을 주관하고 있고 전공의 수련을 통하여 유능한 전문인력을 배출하고 있습니다. 다양한 정신의학 관련연구를 활발히 하고 있으며 국제학술대회와 학술지에 우수한 연구결과들을 발표하고 있습니다. 또한 지역사회정신건강센터, 치매센터, 해바라기센터 등을 운영하면서 공공의료사업에도 적극 참여하고 있습니다.</p>
					</div>
				</div>
			</div>
		</section>
		<footer></footer>
	</div>
</body>
</html>