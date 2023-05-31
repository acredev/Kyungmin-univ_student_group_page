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
		<title>경민대학교 대나무숲 : 프로젝트에 대하여...</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-targetr="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
					<li><a href="bbs.jsp">익명 게시판</a></li>
					<li><a href="bbs.jsp">Tip 게시판</a></li>
					<li><a href="bbs.jsp">자료실</a></li>
					<li><a href="/19831049_finalproject/jsp/cs/cs.jsp">문의하기</a></li>
					<li class="active"><a href="/19831049_finalproject/jsp/etc/about.jsp">프로젝트에 대하여...</a></li>
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
						<li><a href="/19831049_finalproject/jsp/member/login/LogoutAction.jsp">로그아웃</a></li>
					</ul>
				<%		
				}%>
			</div>
		</nav>
		<div class="container">
			<div class="jumbotron">
				<div class="container">
					<h1>JSP 활용 : 기말고사 프로젝트</h1>
					<p>경민대학교 융합소프트웨어과 3학년 A반 JSP 활용 과목의 기말고사 프로젝트로 인해 제작된 웹 페이지입니다.</p>
					<p>부트스트랩 라이브러리를 사용했으며, MySQL DBMS를 사용합니다.</p>
					<p>제작자 : 19831049 이민혁</p>
					<p><a class="btn btn-primary btn-pull" href="https://acredev.tistory.com/" role="button">이민혁 개발 블로그</a></p>
					<p><a class="btn btn-primary btn-pull" href="https://instagram.com/dailylife_lmh" role="button">이민혁 개인 SNS (instagram)</a></p>
					<p><a class="btn btn-primary btn-pull" href="https://github.com/acredev" role="button">이민혁 GitHub</a></p>
				</div>
			</div>
		</div>
		<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="/19831049_finalproject/js/bootstrap.js"></script>
	</body>
</html>