<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>부경대학교병원</title>
		<style type="text/css">
			.video-container { margin: 0;padding-bottom: 75%; max-width: 100%; height: 0; position: relative;overflow: hidden;} 
			.video-container iframe, 
			.video-container object, 
			.video-container embed { margin: 0;padding: 0; width: 100%; height: 95%;position: absolute; top: 0;left: 0; }
		</style>
        <link rel="stylesheet" href="/css/menuBar.css" type="text/css">
        <link rel="stylesheet" href="/css/homePage.css" type="text/css">

		<style>
			#content
			{
				width : 600px;
				height: 800px;
				margin : 20px auto;
			}
			video
			{
				width : 90%;
				height: 100%;
				margin : 20px auto;
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
					이달의 건강 정보
            	</div>
				<div id = "content">
				<div class="video-container">
		  			<iframe width="984" height="554" src="https://www.youtube.com/embed/LBrrGaW5pbE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		  		</div>
				<div class="video-container">
		  			<iframe width="984" height="554" src="https://www.youtube.com/embed/lwaldeauBvk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		  			</div>
				</div>
            </section>
            
            <footer></footer>
        </div>
    </body>
</html>