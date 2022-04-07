<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:set var="dept_name" 	value="${ vo.dept_name}" /> 

 <c:set var="dept_desc" 	value="${ vo.dept_desc}" /> 

 <c:set var="empid" 	value="${empid}"/> 
<!-- c:set 한번 더 확인하기 -->

<!DOCTYPE html>
<html>

<head>
<style>


table {
   width  : 500px;
   margin : 0  auto;
   border-collapse : collapse;
}

table, td {
   border : 1px solid black;   
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a, .dropbtn {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: green;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>





<body>
	<ul>
		<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">병원소개</a>
			<div class="dropdown-content">
				<a href="/Emp/doctorView">의료진 소개</a> <a href="#">내부시설</a> <a
					href="#">진료시간</a>
			</div></li>
		<li><a href="#">진료예약</a></li>
		<li><a href="#">고객센터</a></li>
		<li><a href="#">게시판</a></li>
		<li><a href="#">의료진 페이지</a></li>
	</ul>




<!-- ------------------------------------------------------------------------------------------------------- -->

	<div class="contTitleWrap">
		<h3>
			${doctorVo.dept_name}
		</h3>
		
		<div class="btnWrap">
		
			<a href="/Emp/doctorView" class="btnType02 btnSmall" role="button">진료과 전체</a>
		</div>
		
	</div>
	
	
	<div class="tabTypeCol6">
		<ul class="clearFix">
			<li class="current"><a href="/Emp/DetailDoctorView?dept_num=${doctorVo.dept_num }">진료과 소개</a></li>
			<li><a href="/Emp/Introduce?dept_num=${doctorVo.dept_num }">의료진소개</a>
			<li><a href="/Emp/Location?loc=${asdfasd}">진료과 위치</a></li>
		</ul>
	</div>
		
	<div class="editWrap">
		<div class="introduceWrap clearFix">
			<p>서울대학교병원 내과는 대한민국의료계를 이끌어 온 전통과 명예로 세계 최고 수준의 교육, 연구, 진료를 통해 21세기 선진 의료를 선도하기 위해 노력해 오고 있습니다. 
			서울대학교병원의 가장 큰 규모의 임상진료과로 교수 100명, 임상강사 51명, 전공의 88명의 의료진이 소속되어 있습니다.&nbsp;</p>
			<p>16개의 병동, 응급실, 중환자실에서 1일 약 532명의 입원환자를 진료하고 1일 평균 2,942명의 외래 환자를 진료하고 있습니다. 아울러 특수질환에 대한 다양한 교육프로그램과 안내책자들을 개발 활용하여 환자의 이해를 증진시키고 있으며 
			다양한 특수클리닉의 개설, 운영으로 특수질환에 대한 환자들의 진료 욕구를 충족시키고 환자의 아픔과 고통을 함께 나눈다는 생각을 가지고 최선을 다해 진료에 임하고 있습니다.&nbsp;</p>
			<p>또한 기초 및 임상연구를 통한 새로운 의학기술의 개발, 혁신적인 의학교육을 통한 우수한 의료진의 양성을 바탕으로 수준 높은 진료를 지향해 나가고 있습니다.&nbsp;</p>
			<p>구조적으로는 호흡기내과, 순환기내과, 소화기내과, 혈액종양내과, 내분비내과, 알레르기내과, 신장내과, 감염내과, 류마티스내과로 나뉘어 9개의 분과로 구성되어 있고 입원전담전문의 제도를 운영하며 
			서울대학교 의과대학 및 서울대학교병원의 교육, 연구, 진료에서 중추적 역할을 수행하고 있습니다.&nbsp;</p>
			<p><br></p>
		</div>
	</div>

	
	<div>
	<table>
		<caption>
		</caption>
		<tr>
			<td style="width: 200px; height: 30px; text-align: center">${dept_name}</td>
			<td style="width: 500px; height: 30px; text-align: center">${dept_desc }</td>
		</tr>

	</table>


	<table align="center" cellpadding="0" cellspacing="0" style="width:600px; border:1px solid black;">
			

			<tr>
			<td style = "width:200px;height:30px;text-align:center">emp_img</td>
			<td style = "width:100px;height:30px;text-align:center">emp_name</td>
			<td style = "width:100px;height:30px;text-align:center">dept_name</td>
			<td style = "width:100px;height:30px;text-align:center">emp_position</td>
			<td style = "width:100px;height:30px;text-align:center">hst_career</td>
			<!-- 연역 할 예정 -->
			</tr> 

			<c:forEach var="doctor" items="${doctorDetailList}">
				
				<tr>
					<td style="height: 100px; width: 100px; text-align: center">	<img src="/img/${doctor.emp_img}"></td>
					<td style="height: 100px; width: 100px; text-align: center">	${doctor.emp_name }선생님</td>
					<td style="height: 100px; width: 100px; text-align: center">	담당:${doctor.dept_name }</td>
					<td style="height: 100px; width: 100px; text-align: center">	${doctor.emp_position }</td>
					<td style="height: 100px; width: 1500px; text-align: center">
					
			 		<c:forEach var="hlist" items="${historyList}"> 
			 		<p></p>
						<c:if test="${doctor.emp_id eq hlist.emp_id}">  <%--'jong1' --%>
 								${hlist.hst_career}<br/>${hlist.hst_date} 
							</c:if> 
 						</c:forEach> 
 					</td>
 			</c:forEach>
		</table>
		</div>		
<%-- 					<c:forEach var="hlist" items="${historyList}"> --%>
<%-- 						${hlist.hst_career} --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
<!-- 			</td> -->