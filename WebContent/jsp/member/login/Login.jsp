<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/login.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 로그인</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-targetr="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/19831049_finalproject/jsp/main.jsp">메인</a></li>
					<li><a href="bbs.jsp">익명 게시판</a></li>
					<li><a href="bbs.jsp">Tip 게시판</a></li>
					<li><a href="bbs.jsp">자료실</a></li>
					<li><a href="/19831049_finalproject/jsp/cs/cs.jsp">문의하기</a></li>
					<li><a href="/19831049_finalproject/jsp/etc/about.jsp">프로젝트에 대하여...</a></li>
				</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="LoginAction.jsp">
					<h3 style="text-align:center;">로그인</h3>
					<div class="form-gruop">
						<input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="20">
					</div>
					<div class="form-gruop">
						<input type="password" class="form-control" placeholder="비밀번호" name="pwd" id="pwd" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인"></input>
					<div style="text-align:center;">
						<a onclick="find_id_click()">아이디 찾기</a>
						<a>|</a>
						<a onclick="find_pwd_click()">비밀번호 찾기</a>
						<br>
						<a href="/19831049_finalproject/jsp/member/join/join.jsp">회원가입</a>
					</div>
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/find.js"></script>
</body>
</html>