<%@page import="chk.EmailChk"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	
	EmailChk emailchk = new EmailChk();
	
	int chknum = emailchk.mailSend(email);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/join.css">
		<title>경민대학교 대나무숲 : 이메일 본인인증</title>
	</head>
	<body>
	<script type="text/javascript">
		function emailchk_result()
		{
			if (document.email_numchk.email_chknum.value == "" || document.email_numchk.email_chknum.length < 0)
			{
				alert("인증번호를 입력 후 다시 시도해 주세요.");
			}
			else
			{
				if(<%=chknum%> == document.email_numchk.email_chknum.value)
				{
					alert("이메일 본인인증이 완료되었습니다.");
					opener.document.join.isEmailChkOk.value = "yes";
					opener.document.join.email.readOnly = true;
					opener.document.join.email.style.color = "blue";
					opener.document.join.email.style.onfocus = "this.blur()";
					window.close();
				}
				else
				{
					alert("이메일 본인인증이 실패했습니다. 다시 시도해 주세요.");
				}
			}
		}
	</script>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand">경민대학교 대나무숲 : 이메일 본인인증</a>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form name="email_numchk">
					<h2 style="text-align:center;">이메일 본인인증</h2>
					<div class="form-gruop">
						<p>
							<input type="text" class="form-control" placeholder="인증번호" name="email_chknum" id="email_chknum" maxlength="5">
						</p>
						<p>
							<input type="button" class="btn btn-primary form-control" onclick="emailchk_result()" value="본인인증">
						</p>
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