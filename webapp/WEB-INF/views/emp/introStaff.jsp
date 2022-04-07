<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/css/homePage.css/" />
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<style>
* {
	vertical-align: baseline;
	margin: 0;
	padding: 0;
	border-radius: 0;
	-webkit-font-smoothing: antialiased;
	-ms-text-size-adjust: none;
	text-size-adjust: none;
	list-style: none;
	-webkit-tap-highlight-color: transparent;
}

div {
	display: block;
}

.medicalTeamList {
	width: 1000px;
	margin-top: 30px;
	padding-top: 30px;
	text-align: center;
}

.clearFix:after, .clearFix:before, .clearFix>.a, .clearFix>.b {
	content: '';
	display: table;
}

.medicalTeamList .treatLink {
	overflow: hidden;
	position: absolute;
	top: -1px;
	left: -1px;
	width: 152px;
	min-height: 63px;
	padding: 8px 19px 9px;
	background-color: #2763ba;
	opacity: 0;
}

.medicalTeamList .treatItemWrap {
	float: left;
	position: relative;
	width: 180px;
	height: 80px;
	margin: 0 13px 13px 0;
	border: 1px solid #2763ba;
	color: #2763ba;
	font-weight: 400;
	text-align: center;
	line-height: 78px;
}

a {
	color: white;
	text-decoration: none;
}

#btn1 {
	background-color: #2763ba;
	width: 100px;
	height: 50px;
	border: none;
	color: white;
}

#btn2 {
	background-color: #2763ba;
	width: 100px;
	height: 50px;
	border: none;
	color: white;
}
.treatLink > a {
	display:inline-block;
	width:100%;
}
</style>
<script type="text/javascript" src="/js/homePage.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   $(window).ready(
         function() {
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
            
             $('.treatItemWrap').hover(function () {

                     $(this).attr('style', "z-index: 1");

                  },
                     function () {
                        $(this).attr('style', "z-index: 0");
                     })

                  $('.treatLink').hover(function () {

                     $(this).attr('style', "z-index: 1; opacity: 1; height: auto;  min-height: 156px;");
                  },

                     function () {
                        $(this).attr('style', "z-index: 0; opacity: 0; height: 0p;  min-height: 0px;");
                     })
         
            $('#btn1').click(function() {
               var dept_name = $('#check').val();
               $('#value').attr('action',"/Emp/introStaff?dept_name="+ dept_name);
               $('#value').submit();});

            $("#btn2").click(function() {
               $('#value').attr('action', "/Emp/introStaff");
               $('#value').submit();
            })
                  

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
		<section>
			<div id="imgslide" class="all">
				<div class="mainbn" style="height: 200px">
					<img src="/img/mainbn2.png" width="1000" height="200">
					<img src="/img/mainbn.jpg" width="1000" height="200">
					<img src="/img/mainbn3.jpg" width="1000" height="200">
				</div>
			</div>
			<div style="text-align: left">
				<br />
				<input type="radio" name="chk_info" value="basic" checked="checked">기본 
				<input type="radio" name="chk_info" value="spell">가나다순
			</div>
			<div style="text-align: right">
				<form method="post" action="" id="value">
					<input type="text" size="28" name="emp_name" id="check" placeholder="진료과를 입력해주세요" style="line-height: 40px; margin-bottom: 16px; margin-top: 10px; text-align: right">
					<button id="btn1" style="line-height: 40px; margin-bottom: 16px; margin-top: 10px;">검색</button>
					<button id="btn2" style="line-height: 40px; margin-bottom: 16px; margin-top: 10px;">초기화</button>
				</form>
			</div>
			<hr>
			<div>
				<h1 style="text-align: center">${result }</h1>
				<h2 style="text-align: center">${result2 }</h2>
			</div>
			<div id="basic">
				<div class="medicalTeamList clearFix" style="width: 100%; height: 20%; text-align: center;">
					<c:forEach var="doctorList" items="${doctorList}">
						<div class="treatItemWrap">
							<span>${doctorList.dept_name }</span>
							<div class="treatLink">
								<a href="/Emp/DmoM?dept_num=${doctorList.dept_num }">${doctorList.dept_name }</a>
								<hr>
								<a href="/Emp/Introduce?dept_num=${doctorList.dept_num }">의료진</a> <a href="/Emp/Location?dept_num=${doctorList.dept_num }">위치</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="spell" style="display: none">
				<div class="medicalTeamList clearFix">
					<c:forEach var="doctorList" items="${doctorList2}">
						<div class="treatItemWrap">
							<span>${doctorList.dept_name }</span>
							<div class="treatLink">
								<a href="/Emp/DmoM?dept_num=${doctorList.dept_num }">${doctorList.dept_name }</a>
								<hr>
								<a href="/Emp/Introduce?dept_num=${doctorList.dept_num }">의료진</a> <a href="/Emp/Location?dept_num=${doctorList.dept_num }">위치</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="insert" style="display: inline">
				<div class="medicalTeamList clearFix">
					<c:forEach var="doctorList" items="${doctorList3}">
						<div class="treatItemWrap">
							<span>${doctorList.dept_name }</span>
							<div class="treatLink">
								<a href="/Emp/DmoM?dept_num=${doctorList.dept_num }">${doctorList.dept_name }</a>
								<hr>
								<a href="/Emp/Introduce?dept_num=${doctorList.dept_num }">의료진</a> <a href="/Emp/Location?dept_num=${doctorList.dept_num }">위치</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<footer></footer>
	</div>
</body>
</html>