<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
	padding-left: 10px;
	margin-left: -10px;
	font-size: 12px;
	color: #5E5D56;
	line-height: 18px;
}

.idwelcome {
	margin-left: 10px;
}

.logout {
	background: #faed00;
	display: block;
	text-align: center;
	border-radius: 5px;
	width: 180px;
	height: 33px;
	line-height: 33px;
	margin: 20px auto 0 22px;
}

.logout a {
	color: #5E5D56;
}
</style>
<style>

.board {
	width: 1000px;
	margin: 0 auto;
	border-collapse: collapse;
}

.board tr:nth-child(1) {
	border-top: 0;
}

.board tr:nth-child(2) {
	border-bottom: 2px solid #EAF3FA;
	background-color: #EAF3FA;
	color: black;
	font-weight: bold;
}

.board tr {
	border-top: 1px solid #EAE7E9;
}

.board tr:nth-last-child(1) {
	border-bottom: 1px solid #EAE7E9;
}

.table_row:hover {
	background-color: #F4F7FA;
}

.board tr td {
	text-align: center;
}

.board tr td:nth-child(1) {
	width: 50px;
	height: 30px;
}

.board tr td:nth-child(2) {
	width: 540px;
	height: 30px;
	text-align: left;
}

.board tr td:nth-child(3) {
	width: 140px;
	height: 30px;
}

.board tr td:nth-child(4) {
	width: 100px;
	height: 30px;
}

.board tr td:nth-child(5) {
	width: 100px;
	height: 30px;
}

.board tr td:nth-child(6) {
	width: 70px;
	height: 30px;
}

.board tr:nth-child(1) td {
	text-align: right;
}

.board tr:nth-child(2) td {
	text-align: center;
}

.btnArea {
	height: 30px;
}

a {
	text-decoration: none;
}

h2 {
	text-align: center;
}

.div_table {
	text-align: center;
	width: 1000px;
	height: 500px;
	margin: 0 auto;
}

input[type=button] {
	width: 100px;
	padding: 3px;
	border: 0;
	background-color: #EAF3FA;
	font-weight: bold;
}

input[type=button]:hover {
	background-color: #E0EEFC;
}

.paging {
	width: 500px;
	height: 25px;
	align: center;
	margin: 0 auto;
}

.paging a {
	font-fimily: "d2coding";
}
</style>
<!-- <link rel="stylesheet" href="/css/common.css" />-->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
         $(function() {
            // 글 작성 클릭 처리
            $("#btnWrite").click(function() {
               $("#form_write").submit();
            });
            
            // title 클릭 처리
            $(".table_row").click(function(event) {
               var brd_idx = $(this)[0].children[1].children[0].attributes[1].value;
               $("#hidden_tag").attr("value", brd_idx);
               $("#form_content").submit();
            });
            
            // 홈가기 버튼 처리
            $("#btnGoToHome").click(function() {
               location.href="/";
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
			<!-- 새 글작성시 이동시 넘기는 정보 -->
			<form action="/PDS/WriteForm" method="POST" id="form_write">
				<input type="hidden" name="sub_id" value="${ sub_id }" /> <input
					type="hidden" name="brd_bnum" value="0" /> <input type="hidden"
					name="brd_lvl" value="0" /> <input type="hidden" name="brd_step"
					value="0" /> <input type="hidden" name="brd_nref" value="0" /> <input
					type="hidden" name="nowpage" value="${pagePdsVo.nowpage}" /> <input
					type="hidden" name="pagegrpnum" value="${pagePdsVo.pagegrpnum}" />
			</form>
			<!-- 내용보기시 넘기는 정보 -->
			<form action="/PDS/Content" method="POST" id="form_content">
				<input type="hidden" name="brd_idx" id="hidden_tag" value="" /> <input
					type="hidden" name="sub_id" value="${ sub_id }" /> <input
					type="hidden" name="nowpage" value="${pagePdsVo.nowpage}" /> <input
					type="hidden" name="pagegrpnum" value="${pagePdsVo.pagegrpnum}" />
			</form>

			<h2>게시판</h2>
			<div class="div_table">
				<table class="board">
					<tr>
						<td class="btnArea" colspan="6"><input type="button"
							value="글 작성" id="btnWrite" /> <input type="button" value="홈으로"
							id="btnGoToHome" /></td>
					</tr>
					<tr>
						<td>번호</td>
						<td>글제목</td>
						<td>글쓴이</td>
						<td>작성일</td>
						<td>파일수</td>
						<td>조회수</td>
					</tr>

					<c:forEach var="pdsVo" items="${ pdsList }">
						<tr class="table_row">
							<td><c:choose>
									<c:when test="${ pdsVo.brd_lvl eq 0 }"> 
                         ${pdsVo.brd_idx}
                    </c:when>
									<c:otherwise>
                       &nbsp;
                    </c:otherwise>
								</c:choose></td>

							<td class="titleArea"
								style="padding-left:${ pdsVo.brd_lvl * 30 }px"><c:choose>
									<c:when test="${ pdsVo.brd_lvl eq 0 }">
										<c:choose>
											<c:when test="${ pdsVo.brd_delnum eq 0 }">
                                 ${pdsVo.brd_title}<span
													style="display: none" id="${pdsVo.brd_idx}"
													class="hidden_idx"></span>
											</c:when>
											<c:otherwise>
												<s>삭제된 글입니다</s>
											</c:otherwise>
										</c:choose>
									</c:when>

									<c:otherwise>
										<c:choose>
											<c:when test="${ pdsVo.brd_delnum eq 0 }">
                                 ${pdsVo.brd_title}<span
													style="display: none" id="${pdsVo.brd_idx}"
													class="hidden_idx"></span>
											</c:when>
											<c:otherwise>
												<s>삭제된 글입니다</s>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose></td>

							<td>${pdsVo.brd_writer}</td>
							<td>${pdsVo.brd_regdate}</td>
							<td><c:choose>
									<c:when test="${ pdsVo.filescount eq 0 }">
                        &nbsp;
                      </c:when>
									<c:otherwise>
                          ${ pdsVo.filescount } 개
                      </c:otherwise>
								</c:choose></td>

							<td>${pdsVo.readcount}</td>
						</tr>
					</c:forEach>

					<%@ include file="/WEB-INF/include/paging.jspf"%>

				</table>
			</div>
		</section>
		<footer></footer>
	</div>

</body>
</html>