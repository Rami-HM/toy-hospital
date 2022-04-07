<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" type="text/css">
<link rel="stylesheet" href="/css/loginForm.css">
<style>
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
</style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/loginForm.js"></script>
</head>
<body>
	<header>
		<a href="/"><img src="/img/hlogo.png" width="240"></a>
	</header>
	<!-- 회원 로그인 폼 -->
	<!-- 로그인 그룹 버튼 -->
	<div class="div_group">
		<a href="#" class="pat_aTag">Member Login</a> <a href="#" class="adm_aTag">Admin Login</a>
	</div>
	<div class="div_box_pat">
		<!-- 아이디, 패스워드 -->
		<form action="" method="POST" class="form_login1">
			<table class="login_table">
				<tr>
					<td class="inputWithIcon"><input type="text" name="id" size="60" placeholder="ID" autocomplete="off" /> <i class="fas fa-user fa-lg fa-fw" aria-hidden="true"></i></td>
				</tr>
				<tr>
					<td class="inputWithIcon"><input type="password" name="password" size="60" placeholder="PASSWORD" /> <i class="fa fa-key fa-lg fa-fw" aria-hidden="true"></i></td>
				</tr>
			</table>
		</form>
		<!-- 로그인 버튼 -->
		<div class="div_btnLogin1">
			<a href="#" class="btnLogin1">Login</a>
		</div>
		<hr />
		<!-- 회원가입, 아이디/패스워드 찾기 -->
		<div class="div_aTag1">
			<a href="/login/regMember" class="regMember">회원가입</a> <a href="/login/find/personalData" class="findId">아이디 / 패스워드 찾기</a>
		</div>
	</div>
	
	<!-- 관리자,의료진 로그인 폼 -->
	<div class="div_box_adm">
		<!-- 아이디, 패스워드 -->
		<form action="" method="POST" class="form_login2">
			<table class="login_table">
				<tr>
					<td class="inputWithIcon"><input type="text" name="id" size="60" placeholder="ID" autocomplete="off" /> <i class="fas fa-user fa-lg fa-fw" aria-hidden="true"></i></td>
				</tr>
				<tr>
					<td class="inputWithIcon"><input type="password" name="password" size="60" placeholder="PASSWORD" /> <i class="fa fa-key fa-lg fa-fw" aria-hidden="true"></i></td>
				</tr>
			</table>
		</form>
		<table>
			<tr>
				<td><input type="checkbox" value="admin" class="admin_login" /></td>
				<td>Admin Login</td>
			</tr>
		</table>
		<!-- 로그인 버튼 -->
		<div class="div_btnLogin2">
			<a href="#" class="btnLogin2">Admin Login</a>
		</div>
	</div>
</body>
</html>