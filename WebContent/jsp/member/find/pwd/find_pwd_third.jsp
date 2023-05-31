<%@page import="java.sql.*"%>
<%@page import="find.FindPwd" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");
        	String id = request.getParameter("id");
        	String email = request.getParameter("email");
        	
        	FindPwd findpwd = new FindPwd();
        	
        	int chknum = findpwd.chkmailSend(email);
    %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/login.css">
		<title>경민대학교 대나무숲 : 이메일 본인인증</title>
	</head>
	<body>
	<script type="text/javascript">
		function find_pwd_emailchk_result()
		{
			if (document.find_pwd_third.email_chknum.value == "" || document.find_pwd_third.email_chknum.length < 0)
			{
				alert("인증번호를 입력 후 다시 시도해 주세요.");
			}
			else
			{
				if (<%=chknum%> == document.find_pwd_third.email_chknum.value)
				{
					alert("이메일 본인인증이 완료되었습니다.");
					document.find_pwd_third.submit();
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
				<a class="navbar-brand">경민대학교 대나무숲 : 비밀번호 재설정</a>
			</div>
		</nav>
		<div class="container">
			<div class="col-lg-4"></div>
				<div class="col-lg-4">
					<div class="jumbotron" style="padding-top:20px;">
						<form name="find_pwd_third" method="post" action="find_pwd_result.jsp">
							<h3 style="text-align:center;">비밀번호 재설정</h3>
							<h5 style="text-align:center;">이메일로 전송된 인증번호를 입력해 주세요.</h5>
							<div class="form-gruop">
								<input type="text" class="form-control" placeholder="인증번호" name="email_chknum" id="email_chknum" maxlength="5">
								<input type="hidden" value="<%=id %>" name="id" id="id">
								<input type="hidden" value="<%=email %>" name="email" id="email">
							</div>
							<input type="button" class="btn btn-primary form-control" onclick="find_pwd_emailchk_result()" value="본인인증"></input>
						</form>
					</div>
				<div class="col-lg-4"></div>
			</div>
		</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
</body>
</html>