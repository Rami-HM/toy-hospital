<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>Update Page</title>
		<style>
			.updateForm {
				margin:0 auto;
				width:450px; height:430px;
			}
			.updateForm tr td {
				border:1px solid black;
			}
			.updateForm {
				width:500px;
			}
			.updateForm tr:nth-child(1) {
				height:40px;
			}
			.updateForm tr:nth-child(2) {
				height:40px;
			}
			.updateForm tr:nth-child(3) {
				height:40px;
			}
			.updateForm tr:nth-child(4) {
				height:40px;
			}
			.updateForm tr:nth-child(5) {
				height:200px;
			}
			.updateForm tr:nth-child(6) {
				height:100px;
			}
			.updateForm tr:nth-child(7) {
				height:40px;
			}
			.updateForm tr td:nth-child(1) {
				width:80px;
				text-align:center;
			}
			.updateForm tr td:nth-child(2) {
				width:420px;
				padding-left:5px;
			}
			textarea {
				width:400px; height:180px;
			}
			
		</style>
		<script src="https://code.jquery.com/jquery.min.js"></script>
		<script>
			$(function(){
				// 수정확인버튼 처리
				$("#btnOk").click(function() {
					$("#form_update").attr("action", "/PDS/Update");
					$("#form_update").submit();
				});
				
				// 취소버튼 처리
				$("#btnCancel").click(function() {
					$("#form_cancel").attr("action", "/PDS/Content");
					$("#form_cancel").submit();
				});
			});
		</script>
	</head>
	<body>
		<!-- 현재 페이지 정보 전달 -->
		<form action="" method="POST" id="form_cancel">
			<input type="hidden" name="sub_id"     value="<c:out value='${ map.sub_id }'/>" />
			<input type="hidden" name="nowpage"    value="<c:out value='${ map.nowpage }'/>"/>
			<input type="hidden" name="pagegrpnum" value="<c:out value='${ map.pagegrpnum }'/>"/>
			<input type="hidden" name="brd_idx"    value="<c:out value='${ map.brd_idx }'/>"/>
		</form>
	
		<form action="" method="POST" id="form_update">
			<input type="hidden" name="sub_id"      value="<c:out value='${map.sub_id }'/>"/>
			<input type="hidden" name="nowpage"     value="<c:out value='${map.nowpage }'/>"/>
			<input type="hidden" name="pagegrpnum"  value="<c:out value='${map.pagegrpnum }'/>"/>
			<input type="hidden" name="brd_idx"     value="<c:out value='${map.brd_idx }'/>"/>
			
			<table class="updateForm" cellpadding="0" cellpadding="0">
			<caption><h2>수정 페이지</h2></caption>
				<tr>
	 				<td>작성자</td>
	 				<td>
	    				${ pdsVo.brd_writer }<input type="hidden" name="brd_writer" size="58" value="${ pdsVo.brd_writer }" /> 
	 				</td>
				</tr> 
				<tr>
	 				<td>글제목</td>
	 				<td>
	    				<input type="text" name="brd_title" size="58" value="${ pdsVo.brd_title }" autocomplete="off"/> 
	 				</td>	
				</tr> 
				<tr>
	 				<td>작성일</td>
	 				<td>
	    				${ pdsVo.brd_regdate }<input type="hidden" name="brd_regdate" size="58" value="${ pdsVo.brd_regdate }" /> 
	 				</td>	
				</tr> 
				<tr>
	 				<td>조회수</td>
	 				<td>
	    				${ pdsVo.readcount }<input type="hidden" name="readcount" size="58" value="${ pdsVo.readcount }"/> 
	 				</td>	
				</tr> 
				<tr>
	 				<td>글 내용</td>
	 				<td>
	    				<textarea name="brd_conts" autocomplete="off">${ pdsVo.brd_conts }</textarea>
	 				</td>
				</tr>
				<tr>
	 				<td>파일</td>
	 				<td>
	    			<c:forEach var="file" items="${fileList}">
	    				<div>
		    				<a href="<c:out value='/download/external/${ file.file_name }'/>"> 
		    					${ file.file_name }
		    				</a><br/>
	    				</div>        
	    			</c:forEach>	
	 				</td>
				</tr>
				<tr>
	 				<td colspan="2">
	     				<input type="button" value="완료" id="btnOk"/>     
	     				<input type="button" value="취소" id="btnCancel"/>     
	 				</td>
				</tr>
			</table>
		</form>	
	</body>
</html>