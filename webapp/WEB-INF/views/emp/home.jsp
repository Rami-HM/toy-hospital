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
            .top_div {
               border:5px ridge #ccc;
               width:100%;
               
            }
            .bottom_div {
               border:5px ridge #ccc;
               width:100%; height:255px; 
            }
            .inner_div {
               border:4px inset #ccc; 
               margin:10px; height:185px;
               overflow-x: hidden;
              overflow-y: auto;
            }
            .time_table {
               border-collapse:collapse;
               border:6px inset #ccc;
            } 
            .time_table tr:nth-child(1) {
                  border:1px solid black;
            }
            .time_table tr, .time_table td {
               border:1px solid #ccc;
            }
            .res_table tr, .res_table td {
               border:1px solid #ccc;
            }
            .res_table{
                border-collapse:collapse;
                border:1px solid black;
                width:99%;
                margin:5px;
                text-align:center;
            }
            .tr:hover {
            	background-color:#ccc;
            }
        </style>
        
        <script src="https://code.jquery.com/jquery.min.js"></script>
        <script>
           $(function() {
              var dataCount = $(".data_count").val(); // 조회된 자료수
              
              for(var i=0; i<dataCount; i++) {
                 var dDate = $(".date").eq(i).text();  // 자료 안 날짜
                 var hour = $(".time").eq(i).text().substring(0,2); // 자료 안 시간(시) 
                 var pName = $(".pat_name").eq(i).text();
                 
                   for(var k=0; k<7; k++) {
                    var c = $(".d").eq(k).children();
                    var d = c[0].innerText; // 첫 열의 날짜
                    
                       if(dDate == d) { 
                          for(var j=1; j<10; j++) {
                             if((j+8) == hour) {
                                c[j].style.backgroundColor="#7FBBF3";
                                c[j].style.fontWeight="bold";
                                c[j].innerText = pName;
                          }
                       }
                    }
                 }
              } // for end
              
              $(".tr").click(function() {
                 var pat_id = $(this).children()[5].innerText;
                 var dDate = $(this).children()[1].innerText;
                 var hour = $(this).children()[2].innerText;
                 
                 location.href="/emp/reservation/view?id=" + pat_id + "&res_date=" + dDate + "&res_time=" + hour;
              });
           });
        </script>
    </head>
    <body>
        <div id="container">
            <header>
                <a href="/"><img src="/img/hlogo.png" width="250"></a>
            </header>
             <nav>
               <script type="text/javascript" src="/js/menulist.js" ></script>
               <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav>
            <section>
                <div class="top_div" >
                   <h3 style="padding:10px">주간 예약 현황</h3>
                   <table class="time_table" cellpadding=0 cellspacing=0 style="width:98%; height:200px; margin:10px; text-align:center">
                      <tr>
                         <td style="width:100px"></td>
                         <td style="width:100px">09</td>
                         <td style="width:100px">10</td>
                         <td style="width:100px">11</td>
                         <td style="width:100px">12</td>
                         <td style="width:100px">13</td>
                         <td style="width:100px">14</td>
                         <td style="width:100px">15</td>
                         <td style="width:100px">16</td>
                         <td style="width:100px">17</td>
                      </tr>
                      <tr class="d">
                         <td style="width:100px">${ date }</td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                      </tr>
                      <tr class="d">
                         <td style="width:100px" class="d1">${ date1 }</td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                      </tr>
                      <tr class="d">
                         <td style="width:100px" class="d2">${ date2 }</td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                      </tr>
                      <tr class="d">
                         <td style="width:100px" class="d3">${ date3 }</td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                      </tr>
                      <tr class="d">
                         <td style="width:100px" class="d4">${ date4 }</td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                      </tr>
                      <tr class="d">
                         <td style="width:100px" class="d5">${ date5 }</td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                      </tr>
                      <tr class="d">
                         <td style="width:100px" class="d6">${ date6 }</td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                         <td style="width:100px"></td>
                      </tr>
                   </table>
                </div>
                
                <br/>
                <br/>
                
                <div class="bottom_div" >
                
                   <input type="hidden" value="${rList.size()}" class="data_count"/> <!-- 예약현황 자료수 -->
                   
                   <div style="border:1px solid black; margin:10px; height:185px; display:none">
                      <table>
                         <c:forEach var="rList" items="${ rList }">
                         <tr>
                            <td style="width:30px; height:30px;">${ rList.res_num }</td>
                            <td style="width:100px; height:30px;" class="date" >${ rList.res_date }</td>
                            <td style="width:80px; height:30px;" class="time">${ rList.res_time }</td>
                            <td style="width:690px; height:30px;">${ rList.diagnose }</td>
                            <td style="width:100px; height:30px;" class="pat_name">${ rList.pat_name }</td>
                         </tr>
                         </c:forEach>
                      </table>
                   </div>
                   
                   <h3 style="padding:10px">금일 예약 현황</h3>
                   <div class="inner_div" >
                      <table class="res_table" >
                         <tr>
                            <td style="width:30px; height:30px;"></td>
                            <td style="width:100px; height:30px;" class="date" >예약일</td>
                            <td style="width:80px; height:30px;" class="time">예약시간</td>
                            <td style="width:690px; height:30px;">증상</td>
                            <td style="width:100px; height:30px;" class="pat_name">환자명</td>
                            <td style="width:100px; height:30px; display:none" class="pat_id"></td>
                         </tr>
                         <c:forEach var="rListToday" items="${ rListToday }">
                         <tr class="tr">
                            <td style="width:30px; height:30px;">${ rListToday.res_num }</td>
                            <td style="width:100px; height:30px;" class="date" >${ rListToday.res_date }</td>
                            <td style="width:80px; height:30px;" class="time">${ rListToday.res_time }</td>
                            <td style="width:690px; height:30px;">${ rListToday.diagnose }</td>
                            <td style="width:100px; height:30px;" class="pat_name">${ rListToday.pat_name }</td>
                            <td style="width:100px; height:30px; display:none" class="pat_id">${ rListToday.pat_id }</td>
                         </tr>
                         </c:forEach>
                      </table>
                   </div>
                </div>
            </section>
            <footer></footer>
        </div>
    </body>
</html>