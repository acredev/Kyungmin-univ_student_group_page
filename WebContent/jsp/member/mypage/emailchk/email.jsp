<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/join.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 이메일 본인인증</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand">경민대학교 대나무숲 : 이메일 변경</a>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form name="email" action="emailchk.jsp" method="post">
					<h2 style="text-align:center;">이메일 변경</h2>
					<div class="form-gruop">
						<p>
							<input type="text" class="form-control" placeholder="이메일" name="email" id="email" maxlength="30">
						</p>
						<p>
							<input type="button" class="btn btn-primary form-control" onclick="emailchk()" value="본인인증">
						</p>
					</div>
				</form>
			</div>
		<div class="col-lg-4"></div>
	</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/mypage.js"></script>
</body>
</html>