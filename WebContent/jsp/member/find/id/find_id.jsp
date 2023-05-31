<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/login.css">
		<title>경민대학교 대나무숲 : 회원가입</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-targetr="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲 : 아이디 찾기</a>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="LoginAction.jsp">
					<h3 style="text-align:center;">아이디 찾기</h3>
					<h5 style="text-align:center;">회원정보에 등록된 이름과 이메일 주소가 일치해야만 아이디 찾기가 가능합니다.</h5>
					<div class="form-gruop">
						<input type="text" class="form-control" placeholder="이름" name="name" id="name" maxlength="5">
					</div>
					<div class="form-gruop">
						<input type="text" class="form-control" placeholder="이메일" name="email" id="email" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="인증번호 발송"></input>
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
</body>
</html>