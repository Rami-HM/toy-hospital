<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>부경대학교병원</title>
        <link rel="stylesheet" href="/css/homePage.css" type="text/css">
		<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
		
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script type="text/javascript" src ="/js/homePage.js"></script>

    </head>
    <body>
        <div id="container">
            <header>
                <a href="/"><img src="/img/hlogo.png" width="240" /></a>
            </header>
            <nav>
               <script type="text/javascript" src="/js/menulist.js" ></script>
               <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav>
            <section>
            <br />
            <br />
            <br />
				<div>
					<h1>빈 페이지 입니다.</h1>
					<p>페이지 디자인 후 사용해 주세요.</p>
				</div>
            </section>
            <footer></footer>
        </div>
    </body>
</html>