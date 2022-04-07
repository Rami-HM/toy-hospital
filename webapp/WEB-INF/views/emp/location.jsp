<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<style>

.clearFix li {
	float: left;
	margin-left: 5px;
}

.clearFix li a {
	display: block;
	width: 120px;
	height: 35px;
	line-height: 30px;
	text-align: center;
	font-weight: bold;
	color: #5E5D56;
}

.clearFix>li a:hover:not(.active){border-bottom: solid 4px #edd600; transition: 0.5s;}
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	start();
	var imgs = 2;
	var now = 0;

	function start() {
		$(".mainbn>img").eq(0).siblings().css({
			"margin-left" : "-2000px;"
		})

		setInterval(function() {
			slide();
		}, 2000);
	}

	function slide() {
		now = now == imgs ? 0 : now += 1;
		$(".mainbn>img").eq(now - 1).css({
			"margin-left" : "-2000px"
		});
		$(".mainbn>img").eq(now).css({
			"margin-left" : "0px"
		});
	}

	$(window).ready(
			function() {
				$('nav').mouseover(function() {
					$(".submenu").stop().slideDown()
				});
				$('nav').mouseout(function() {
					$(".submenu").stop().slideUp()
				});

				$('.gnb>li').on('mouseover', function() {
					var tab = $(this).index();
					$('.sub').hide();
					$('.sub').eq(tab).stop().show();
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
           </nav>
		<!--nav-->

		<section>
			<div id="imgslide" class="all">
				<div class="mainbn">
					<img src="/img/mainbn2.png" width="1000" height="400"> <img
						src="/img/mainbn.jpg" width="1000" height="400"> <img
						src="/img/mainbn3.jpg" width="1000" height="400">
				</div>
			</div>


			<div>
					<h2 style="margin:30px">${dvo.dept_name }<h2>
					<span style="display:block; position:absolute; right:20px; top:550px;"><a href="/Emp/introStaff" style="text-decoration: none" role="button">진료과 전체</a></span>
				
			</div>			
			
			

			<div>

				<ul class="clearFix">
					<li class="current"><a
						href="/Emp/DmoM?dept_num=${dvo.dept_num }">진료과 소개</a></li>
					<li><a href="/Emp/Introduce?dept_num=${dvo.dept_num }">의료진
							소개</a></li>
					<li><a href="/Emp/Location?dept_num=${dvo.dept_num }">진료과
							위치</a></li>
				</ul>

			</div>
	
			<br>
			<br>
			<br>
			
			
			<div>
				<img src="${src}" width="1000" height="600">
			</div>
			
		</section>
		
	</div>

	<footer></footer>

</body>
</html>
