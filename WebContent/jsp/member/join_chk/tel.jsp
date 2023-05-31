<%@page import="chk.TelChk"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String tel = request.getParameter("tel");	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/join.css">
		<title>경민대학교 대나무숲 : 휴대폰 본인인증</title>
	</head>
	<body>
	<%
		TelChk telchk = new TelChk();
		int chknum = telchk.telchk(tel);
	%>
		<script type="text/javascript">
			function telchk_result()
			{
				if (document.tel_numchk.tel_chknum.value == "")
				{
					alert("인증번호를 입력 후 다시 시도해 주세요.");
				}
				else
				{
					if (<%=chknum%> == document.tel_numchk.tel_chknum.value)
					{
						alert("휴대폰 본인인증이 완료되었습니다.");
						opener.document.join.isTelChkOk.value = "yes";
						opener.document.join.tel.readOnly = true;
						opener.document.join.tel.style.color = "blue";
						opener.document.join.tel.style.onfocus = "this.blur()";
						window.close();
					}
					else
					{
						alert("휴대폰 본인인증이 실패했습니다. 다시 시도해 주세요.");
					}
				}
			}
		</script>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand">경민대학교 대나무숲 : 휴대폰 본인인증</a>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form name="tel_numchk" method="post" action="telAction.jsp">
					<h2 style="text-align:center;">휴대폰 본인인증</h2>
					<div class="form-gruop">
						<p>
							<input type="text" class="form-control" placeholder="인증번호" name="tel_chknum" id="tel_chknum" maxlength="5">
						</p>
						<p>
							<input type="button" class="btn btn-primary form-control" onclick="telchk_result()" value="본인인증">
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