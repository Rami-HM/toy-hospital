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
        	.category { 
        		float:left;
        		width : 300px;
        		height: 500px;
        		margin : 0 10px;
        		display: inline-block;
        		text-align: center;
        		padding-top: 30px;
        	}
        	
        	.logo{
        		width : 250px;
        		height: 250px;
        		margin: 0 auto;
        		text-align: center;
        	}
        	
        	.logo img{
        		width:150px;
        		height: 150px;
        	}
        	
        	.cont
        	{
        		font-size : 30px;
        		color : gray;
        	}
        	
        	.cont2
        	{
        		font-size : 20px;
        		color : #0080FF;
        		font-weight: bold;
        		padding-top: 10px;
        		display: inline-block;
        	}
        	#title
        	{
        		font-size:15px;
        		color : #BBC1D3;
        	}
        	
        	#chatting
        	{
        		border : 1px solid #BBC1D3;
        		color:#0080FF;
        		padding: 5px 20px;
        		background-color: white;
        	}

        </style>
                <style>
           @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
            *{margin:0; padding:0;}
            body{font-family: 'Nanum Gothic', sans-serif;}
            #container{margin:0 auto;
                       width:1000px;
                       position:relative;}
            header{width:100%;
                   height:60px;
                   margin:0 auto;}
            header img{position:absolute; left:50%; 
                       margin-left:-120px;
                       margin-top:15px;}
            a{text-decoration:none;}
            ul{list-style:none;
            	margin-bottom: 10px;}
          
            section{margin-top:30px;}
            
            
            
            tr, td{border:1px solid blue;}
            .tr:hover { background-color:#E6E6E6; }
    
            footer{}
        </style>
        <style type="text/css">
        
        
        </style>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script type="text/javascript" src ="/js/homePage.js"></script>
		
		<script type="text/javascript">
			$(function() {
				$("#chatting").on('click',function(e){
					$.ajax({
						url : "/echo",
						success : function(data){
							alert("실시간 1:1 채팅상담에 접속하셧습니다");
							console.log(data);
							$("#chattingRoom").html(data);
						},
						error : function(xhr)
						{
							alert("실시간 1:1 채팅상담에 접속에 실패하였습니다");	
						}
					});
					
				});
			});
			
		</script>
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
            <div style ="width: 95%; height:3px; background-color: #BBC1D3;">
            </div>
            	<span id = "title">---고객센터---</span>
				<div>
					<div class = "category">
						<div class = "logo">
							<img alt="" src="/img/callcenter.png"><br>
							<span class = "cont">음성 문의</span>
							<br><span class = "cont2">1588-1234</span>
						</div>
						
						<br />
						<hr />
						<hr />
						<br />
						<br />
						
						평일 AM 09 : 00 ~ PM 06 : 00  <br /><br />
						대표 전화 : 1588-5700		<br />
						알현자 상담 : 02-2072-070	<br />
										
					</div >
					<div class = "category" id = "chattingRoom">
						<div class = "logo">
							<img alt="" src="/img/chat.png">
							<br><span class = "cont">실시간 채팅 문의</span>
							<br><span class = "cont2">
								<button id = "chatting">채팅 시작하기</button>
							</span>
						</div>
					
						<br />
						<hr />
						<hr />
						<br />
						<br />
						
						평일 AM 09 : 00 ~ PM 06 : 00  <br /><br />
						사용자가 많아 <br /> 이용에 불편함이 있을 수 있습니다.
					
					</div>
					<div class = "category">
						<div align = "center" class = "logo">
							<img alt="" src="/img/email.png">
							<br><span class = "cont">이메일 문의</span>
							<br><span class = "cont2">pknuhospital@google.com </span>
						</div>
						
						<br />
						<hr />
						<hr />
						<br />
						<br />
						
						pknuhospital@google.com <br />
						submit@naver.com<br />
						
						<br />
						담당자 : 최연지 
					</div>
				
				</div>
            </section>
            
            <footer></footer>
        </div>
    </body>
</html>