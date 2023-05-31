<%@page import="chk.IdChk"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/join.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 아이디 중복확인</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand">경민대학교 대나무숲 : 아이디 중복확인</a>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form name="idchk">
					<h2 style="text-align:center;">아이디 중복확인</h2>
					<div class="form-gruop">
						<p>
							<%
								IdChk idchk = new IdChk();
							
								int result = idchk.idchk(id);
								
								if (result == 1)
								{%>
									<div style="text-align:center;">
										<a>사용 가능한 아이디입니다.</a>	
										<br>
										<a class="btn btn-primary btn-pull" onclick="idchk_result()" role="button">사용하기</a>
									</div>
								<%
								}
								else
								{%>
									<script type="text/javascript">
										alert("사용 불가능한 아이디입니다. 다른 아이디를 입력 후 다시 시도해 주세요.");
										window.close();
									</script>
								<%
								}%>
					</div>
					</form>
					</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/join.js"></script>
</body>
</html>