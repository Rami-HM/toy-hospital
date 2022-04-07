<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');

* {
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Nanum Gothic', sans-serif;
}

#container {
	margin: 0 auto;
	width: 1000px;
	position: relative;
}

header {
	width: 100%;
	height: 60px;
	margin: 0 auto;
}

header img {
	position: absolute;
	left: 50%;
	margin-left: -120px;
	margin-top: 15px;
}

#div_findId, #div_findPassword {
	margin: 30px auto;
	border: 2px solid #E6E6E6;
	width: 800px;
	height: 250px;
}

input {
	size: 50px;
}

table {
	border: 1px solid #E6E6E6;
	margin: 30px auto;
	width: 600px;
	height: 150px;
}

table tr:nth-last-child(1) {
	text-align:center;
}

.sub_title {
	margin:10px;
}

input[type=submit] {
	width:100px;
	border-radius:8px;
	font-weight:bold;
}

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
	$(function() {
		
	})
</script>
</head>
<body>
	<div id="container">
		<header>
			<a href="/"><img src="/img/hlogo.png" width="240" /></a>
		</header>
		<section>
			<div>
				<div id="div_findId">
					<form action="/login/find/findid" method="post">
						<h3 class="sub_title">아이디 찾기</h3>
						<hr />
						<table>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="pat_name" autocomplete="off"/>
								</td>
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td>
									<input type="text"     name="first_ssn"  autocomplete="off"/> - 
									<input type="password" name="second_ssn" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="확인" id="idfind" />
								</td>
							</tr>	
						</table>
					</form>
				</div>


				<div id="div_findPassword">
					<form action="/login/find/findpw" method="POST">
						<h3 class="sub_title">패스워드 찾기</h3>
						<hr />
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="pat_id"  autocomplete="off"/></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="pat_name"  autocomplete="off"/></td>
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td>
									<input type="text"     name="first_ssn"  autocomplete="off"/> - 
									<input type="password" name="second_ssn" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="확인" />
								</td>
							</tr>	
						</table>
					</form>
				</div>
			</div>
		</section>
		<footer></footer>
	</div>
</body>
</html>