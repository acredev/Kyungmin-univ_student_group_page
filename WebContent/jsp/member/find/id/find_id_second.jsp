
<%@page import="find.FindId"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
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
	<%
	try
	{
		//JDBC 드라이버 연결
		Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
		String db_username = "root";
		String db_pwd = "root";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
		
		// MySQL로 전송하기 위한 문자열 insertQuery 변수 선언
		String insertQuery = "SELECT email from 19831049_finalproject.member where email=?;";
					
		// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
					
		// 앞서 문자열 쿼리문을 선언했던 VALUES의 ? 값에 하나씩 삽입하여 전송
		psmt.setString(1, email);
					
		// 쿼리문을 전송해 받아온 정보를 result 객체에 저장
		ResultSet result = psmt.executeQuery();
		
		if (result.next() == true)
		{
			FindId findid = new FindId();
			
			int chknum = findid.findmailSend(email);
			%>
			<script type="text/javascript">
				function emailchk_result()
				{
					if (document.find_id_email_chk.email_chknum.value == "" || document.find_id_email_chk.email_chknum.length < 0)
					{
						alert("인증번호를 입력 후 다시 시도해 주세요.");
					}
					else
					{
						if(<%=chknum%> == document.find_id_email_chk.email_chknum.value)
						{
							alert("이메일 본인인증이 완료되었습니다.");
							document.find_id_email_chk.submit();
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
							<form name="find_id_email_chk" action="find_id_result.jsp" method="post">
								<h2 style="text-align:center;">이메일 본인인증</h2>
								<div class="form-gruop">
									<p>
										<input type="hidden" name="email" id="email" value="<%=email %>">
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
		<%
		}
	}
	catch (Exception ex)
	{%>
		<script type="text/javascript">
			alert("DB연결 오류가 발생했습니다.");
		</script>
	<%
	}
	%>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/join.js"></script>
</body>
</html>