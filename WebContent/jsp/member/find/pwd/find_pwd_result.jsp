<%@page import="find.FindPwd"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	FindPwd randomPwd = new FindPwd();
	
	String randomPwd_create = randomPwd.resetmailSend(email);
	
	boolean pwdUpdate = false;
	
	try
	{
		//JDBC 드라이버 연결
		Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
		String db_username = "root";
		String db_pwd = "root";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
		
		String insertQuery = "UPDATE 19831049_finalproject.member SET pwd='" + randomPwd_create + "' WHERE id = '" + id + "';";
		
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
		
		int result = psmt.executeUpdate(insertQuery);
		
		if (result == 1)
		{
			pwdUpdate = true;
		}
		else
		{
			pwdUpdate = false;
		}
	
	}
	catch (Exception ex)
	{
		pwdUpdate = false;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/login.css">
		<title>경민대학교 대나무숲 : 비밀번호 재설정</title>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲 : 비밀번호 재설정</a>
			</div>
	</nav>
	<%
		if (pwdUpdate == true)
		{%>
			<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top:20px;">
					<form method="post" action="LoginAction.jsp">
						<h3 style="text-align:center;">비밀번호 재설정</h3>
						<h5 style="text-align:center;">임시 비밀번호가 이메일로 발송되었습니다. 로그인 후, 마이페이지에서 비밀번호를 변경해 주세요.</h5>
						<input type="submit" class="btn btn-primary form-control" onclick="find_pwd_result_close()" value="닫기"></input>
					</form>
				</div>
				<div class="col-lg-4"></div>
			</div>
		</div>
		<%
		}
		else if (pwdUpdate == false)
		{%>
			<script type="text/javascript">
				alert("오류가 발생했습니다.");
			</script>
		<%
		}
		else
		{%>
		<script type="text/javascript">
			alert("오류가 발생했습니다.");
		</script>
	<%
	}
	%>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/find.js"></script>
</body>
</html>