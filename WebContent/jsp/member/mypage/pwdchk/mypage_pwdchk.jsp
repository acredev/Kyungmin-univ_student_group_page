<%@page import="chk.TelChk"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
		String user_id = null;
		if (session.getAttribute("id") != null)
		{
			user_id = (String)session.getAttribute("id");
		}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 비밀번호 확인</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand">경민대학교 대나무숲</a>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form name="mypage_pwdchk" method="post" action="mypage_pwdchkAction.jsp">
					<h2 style="text-align:center;">비밀번호 확인</h2>
					<h5 style="text-align:center;">마이페이지 진입을 위해 비밀번호 확인이 필요합니다.</h5>
					<div class="form-gruop">
						<p>
							<input type="password" class="form-control" placeholder="비밀번호" name="pwd" id="pwd" maxlength="20">
						</p>
						<p>
							<input type="submit" class="btn btn-primary form-control" value="비밀번호 확인">
						</p>
					</div>
					</form>
					</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
</body>
</html>