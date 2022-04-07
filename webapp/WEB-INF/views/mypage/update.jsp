<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" href="/css/updatePage.css/" />
        <link rel="stylesheet" href="/css/myPageHome2.css/" />
        <style>
            tr, td{height:35px;}
            .tr:hover { background-color:#E6E6E6; }
            .link{color:white;}
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src ="/js/homePage.js"></script>
        <script>
        $(window).ready(function(){
        	$('#ssn').hide();
            $(function(){
            	$('.before').on("click",function(){
            		if($("input[type='password']").val() == '')
            			alert('인증이 완료 되어야 수정이 가능합니다.');
            });
           
            	$('.pverify').on("click", function(){
        			event.preventDefault();
        			event.stopPropagation();
        			if($("input[type='password']").val() == ''){
        				alert('인증이 완료 되어야 수정이 가능합니다.');
        				
        			}else if($('#nowpwd').val() == '${rv.pat_pw}'){
        				alert('인증이 완료되었습니다.');
        				$('.before').attr("readonly", false);
        				$('#ssn').show();
        			}else{
        				alert('비밀번호가 틀렸습니다. 다시 입력해 주세요.');
        			}
            	});/* .pverify */
            	$('.reverify').on("click",function(){
            		event.preventDefault();
        			event.stopPropagation();
        			if($('#updatepwd').val() == '${rv.pat_pw}'){
        				alert('최근 사용한 비밀번호와 동일합니다. 다른 비밀번호를 입력해 주세요.');
        			}else if($('#updatepwd').val() == $('#vupdatepwd').val()){
        				alert('비밀번호가 변경되었습니다.');
        			}else{
        				alert('입력한 비밀번호와 일치하지 않습니다. 정확히 입력해 주세요.');
        			}
            	}) /* reverify */
            	// 주소찾기 버튼 클릭
				document.getElementById("btnfindaddress").onclick = function() {
					msg = '';
					document.getElementById('msgAdd1').innerHTML = msg; // 주소 찾기 버튼 클릭시 기존 메시지 초기화
					
					window.name = "regMemberForm";
					
					var url = "/login/regMember/findAddressForm";
					window.open(url,
						"FindAddressFormPage", "width=800, height=500, resizable=no, scrollbars=no, top=150, left=500");
				}
            	$('input[type="submit"]').on("click", function(){
            		alert("회원정보 수정이 성공적으로 완료되었습니다. ");	
    					// 이메일 형식확인 정규식
    					var emailCheck1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*/;
    					var emailCheck2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
    					
    					// 이메일 형식 불일치
    					if(!emailCheck1.test(document.getElementById("first_email").value) ||
    							!emailCheck2.test(document.getElementById("second_email").value)) {
    						msg = '이메일을 확인하여 주세요.';
    						document.getElementById('msgEmail').innerHTML = msg;
    						return false;
    					} else {
    						msg = '';
    						document.getElementById('msgEmail').innerHTML = msg;						
    					}
    				
    					// 연락처 정규식
    					var telCheck1 = /^([0-9]{3,4})$/;
    					var telCheck2 = /^([0-9]{4})$/;
    					
    					// 연락처 형식 확인
    					if(!telCheck1.test(document.getElementById("second_tel").value) ||
    							!telCheck2.test(document.getElementById("third_tel").value)) {
    						msg = '연락처를 확인하여 주세요.';
    						document.getElementById('msgTel').innerHTML = msg;
    						return false;
    					} else {
    						msg = '';
    						document.getElementById('msgTel').innerHTML = msg;
    					}
    										
    					// 주소확인
    					if(document.getElementById("main_address").value.length == 0) {
    						msg = '주소를 입력하여 주세요.';
    						document.getElementById('msgAdd1').innerHTML = msg;
    						return false;
    					} else {
    						msg = '';
    						document.getElementById('msgAdd1').innerHTML = msg;
    					}
    					if(document.getElementById("rest_address").value.length == 0) {
    						msg = '나머지 주소를 입력하여 주세요.'
    							document.getElementById('msgAdd2').innerHTML = msg;
    						return false;
    					} else {
    						msg = '';
    						document.getElementById('msgAdd2').innerHTML = msg;
    					} 
            	}); /* submit */
            	
				// 이메일 처리
				var second_email = document.getElementById('second_email');
				var listEmail    = document.getElementById('listEmail'); 
				if(listEmail.value == '#') {
					second_email.readOnly = true;
				} 
				listEmail.onchange = function() {
					// 이메일 리스트 변경시 기존 메세지 초기화
					msg = '';
					document.getElementById('msgEmail').innerHTML = msg;  
					if(listEmail.value == '#') {
						second_email.value = '';
						second_email.readOnly = true;
					} else if(listEmail.value == 'naver.com') {
						second_email.value = 'naver.com';
						second_email.readOnly = true;
					} else if(listEmail.value == 'daum.net') {
						second_email.value = 'daum.net';
						second_email.readOnly = true;
					} else if(listEmail.value == 'google.com') {
						second_email.value = 'google.com';
						second_email.readOnly = true;
					} else {
						second_email.value = '';
						second_email.readOnly = false;
					}	
				}
				// 이메일 입력 시 기존 메세지 초기화
				document.getElementById("first_email").onkeypress = function() {
					msg = '';
					document.getElementById('msgEmail').innerHTML = msg;
				}
				
				// 연락처 입력 시 기존 메세지 초기화
				document.getElementById("second_tel").onkeypress = function() {
					msg = '';
					document.getElementById('msgTel').innerHTML = msg;
				}
				document.getElementById("third_tel").onkeypress = function() {
					msg = '';
					document.getElementById('msgTel').innerHTML = msg;
				}
			
				// 주소 입력 시 기존 메세지 초기화
				document.getElementById("rest_address").onkeypress = function() {
					msg = '';
					document.getElementById('msgAdd2').innerHTML = msg;
				}
				
            });
        });
        </script>
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
                        <h2> ${pv.pat_name} 님의 회원정보수정 페이지 입니다. </h2>
                    </div>
                    <div class="reslist">
                        <h3>정보 수정</h3> <!-- 지난예약은 표시되지 않음 -->
                       <form action="/Mypage/Update" method="POST">
                        <table cellpadding="0" cellspacing="0">
							<tr>
								<td>회원 아이디 </td>
								<td><input type="text" size="60" value="${pv.pat_id}" name="pat_id" readonly/></td>
							</tr>
							<tr>
								<td>기존 비밀번호  </td>
								<td><input type="password" size="53" id="nowpwd"/>&nbsp;&nbsp;&nbsp;<button class="pverify">인증</button></td>
								
							</tr>
							<tr>
								<td>비밀번호  </td>
								<td><input type="password" size="60" id="updatepwd" class="before" readonly=""/></td>
							</tr>
							<tr>
								<td>비밀번호 재확인 </td>
								<td><input type="password" name="pat_pw" id="vupdatepwd" class="before" size="53" readonly=""/>&nbsp;&nbsp;&nbsp;<button class="reverify" >확인</button></td>
							</tr>
							<tr>
								<td>이름 </td>
								<td><input type="text" size="60" value="${rv.pat_name}" name="pat_name" class="before" readonly=""/></td>
							</tr>
							<tr>
								<td>주민등록번호 </td>
								<td><input type="text" id="ssn" size="60" value="${rv.ssn}" name="ssn" readonly/></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<select name="first_tel">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - 
									<input type="text" name="second_tel" id="second_tel" size="6" autocomplete="off"/> -
									<input type="text" name="third_tel" id="third_tel" size="6" autocomplete="off"/>
									<span id="msgTel"></span>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input type="text" name="zipcode" id="zipcode" size="20" readonly /><br>
									<input type="text" name="main_address" id="main_address" size="20" readonly /> <input type="button" id="btnfindaddress" value="주소찾기" /><span id="msgAdd1"></span><br>
									<input type="text" name="rest_address" id="rest_address" size="60" placeholder="나머지주소" autocomplete="off"/> <span id="msgAdd2"></span>
								</td>
							</tr>
							<tr>
							<th>이메일</th>
							<td><input type="text" name="first_email" id="first_email" size="20" autocomplete="off"/> @ <input type="text" name="second_email" id="second_email" size="25" autocomplete="off"/> 
								<select name="second_email" id="listEmail" >
									<option value="#" selected>주소선택</option>
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="google.com">gmail.com</option>
								</select>
								<span id="msgEmail"></span>
							</td>
							</tr>
                        </table>
                    <input type="submit" value="제출" id="btn"/>
                       </form>
                    </div>
                <ul>
                    <li>
                        <div class="reserv">
                            <h2>지난 예약기록 </h2>
                            <p>지난 예약 기록을 <br>
                            보실 수 있습니다.</p>
                            <button style="border:2px solid white; width:100px; height:40px; background:none;"><a href="/Mypage/Past">바로가기</a></button>
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
                </div>
            </section>
            <footer></footer>
        </div>
    </body>
</html>