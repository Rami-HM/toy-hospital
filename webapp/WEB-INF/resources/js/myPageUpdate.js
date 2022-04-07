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