<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기 페이지 입니다.</title>
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/updatePage.css" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src ="/js/updatePage.js"></script>
</head>
<body>
	<div id="container"> 
            <header>
                <a href="/"><img src="/img/hlogo.png" width="240"></a>
            </header>
            <nav>
	                <script type="text/javascript" src="/js/menulist.js" ></script>
	                <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav><!--nav-->
            <h1>온라인 예약</h1>
    <form method="POST" action= "/Reserv/Update" id="form" >
    	<input type="hidden" value="${rv.res_num }" name="res_num"/>
        <table cellpadding="0" cellspacing="0" >
            <tr>
                <td>예약날짜 </td>
                <td><input type="text" size="80" value="${rv.res_date}" name="res_date" id="res_date" readonly /></td> 
            </tr>
            <tr>
                <td>예약시간 </td>
                <td><input type="text" size="80" value="${rv.res_time}" name="res_time" id="res_time" readonly /></td>
            </tr>
            <tr>
                <td>의료진 이름 </td>
                <td><input type="text" size="80" value="${empVo.emp_name}" name="emp_name" id="emp_name" readonly /></td>
            </tr>
            <tr>
                <td>회원 아이디 </td>
                <td><input type="text" size="80" value="${login.id}" name="pat_id" id="pat_id" readonly /></td>
            </tr>
            <tr>
                <td>증상 </td>
                <td><input type="text" size="80" name="diagnose" id="diagnose"></td>
            </tr>
            <tr>
                <td colspan="2">
            		<input type="submit" value="제출" id="btn"/>
            	</td>	
            </tr>
        </table>

    </form>
    </div>
</body>
</html>