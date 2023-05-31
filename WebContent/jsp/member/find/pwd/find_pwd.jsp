<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/login.css">
		<title>경민대학교 대나무숲 : 비밀번호 재설정</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲 : 비밀번호 재설정</a>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form name="find_pwd" method="post" action="find_pwd_second.jsp">
					<h3 style="text-align:center;">비밀번호 재설정</h3>
					<h5 style="text-align:center;">비밀번호를 재설정하고자 하는 아이디를 입력해 주세요.</h5>
					<div class="form-gruop">
						<input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="10">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="다음"></input>
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	</body>
</html>