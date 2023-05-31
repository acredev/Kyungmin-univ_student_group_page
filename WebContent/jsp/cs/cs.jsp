<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 프로젝트에 대하여...</title>
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
					<li class="active"><a href="">문의하기</a></li>
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
						<li><a href="/19831049_finalproject/jsp/member/Login/LogoutAction.jsp">로그아웃</a></li>
					</ul>
				<%		
				}%>
			</div>
		</nav>
	<div class="container">
		<div class="row">
		<form name="cs" method="post" action="csAction.jsp">
			<table class="table table-striped" style="text-align:center;border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align:center;">문의하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="답변 받을 이메일 주소" name="email" id="email" maxlength="50"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="문의 제목" name="title" id="title" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="문의내용" name="content" id="content" maxlength="1024" style="height:350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="button" class="btn btn-primary pull-right" onclick="csSend()" value="문의 접수">
		</form>
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/cs.js"></script>
</body>
</html>