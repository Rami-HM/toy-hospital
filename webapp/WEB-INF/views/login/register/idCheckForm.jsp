<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>아이디 중복확인</title>
		<style>
			.inputId { color:blue; }	
		</style>
		
		<script src="https://code.jquery.com/jquery.min.js"></script>
		<script>
			$(function() {
				// 사용하기 버튼 숨기기
				if($(".idCheck").val() == 'true') {
					$(".btnOk").attr("style","display:inline");
				}
				
				// 사용하기 버튼 클릭
				$(".btnOk").click(function() {
					opener.document.getElementById('idbtncheck').value = $(".idchecknum").val();
					window.close();
				});
				
				// 취소버튼 클릭
				$(".btnCan").click(function() {
					window.close();
				});
			});
		</script>
	</head>
	<body>
		<input type="hidden" value="${ idCheck }" class="idCheck"/>
		
		<div class="body">
			<h3 align="center">아이디 중복체크</h3>
			<hr>			
			<div class="msg" align="center">
				<h4 align="center">"<span class=inputId>${ inputId }</span>" 아이디는</h4>
				<h4> ${ msg }</h4>
				<br>
				<input type="button"  class="btnCan" value="취소" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button"  class="btnOk" value="사용하기" style="display:none"/>
				<input type="hidden"  class="idchecknum" value="0"/>
			</div>
		</div>	
	</body>
</html>