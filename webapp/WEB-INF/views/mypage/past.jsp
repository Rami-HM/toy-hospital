<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <!-- <link rel="stylesheet" href="/css/common.css/" /> -->
        <link rel="stylesheet" href="/css/past.css/" />
        <link rel="stylesheet" href="/css/menuBar.css" type="text/css">
        <link rel="stylesheet" href="/css/homePage.css" type="text/css">
         <style>
			.link
			{
				color:white;
			}
        </style>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script type="text/javascript" src ="/js/homePage.js"></script>
		
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src ="/js/menulist.js"></script>
    </head>
    <body>
        <div id="container">
            <header>
                <a href="/"><img src="/img/hlogo.png" width="240"></a>
            </header>
           <nav>
               <script type="text/javascript" src="/js/menulist.js" ></script>
               <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav>
        <section>
                <div class="main">
                    <div class="hellopat">
                        <h2> ${rv.pat_name} 님의 마이페이지 입니다. </h2>
                    </div>
                    <div class="reslist">
                        <h3>지난 예약 기록</h3> <!-- 지난예약은 표시되지 않음 -->
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>예약 날짜 &nbsp; |</td> 
                                <td>예약 시간 &nbsp; |</td>
                                <td>진료과    &nbsp; |</td>
                                <td>의사 이름 &nbsp; |</td>
                                <td>예약 삭제 &nbsp; |</td>
                            </tr>
                            <c:forEach var="res" items="${resVo}"> 
								<fmt:formatDate value="<%=new java.util.Date()%>" var="now" pattern="yyyy-MM-dd"/>
                            	<c:choose >
                            	<c:when test="${res.res_date < now }" >
		                            <tr>
		                                <td name="res_date" readonly>${res.res_date}</td>
		                                <td name="res_time" readonly>${res.res_time}</td>
		                                <td name="dept_name" readonly>${res.dept_name}</td>
		                                <td name="emp_name" readonly>${res.emp_name}</td>
		                            </tr>
	                            </c:when>
	                            </c:choose>
                            </c:forEach>
                                <!-- ?pat_id=${res.pat_id}&res_date=${res.res_date} -->
                        </table>
                    </div>
                <ul>
                    <li>
                        <div class="reserv">
                            <h2>최근 예약 현황 </h2>
                            <p>최근 예약 현황을 <br>
                            보실 수 있습니다.</p>
                            <button style="border:2px solid white; width:100px; height:40px; background:none;"><a href="/Mypage/List">바로가기</a></button>
                        </div>    
                    </li>
                   <li>
                        <div class="center">
                            <h2>진료과/센터</h2>
                            <p>병원의 진료과/센터를 <br>
                            상세히 확인할 수 있습니다.</p>
                            <button style="border:2px solid white; width:100px; height:40px; background:none;">
                            <a href="/Emp/introStaff" class="link">바로가기</a></button>
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
 							<a href="/Emp/finalSearch" style="color:black">바로가기</a></button>
                        </div>    
                    </li>
                </ul>
                </div><!—main—>
            </section>
            <footer></footer>
        </div>
    </body>
</html>