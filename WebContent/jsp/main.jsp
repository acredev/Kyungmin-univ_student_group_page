<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 메인</title>
	</head>
	<body>
		<%
		String user_id = null;
		if (session.getAttribute("id") != null)
		{
			user_id = (String)session.getAttribute("id");
		}
		%>
		
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="main.jsp">메인</a></li>
					<li><a href="bbs.jsp">익명 게시판</a></li>
					<li><a href="bbs.jsp">Tip 게시판</a></li>
					<li><a href="bbs.jsp">자료실</a></li>
					<li><a href="/19831049_finalproject/jsp/cs/cs.jsp">문의하기</a></li>
					<li><a href="/19831049_finalproject/jsp/etc/about.jsp">프로젝트에 대하여...</a></li>
				</ul>
				<%
				if(user_id == null)
				{%>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/19831049_finalproject/jsp/member/login/Login.jsp">로그인</a></li>
						<li><a href="/19831049_finalproject/jsp/member/join/join.jsp">회원가입</a></li>
					</ul>
				<%
				}
				else
				{%>
					<ul class="nav navbar-nav navbar-right">
						<li><a>마이페이지</a></li>
						<li><a href="/19831049_finalproject/jsp/member/login/LogoutAction.jsp">로그아웃</a></li>
					</ul>
				<%		
				}%>
			</div>
		</nav>
		<div class="container">
			<div class="jumbotron">
				<div class="container">
					<div style="text-align:center;">
						<img src="/19831049_finalproject/img/logo-kmu.png" alt="경민대로고">
						<h1>경민대학교 대나무숲</h1>
						<p>경민대학교 대나무숲에 오신 것을 환영합니다!</p>
						<p>
							<a class="btn btn-primary btn-pull" href="https://acredev.tistory.com/" role="button">익명<br>게시판</a>
							<a class="btn btn-primary btn-pull" href="https://instagram.com/dailylife_lmh" role="button">Tip<br>게시판</a>
							<a class="btn btn-primary btn-pull" href="https://github.com/acredev" role="button">자료실<br>게시판</a>
						</p>
						<p style="font-size:15px; color:grey;">Project dev. 19831049 이민혁</p>
					</div>
				</div>
			</div>
		</div>
		<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="/19831049_finalproject/js/bootstrap.js"></script>
	</body>
</html>