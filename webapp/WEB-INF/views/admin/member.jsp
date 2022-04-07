<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>부경대학교병원: 회원 관리</title>
        <style>
        	.selectable .ui-selected
        	{
        		background : #018ace;
        		color: white;
        	}
        	th{
        		width:auto;
        	}
        </style>
        <link rel="stylesheet" href="/css/menuBar.css"/>
        <link rel="stylesheet" href="/css/adminhomePage.css"/>
        <link rel="stylesheet" href="/css/adminBoard.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src = "/js/adminmember.js"></script>
        <script type="text/javascript" src ="/js/homePage.js"></script>
        
    </head>
    <body>
        <div id="container">
            <header>
                <a href="/"><img src="/img/hlogo.png" width="250"></a>
            </header>
            <nav align ="center">
            	<script type="text/javascript" src="/js/menulist.js" ></script>
                <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav>
        
            <section>
            <br />
            <br />
            <br />
            <br />
       			<table class = "selectable">
       			<caption><h1>회원 목록</h1></caption>
       				<tr class="first">
       					<th>회원 아이디</th>
       					<th class="name">회원 이름</th>
       					<th>회원 주민등록 번호</th>
       					<th>회원 성별</th>
       					<th>회원 전화번호</th>
       					<th>회원 이메일</th>
       					<th>회원 주소</th>
       				</tr>
       				
       				<c:forEach var = "pat" items ="${patientList}">
       					<tr class = "info">
       						<td class = "pat_id">${pat.pat_id}</td>
       						<td>${pat.pat_name}</td>
       						<td>

     						<c:set var = "ssn" value = "${pat.pat_ssn}"/>
       							${fn:substring(ssn,0,6)}-
       							${fn:substring(ssn,6,7)}
       							****** 
       							
       						</td>
       						<td>${pat.pat_gender}</td>
       						<td>${pat.pat_tel}</td>
       						<td>${pat.pat_email}</td>
       						<td>${pat.pat_address}</td>
       					</tr>
       				</c:forEach>
       				<tr>
       					<td colspan="8" style = "text-align : right">
       					</td>
       				</tr>
       			</table>     
       			<br/><br/>
       			<table class = "selectable">
       			<caption><h1>의료진 목록</h1></caption><br/>
       				<tr class="second">
       					<th>의료진 아이디</th>
       					<th>의료진 이름</th>
       					<th>의료진 직급</th>
       					<th>의료진 부서</th>
       				</tr>
       				
       				<c:forEach var = "emp" items ="${empList}">
       					<tr class = "info">
       						<td class = "emp_id">${emp.emp_id}</td>
       						<td class="name">${emp.emp_name}</td>
       						<td>${emp.emp_position}</td>
       						<td>${emp.dept_num}</td>
       					</tr>
       				</c:forEach>
       			</table>        
       			<div class="fixed">
       			<!— /Admin/Member/Delete —>		
       			<form action = "/Admin/Member/Delete" method="POST">
	       			<input type="hidden" name = "pat_ids" />
	       			<input type="hidden" name = "emp_ids" />
	       				
	       			<div>삭제 하실 회원을 클릭해주세요.</div><br/>
	       			<div>여러명 선택시 (Ctrl+클릭) 또는 드래그</div>
	       			<button id = "deletebtn">삭제</button>
       			</form> 
       			</div>
            </section>
            <footer></footer>
        </div>
    </body>
</html>