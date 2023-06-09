<%@page import="java.sql.*"%>
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
		<link rel="stylesheet" href="/19831049_finalproject/css/login.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
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
		String insertQuery = "SELECT email from 19831049_finalproject.member where id=?;";
		
		// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
		
		// 앞서 문자열 쿼리문을 선언했던 VALUES의 ? 값에 하나씩 삽입하여 전송
		psmt.setString(1, id);
		
		// 쿼리문을 전송해 받아온 정보를 result 객체에 저장
		ResultSet result = psmt.executeQuery();
		
		if (result.next() == true)
		{%>
			<nav class="navbar  navbar-default">
				<div class="navbar-header">
					<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲 : 비밀번호 재설정</a>
				</div>
			</nav>
			<div class="container">
				<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<div class="jumbotron" style="padding-top:20px;">
							<form name="find_pwd_second" method="post" action="find_pwd_third.jsp">
								<h3 style="text-align:center;">비밀번호 재설정</h3>
								<h5 style="text-align:center;">회원정보에 등록된 이메일을 통한 본인인증을 시작합니다.<br>이메일은 수정할 수 없으며,<br>변경되었을 경우 '문의하기' 를 통해 문의 바랍니다.</h5>
								<div class="form-gruop">
									<input type="text" class="form-control" value="<%=result.getString("email") %>" name="email" id="email" maxlength="30" readonly>
									<input type="hidden" value="<%=id %>" name="id" id="id">
								</div>
								<input type="submit" class="btn btn-primary form-control" value="본인인증"></input>
							</form>
						</div>
					<div class="col-lg-4"></div>
				</div>
			</div>
		<%
		}
		else
		{%>
			<script type="text/javascript">
				alert("회원정보가 존재하지 않습니다. 아이디 찾기 후 다시 시도해 주세요.");
				window.close();
			</script>
		<%
		}
	}
	catch (Exception ex)
	{
		out.print(ex.getMessage());
	}
	%>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
</body>
</html>