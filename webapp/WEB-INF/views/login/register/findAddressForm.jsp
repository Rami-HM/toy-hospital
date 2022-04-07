<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
    
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>주소 찾기</title>
		<style>
			td,tr {
				border:1px solid black;
			}
			
			#rowList:hover {
				font-weight:bold;
			}
			
			#listBox {
				width:100%;
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script>
			window.onload = function() {
				$("#listBox tr").click(function(e) {     
		            var tr = $(this);
					
					this.style.fontWeight='bold';
					this.style.color = 'white';
					this.style.backgroundColor = 'gray';
					
					opener.document.getElementById('zipcode').value = $(this).find('td')[0].innerText;
					opener.document.getElementById('main_address').value = $(this).find('td')[1].innerText;
					self.close();
				});
			} // onload end
		</script>
	</head>
	<body>
		<div align="center">
			<form action="/login/regMember/findAddress" method="GET">
				주소 입력 <input type="text" name="text" size=80 autocomplete="off"/> 
				<input type="submit" id="btnFind" value="검색" />
			</form>
		</div>
		<hr>
		<div>
			<table id="listBox">
					<tr>
						<td style="width:100px">우편번호</td>
						<td style="width:600px">주소</td>
					</tr>
				<c:forEach var="zipcode" items="${ zipcodeList }">
					<tr>
						<td style="width:100px" class="zipcode">${ zipcode.zipcode }</td>
						<td style="width:600px" class="main_address">
							${ zipcode.sido } ${ zipcode.sigungu } ${ zipcode.doro }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>