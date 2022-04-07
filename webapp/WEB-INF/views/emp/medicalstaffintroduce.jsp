<!-- 의료진 소개 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dept_name" value="${ dvo.dept_name}" />
<c:set var="dept_num" value="${ dvo.dept_num}" />
<c:set var="empid" value="${empid}" />
<!-- c:set 한번 더 확인하기 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<style type="text/css">
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
</style>
<style>
table {
	width: 80%;
	height: 800px;
	margin: 0 auto;
	border-collapse: collapse;
}

a {
	color: black;
}

.rev {
	background-color: #2763ba;
	width: 300px;
	padding: 1 10px;
	height: 50px;
	color: white;
	margin: 0 auto;
}

.rev {
	line-height:20px;
}

.empnameFont {
	font-size: 50px;
	font-weight: bold;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>
<script>
          
    
    
    $(function(){
                  	 
            	$('#btn3').click(function() {
            		var dept_name = $('#check').val();
                    $('#value').attr('action',"/Emp/Introduce?dept_num=${dept_num}&dept_name="+dept_name);
                    $('#value').submit();
            	});
            	
            	$('#check').keypress(function (e){
          		  if (e.which == 13){
                       $('#btn3').click();
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
		<section>
			<div class="contTitleWrap">
				<div class="btnWrap">
					<a href="/Emp/introStaff" style="text-decoration: none" class="btnType02 btnSmall" role="button"><h3>진료과 전체</h3></a>
					<h2 style="text-align: center">${dvo.dept_name }</h2>
				</div>
			</div>
			<div>
				<form method="post" action="" id="value">
					<input type="text" size="30" name="emp_name" placeholder="원하시는 선생님을 입력해주세요 " id="check"> <input type="button" value="검색" id="btn3">
				</form>
			</div>
			<hr>
			<!-- -------------------------------------------------------------------------- -->
			<p>${result}</p>
			<p>${result2 }</p>
			<table>
				<c:forEach var="doctor" items="${doctorDetailList}">
					<tr>
						<td height="500" width="400" style="text-align: center"><a href="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}"> <img src="/img/${doctor.emp_img}" alt="${doctor.emp_name }" width="80%" height="70%">
						</a> <br /> <ahref ="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}"> 자세히보기</a></td>
						<td height="200" width="600" style="text-align: center">
							<div class="empnameFont">
								<a href="/Emp/Career?emp_id=${doctor.emp_id}&emp_img=${doctor.emp_img}" role="button">${doctor.emp_name }선생님</a>
							</div> <br /></br>
							<div class="rev">
								<a href="/Res/Reserv" role="button" id="btn" style="color: white; height: 100%; line-height:50px">예약하기</a>
							</div> <br /> 담당:${doctor.dept_name } ${doctor.emp_position }
						</td>
					</tr>
				</c:forEach>
			</table>
		</section>
		<footer></footer>
	</div>
</body>
</html>
