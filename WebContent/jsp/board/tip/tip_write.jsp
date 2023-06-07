<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : Tip 게시판</title>
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
				<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/19831049_finalproject/jsp/main.jsp">메인</a></li>
					<li><a href="/19831049_finalproject/jsp/board/anonymous/anonymous_board.jsp">익명 게시판</a></li>
					<li class="active"><a href="/19831049_finalproject/jsp/board/tip/tip_board.jsp">Tip 게시판</a></li>
					<li><a href="/19831049_finalproject/jsp/board/data/data_board.jsp">자료실</a></li>
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
						<li><a href="" onclick="mypage_click()">마이페이지</a></li>
						<li><a href="/19831049_finalproject/jsp/member/login/LogoutAction.jsp">로그아웃</a></li>
					</ul>
				<%		
				}%>
			</div>
		</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="tip_writeAction.jsp" enctype="multipart/form-data">
			<table class="table table-striped" style="text-align:center;border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align:center;">Tip 게시판 글쓰기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="작성자" name="writer" maxlength="10"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="제목" name="title" maxlength="30"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<p>* 최대 100M 까지의 이미지 파일만 첨부 가능합니다.</p>
			<input type="file" accept="image/*" class="btn btn-primary pull-left" name="tip_img">
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
</body>
</html>