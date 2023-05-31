<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/join.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
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
				<a class="navbar-brand" href="main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
					<li><a href="bbs.jsp">익명 게시판</a></li>
					<li><a href="bbs.jsp">Tip 게시판</a></li>
					<li><a href="bbs.jsp">자료실</a></li>
					<li><a href="/19831049_finalproject/jsp/cs/cs.jsp">문의하기</a></li>
					<li><a href="about.jsp">프로젝트에 대하여...</a></li>
				</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form name="join" method="post" action="joinAction.jsp">
					<h3 style="text-align:center;">회원가입</h3>
					<div class="form-gruop">
						<p>
							<input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="10">
							<a class="btn btn-primary btn-pull" onclick="idchk()" role="button">중복확인</a>
							<a id="id_chk"></a>
						</p>
					</div>
					<div class="form-gruop">
						<p>
							<input type="password" class="form-control" placeholder="비밀번호" name="pwd" id="pwd" maxlength="20">
						</p>
					</div>
					<div class="form-gruop">
						<p>
							<input type="text" class="form-control" placeholder="이름" name="name" maxlength="5">
						</p>
					</div>
					<div class="form-gruop">
						<p>
							<input type="text" class="form-control" placeholder="휴대폰 번호" name="tel" id="tel" oninput="autoHyphen(this)" maxlength="13">
							<a class="btn btn-primary btn-pull" onclick="telchk()" role="button">본인인증</a>
							<a id="tel_chk"></a>
						</p>
					</div>
					<div class="form-gruop">
						<p>
							<input type="text" class="form-control" placeholder="이메일" name="email" id="email" maxlength="30">
							<a class="btn btn-primary btn-pull" onclick="emailchk()" role="button">이메일 인증</a>
							<a id="email_chk"></a>
						</p>
					</div>
					<input type="hidden" name="isIdChkOk" id="isIdChkOk" value="no">
					<input type="hidden" name="isTelChkOk" id="isTelChkOk" value="no">
					<input type="hidden" name="isEmailChkOk" id="isEmailChkOk" value="no">
					<input type="button" class="btn btn-primary form-control" onclick="joinAction()" value="회원가입"></input>
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