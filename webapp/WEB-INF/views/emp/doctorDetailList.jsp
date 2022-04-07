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

        <link rel="stylesheet" href="/css/homePage.css" type="text/css">
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
	<header>
        <a href="/"><img src="/img/hlogo.png" width="240" /></a>
   </header>
     <nav>
              <script type="text/javascript" src="/js/menulist.js" ></script>
              <%@include file="/WEB-INF/include/menulist.jspf" %>
     </nav>

	<table>
		<caption>
			<h2>emp/doctorDetailList.jsp</h2>
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
				
<%-- 					<c:forEach var="hlist" items="${historyList}"> --%>
<%-- 						${hlist.hst_career} --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
<!-- 			</td> -->