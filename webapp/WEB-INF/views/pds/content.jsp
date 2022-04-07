<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content Page</title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
         
        <style type="text/css">
			        .table {
			   width: 100%;
			   height: 250px;
			   border: 1px solid #eaeaea;
			   background: white;
			   display: block;
			   padding-left: 10px;
			}
			.table p {
			   padding-left : 10px;
			   margin-left: -10px;
			   font-size : 12px;
			   color : #5E5D56;
			   line-height:18px;
			}
			.idwelcome{
				margin-left:10px;
			}
			
			.logout {
			   background: #faed00;
			   display:block;
			   text-align:center;
			   border-radius:5px;
			   width: 180px;
			   height: 33px;
			   line-height: 33px;
			   margin: 20px auto 0 22px;
			}
			.logout a{
				color:#5E5D56;
			}
        
        </style>
<style>
.viewForm {
	margin: 0 auto;
	width: 1000px;
	height: 430px;
	border-collapse: collapse;
}

.viewForm tr td, th {
	/* border: 1px solid white; */
	border-bottom: 1px dotted #ccc;
}

.viewForm tr:nth-child(1) {
	height: 40px;
}

.viewForm tr:nth-child(2) {
	height: 40px;
}

.viewForm tr:nth-child(3) {
	height: 40px;
}

.viewForm tr:nth-child(4) {
	height: 40px;
}

.viewForm tr:nth-child(5) {
	height: 200px;
}

.viewForm tr:nth-child(6) {
	height: 100px;
}

.viewForm tr:nth-child(7) {
	height: 40px;
}

.viewForm th {
	width: 200px;
	text-align: center;
	background-color: #EAF3FA;
	font-weight: bold;
}


.viewForm td:nth-child(1) {
	text-align: center;
}

.viewForm tr td:nth-child(2) {
	width: 800px;
	padding-left: 5px;
}

a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}

input[type = button]
{
	background-color: #018ace;
	width : 200px;
	height : 50px;
	border: none;
	color: white;
	font-weight: bold;	
	margin-top: 10px;
	border-radius: 5px; 

}
</style>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script type="text/javascript" src ="/js/homePage.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
         $(function(){
            // 목록버튼 처리
            $("#btnGoToList").click(function() {
               $("#form_tag").attr("action", "/PDS/List");
               $("#form_tag").submit();
            });
            
            // 수정버튼 처리
            $("#btnUpdate").click(function() {
               $("#form_tag").attr("action", "/PDS/UpdateForm");
               $("#form_tag").submit();
            });
            
            // 댓글달기 처리
            $("#btnComments").click(function() {
               $("#form_tag").attr("action", "/PDS/WriteForm");
               $("#form_tag").submit();
            });
            
            // 댓글삭제 처리
            $("#btnDelete").click(function() {
               $("#form_tag").attr("action", "/PDS/Delete");
               $("#form_tag").submit();
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
			<script type="text/javascript" src="/js/menulist.js"></script>
			<%@include file="/WEB-INF/include/menulist.jspf"%>
		</nav>
		<section>
			<br />
			<br />
			<br />
			<br />
			<!-- 현재페이지 정보 전달 -->
			<form action="" method="POST" id="form_tag">
				<input type="hidden" name="sub_id" value="${ map.sub_id }" /> <input
					type="hidden" name="nowpage" value="${ map.nowpage }" /> <input
					type="hidden" name="pagegrpnum" value="${ map.pagegrpnum }" /> <input
					type="hidden" name="brd_idx" value="${ map.brd_idx }" /> <input
					type="hidden" name="brd_nref" value="${ pdsVo.brd_nref }" /> <input
					type="hidden" name="brd_bnum" value="${ pdsVo.brd_bnum }" /> <input
					type="hidden" name="brd_lvl" value="${ pdsVo.brd_lvl }" /> <input
					type="hidden" name="brd_step" value="${ pdsVo.brd_step }" />
			</form>

			<table class="viewForm" cellpadding="0" cellpadding="0">
				<caption>
					<h2>${ pdsVo.brd_title }</h2>
					<br/>
				</caption>
				
				<tr>
					<th>작성자</th>
					<td>${ pdsVo.brd_writer }</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>${ pdsVo.brd_title }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${ pdsVo.brd_regdate }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${ pdsVo.readcount }</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td>${pdsVo.brd_conts }</td>
				</tr>
				<tr>
					<th>파일</th>
					<td><c:forEach var="file" items="${fileList}">
							<a href="<c:out value='/download/external/${ file.file_name }'/>">
								${ file.file_name } </a>
							<br />
						</c:forEach></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="목록" id="btnGoToList" /> 

						<!--  만약에, 로그인정보랑 작성자가 같다면 : 수정/삭제 -->
						<!--  로그인이 회원또는 의료진이지만, 작성자가 아니면 : 댓글달기 -->
						<!--  로그인이 관리자면 : 삭제/댓글달기 -->
						
						<c:if test="${ sessionScope.login.id eq pdsVo.brd_writer}">
								<input type="button" value="수정" id="btnUpdate" />
								<input type="button" value="삭제" id="btnDelete" />
						</c:if>
						
						<c:if test="${sessionScope.login.id ne pdsVo.brd_writer && sessionScope.login.grade ne 0}">
								<input type="button" value="댓글달기" id="btnComments" />
						</c:if>
						
						<c:if test="${sessionScope.login.grade eq 0}">
								<input type="button" value="댓글달기" id="btnComments" />
								<input type="button" value="삭제" id="btnDelete" />
						</c:if>
						
				</tr>
			</table>
		</section>
		<footer></footer>
	</div>
</body>
</html>