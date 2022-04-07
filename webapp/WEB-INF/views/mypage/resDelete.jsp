<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
   
        <link rel="stylesheet" href="/css/menuBar.css/" />
        <link rel="stylesheet" href="/css/regDelete.css/" />
        <link rel="stylesheet" href="/css/homePage.css/">
        <style type="text/css">
        	.link
        	{
        		color: white;
        	}
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
            <section>
                <div class="main">
                    <div class="hellopat">
                        <h2> ${rv.pat_id}님의 마이페이지 입니다. </h2>
                    </div>
                    <div class="reslist">
                        <h3>최근 예약 삭제하기</h3>
                        <form action="/" method="GET">
                        <table border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>예약 날짜 </td>
                                <td><input type="text" value="${rv.res_date}" size="60"></td>
                            </tr>
                            <tr>
                                <td>예약 시간 </td>
                                <td><input type="text" value="${rv.res_time}" size="60"> </td>
                            </tr>
                            <tr>
                                <td>진료과 </td>
                                <td><input type="text" value="${rv.dept_name}" size="60"> </td>
                            </tr>
                            <tr>
                                <td>의사 이름 </td>
                                <td><input type="text" value="${rv.emp_name}" size="60"> </td>
                            </tr>
                        </table>
                        <input type="submit" value="제출" id="btn">
                        </form>
                    </div>
                <ul>
                    <li>
                        <div class="reserv">
                            <h2>지난 예약기록 </h2>
                            <p>지난 예약 기록을 <br>
                            보실 수 있습니다.</p>
                            <button style="border:2px solid white; width:100px; height:40px; background:none;"><a href="employee.html">바로가기</a></button>
                        </div>    
                    </li>
                    <li>
                        <div class="center">
                            <h2>진료과/센터</h2>
                            <p>병원의 진료과/센터를 <br>
                            상세히 확인할 수 있습니다.</p>
                            <button style="border:2px solid white; width:100px; height:40px; background:none;">
                            <a href="/Emp/introStaff" style="color:black">바로가기</a></button>
                        </div>    
                    </li>
                    <li>
                        <div class="info">
                            <h2>진료안내</h2>
                            <p>대표전화 1588-5700 <br>
                            암환자 상담 02-2072-0707</p>
                            <button style="border:2px solid white; width:100px; height:40px; background:none;">
                            <a href="/Center/home" class="link">바로가기</a></button>
                        </div>    
                    </li>
                    <li>
                        <div class="dddd">
                            <h2>의료진 찾기</h2>
                            <p>대표전화 1588-5700 <br>
                            암환자 상담 02-2072-0707</p>
                            <button style="border:2px solid #5E5D56; width:100px; height:40px; background:none;">
 							<a href="/Emp/finalSearch" class="link">바로가기</a></button>
                        </div>    
                    </li>
                </ul>
                </div><!—main—>
                
                
            </section>
            
            <footer></footer>
        </div>
    </body>
</html>