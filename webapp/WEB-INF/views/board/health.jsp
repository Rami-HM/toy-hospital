<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>부경대학교병원</title>
        <link rel="stylesheet" href="/css/menuBar.css" type="text/css">
        <link rel="stylesheet" href="/css/homePage.css" type="text/css">

		<style>
			#content
			{
				width : 1000px;
				height: 810px;
				margin : 20px auto;
			}
			iframe
			{
				border: none;
				display: block;
				width:100%;
				height: 100%;
			}
		
		
		</style>
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
            	<div style="text-align:center; margin:30px;">
            	<h1><%
				 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MM");
				 String today = formatter.format(new java.util.Date());
				 out.println(today);%>월 의 건강 소식
				 </h1>
            	</div>
				<div id = "content">
				<iframe src='https://blog.naver.com/lawnc1/221528382154'></iframe>
				
				
				
				
				
				
				
				</div>
            </section>
            
            <footer></footer>
        </div>
    </body>
</html>