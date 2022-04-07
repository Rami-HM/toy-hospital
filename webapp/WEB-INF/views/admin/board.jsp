<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>부경대학교병원: 게시판관리</title>
        <link rel="stylesheet" href="/css/menuBar.css"> 
        <link rel="stylesheet" href="/css/adminBoard.css"> 
        <style type="text/css">
        	.sublist{
        		margin: 5px;
        		padding: 10px;
        		background-color: #018ace;
        		border : none;
        		color : white;
        		width: 150px;
        		height: 60px;
        		
        		font-size: 20px;
        	}
        
        </style>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript">
        	$(function() {
        		$('#SUBMENU04').click(function() {
        			location.href = "/PDS/List?sub_id=SUBMENU04"; 
        		});	
        		$('#SUBMENU05').click(function() {
        			location.href = "/PDS/List?sub_id=SUBMENU05"; 
        		});	
        	}); 
        	
        
        </script>
        
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
                <div id = 'sublistdiv' style = "text-align:center;">
                <h1 style="background-color: #E0E6F8; padding :10px;">게시판 관리</h1>
                <p style ="font-size:15px; color:gray;">---원하시는 게시판을 선택해주세요.---</p>
				<br />                
				<br />                
				<br />                
                <c:forEach var = "sublist" items="${subList}">               
	                <input type="button" value = "${sublist.sub_name}" class = 'sublist' id = '${sublist.sub_id}'/>             
                </c:forEach>
                </div>
            </section>
            <footer></footer>
        </div>
    </body>
</html>