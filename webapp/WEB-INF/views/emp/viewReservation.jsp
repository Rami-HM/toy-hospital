<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" href="/css/menuBar.css" type="text/css">
        <link rel="stylesheet" href="/css/homePage.css" type="text/css">
        <style>
            
            .patientT {
            	margin:10px; 
            	border-top:2px solid #6E6E6E;
            	border-collapse:collapse;
            }
            .patientT th, .patientT td {
   				border-bottom:2px solid #6E6E6E;
    			padding: 10px;
  			}
  			.patientT th {
  				border-right:2px solid #BDBDBD;
  			}
  			
            .empT {
            	margin:10px; 
            	border-top:2px solid #6E6E6E;
            	border-collapse:collapse;
            }
            .empT th, .empT td {
   				border-bottom:2px solid #6E6E6E;
    			padding: 10px;
  			}
  			.empT th {
  				border-right:2px solid #BDBDBD;
  			}
            
            .trtTable {
            	margin:10px;
            	width:970px;
            	text-align:center;
            }
            .tList:hover {
            	background-color:#E6E6E6;
            }
            .btnWrite, .btnBack {
            	margin-top:20px;
            	margin-bottom:20px;
            	width:100px;
            	background-color:gray;
            	color:white;
            	font-size:15px;
            	padding:3px;
            }
            .btnWrite {
            	margin-left:350px;
            }
            .btnBack {
            	margin-left:100px;
            }

            
            footer{}
        </style>
        
        <script src="https://code.jquery.com/jquery.min.js"></script>
        <script>
        	$(function() {
        		// 진단서 작성페이지로 이동
	              $(".btnWrite").click(function() {
	                 var id = $(".val1").val();
	                 var res_num = $(".val2").val();
	                 var emp_id = $(".val3").val();
	                 
	                 var url = "/emp/reservation/view/treatment/write?id=" + id + "&emp_id=" + emp_id + "&res_num=" + res_num;
	               window.open(url,
	                  "viewTreatment", "width=700, height=600, resizable=no, scrollbars=no, top=100, left=400");
	              });
        		
        		// 이전으로
        		$(".btnBack").click(function() {
        			location.href="/emp/home";
        		});
        		
        		
        		// 진료기록 클릭
        		$(".tList").click(function() {
        			$(this).children().eq(4).children().eq(0).attr("class", "pat_name");
        			$(this).children().eq(4).children().eq(1).attr("class", "pat_tel");
        			$(this).children().eq(4).children().eq(2).attr("class", "pat_address");
        			$(this).children().eq(4).children().eq(3).attr("class", "pat_email");
        			$(this).children().eq(4).children().eq(4).attr("class", "pat_gender");
        			$(this).children().eq(4).children().eq(5).attr("class", "trt_date");
        			$(this).children().eq(4).children().eq(6).attr("class", "emp_conts");
        			$(this).children().eq(4).children().eq(7).attr("class", "emp_name");
        			$(this).children().eq(4).children().eq(8).attr("class", "dept_name");
        			
	        			var url = "/emp/reservation/view/treatment";
						window.open(url,
							"viewTreatment", "width=700, height=600, resizable=no, scrollbars=no, top=100, left=400");        	
        		});
        	});
        </script>
    </head>
    <body>
    	<!-- 진단서 작성페이지로 넘어갈때 가져갈 정보 -->
          <input type="hidden" class="val1" value="${ patient.pat_id }"/>
          <input type="hidden" class="val2" value="${ reservation.res_num }"/>
          <input type="hidden" class="val3" value="${ reservation.emp_id }"/>
       	
        <div id="container">
            <header>
                <a href="/"><img src="/img/hlogo.png" width="250"></a>
            </header>
           <nav>
               <script type="text/javascript" src="/js/menulist.js" ></script>
               <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav>
            <section>
                <div style="border:1px solid black; width:100%; height:100%">
                	<!-- 환자 정보 테이블 -->
                	<h3 style="margin:10px">&nbsp;&nbsp;예약 신청자정보</h3>
                	<table cellpadding=0 cellspacing=0 class="patientT">
                		<tr>
                			<th style="width:200px">환자명</th>
                			<td style="width:800px">${ patient.pat_name }</td>
                		</tr>
                		<tr>
                			<th style="width:200px">예약날짜</th>
                			<td style="width:800px">${ res_date }</td>
                		</tr>
                		<tr>
                			<th style="width:200px">예약시간</th>
                			<td style="width:800px">${ res_time }</td>
                		</tr>
                		<tr>
                			<th style="width:200px">연락처</th>
                			<td style="width:800px">${ patient.pat_tel }</td>
                		</tr>
                		<tr>
                			<th style="width:200px">주소</th>
                			<td style="width:800px">${ patient.pat_address }</td>
                		</tr>
                	</table>
                	
                	<br/>
                
                	
                	<!-- 진료의료진 정보 테이블 -->
                	<h3 style="margin:10px">&nbsp;&nbsp;진료진</h3>
                	<table cellpadding=0 cellspacing=0 class="empT">
                		<tr>
                			<th style="width:200px">의사명</th>
                			<td style="width:800px">${ employee.emp_name }</td>
                		</tr>
                		<tr>
                			<th style="width:200px">부서</th>
                			<td style="width:800px">${ employee.dept_name }</td>
                		</tr>
                	</table>
                	
                	<br/>
                
                	
                	<!-- 진단정보 -->
                	<h3 style="margin:10px">&nbsp;&nbsp;증상</h3>
                	<table cellpadding=0 cellspacing=0 class="empT">
                		<tr>
                			<th style="width:200px; height:80px">환자 증상</th>
                			<td style="width:800px; height:80px">${ reservation.diagnose }</td>
                		</tr>
                	</table>
                	
                	<br/>
                
                	
                	<!-- 환자 이전진료기록목록 -->
                	<h3 style="margin:10px">&nbsp;&nbsp;진료기록 목록</h3>
                	<div style="border:1px solid black; margin:5px">
	                	<table border="1" cellpadding="0" cellspacing="0" class="trtTable">
	                		<tr style="height:27px">
	                			<td style="width:120px">날짜</td>
	                			<td style="width:100px">환자이름</td>
	                			<td style="width:570px">진단 내용</td>
	                			<td style="width:100px">담당 의사</td>
	                			<td style="width:100px">부서명</td>
	                		</tr>
	                		<c:forEach var="treatment" items="${ treatments }">
		                		<tr style="height:27px" class="tList">
		                			<td style="width:120px">${ treatment.trt_date }</td>
		                			<td style="width:100px">${ treatment.pat_name }</td>
		                			<td style="width:570px">${ treatment.emp_conts }</td>
		                			<td style="width:100px">${ treatment.emp_name }</td>
		                			<td style="width:100px">${ treatment.dept_name }
		                				
		                				<input type="hidden" class="" value="${ treatment.pat_name}"/>
	       								<input type="hidden" class="" value="${ treatment.pat_tel}"/>
								       	<input type="hidden" class="" value="${ treatment.pat_address}"/>
								       	<input type="hidden" class="" value="${ treatment.pat_email}"/>
								       	<input type="hidden" class="" value="${ treatment.pat_gender}"/>
								       	<input type="hidden" class="" value="${ treatment.trt_date}"/>
								       	<input type="hidden" class="" value="${ treatment.emp_conts}"/>
								       	<input type="hidden" class="" value="${ treatment.emp_name}"/>
								       	<input type="hidden" class="" value="${ treatment.dept_name}"/>
								       	
		                			</td>
		                		</tr>
	                		</c:forEach>
	                	</table>
						
	                	
	                </div>
	                
	                <input type="button" value="진단서 작성" class="btnWrite" />	
	                <input type="button" value="이전으로" class="btnBack" />	
                </div>	
            </section>
            <footer></footer>
        </div>
    </body>
</html>