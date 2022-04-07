<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>부경대학교병원</title>
<link rel="stylesheet" href="/css/homePage.css" type="text/css">
<link rel="stylesheet" href="/css/menuBar.css" type="text/css">
<style>
.writeForm {
	width: 1000px;
	height: 430px;
	border-collapse: collapse;
	margin: 0 auto;
}

.writeForm tr:nth-child(1) {
	height: 40px;
}

.writeForm tr:nth-child(2) {
	height: 40px;
}

.writeForm tr:nth-child(3) {
	height: 220px;
}

.writeForm tr:nth-child(4) {
	height: 105px;
}

.writeForm tr:nth-child(5) {
	height: 40px;
	background-color: white;
}

.writeForm tr th {
	width: 200px;
	text-align: center;
	background-color: #EAF3FA;
}

.writeForm tr td:nth-child(2) {
	width: 800px;
}

.writeForm tr td:nth-child(1) {
	text-align: center;
}

input, textarea {
	margin-left: 5px;
}

input[type=text] {
	width: 790px;
}

input[type=button] {
	width: 100px;
	background-color: #EAF3FA;
	border: 0;
	font-weight: bold;
	padding: 3px;
}

input[type=button]:hover {
	background-color: #E0EEFC;
}

textarea {
	width: 790px;
	height: 200px;
}

span {
	margin-left: 10px;
}
</style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
         $(function(){
            // 내용 입력 처리
            $("#btnOk").click(function() {
               if($("#title").val() == "" || $("#conts").val() == "") {
                  alert("제목/내용을 입력해주세요.");
               } else {
                  $("#form_tag").submit();                  
               }
            });
            
            // 목록으로 이동
            $("#btnGoToList").click(function() {
               $("#form_tag").attr("action", "/PDS/List");
               $("#form_tag").submit();
            });
         });
      </script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/homePage.js"></script>

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

			<h2 style="text-align: center">새 글 작성</h2>

			<!-- 자료입력부분 -->
			<form action="/PDS/Write" method="POST" enctype="multipart/form-data"
				id="form_tag">
				<table class="writeForm" border="1">
					<tr>
						<th>작성자</th>
						<td><span>${ map.user_id }<input type="hidden"
								name="brd_writer" value="${ map.user_id }" /></span></td>
					</tr>
					<tr>
						<th>글제목</th>
						<td><input type="text" name="brd_title" size="50" id="title" />
						</td>
					</tr>
					<tr>
						<th>글 내용</th>
						<td><textarea name="brd_conts" id="conts"></textarea></td>
					</tr>
					<tr>
						<th>파일</th>
						<td><input type="file" name="upfile" id="orgFile" size="50" /><br />
							<input type="file" name="upfile2" id="orgFile2" size="50" /><br />
							<input type="file" name="upfile3" id="orgFile3" size="50" /><br />
							<input type="file" name="upfile4" id="orgFile4" size="50" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="확인" id="btnOk" />
							<input type="button" value="목록" id="btnGoToList" /></td>
					</tr>
				</table>

				<!-- 받은 정보를 다음 페이지(/PDS/Write)로 전송 -->
				<input type="hidden" name="sub_id"
					value="<c:out value='${ map.sub_id     }'/>" /> <input
					type="hidden" name="brd_bnum"
					value="<c:out value='${ map.brd_bnum   }'/>" /> <input
					type="hidden" name="brd_lvl"
					value="<c:out value='${ map.brd_lvl    }'/>" /> <input
					type="hidden" name="brd_step"
					value="<c:out value='${ map.brd_step   }'/>" /> <input
					type="hidden" name="brd_nref"
					value="<c:out value='${ map.brd_nref   }'/>" /> <input
					type="hidden" name="nowpage"
					value="<c:out value='${ map.nowpage    }'/>" /> <input
					type="hidden" name="pagegrpnum"
					value="<c:out value='${ map.pagegrpnum }'/>" />

			</form>
		</section>
		<footer></footer>
	</div>
</body>
</html>