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
		<link rel="stylesheet" href="/19831049_finalproject/css/login.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 회원가입</title>
	</head>
	<body>
	<%
	try
	{
		//JDBC 드라이버 연결
		Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://127.0.0.1:3306/kyungmin_store";
		String db_username = "root";
		String db_pwd = "root";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
				
		// MySQL로 전송하기 위한 문자열 insertQuery 변수 선언
		String insertQuery = "SELECT id from 19831049_finalproject.member where email=?;";
							
		// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
						
		// 앞서 문자열 쿼리문을 선언했던 VALUES의 ? 값에 하나씩 삽입하여 전송
		psmt.setString(1, email);
							
		// 쿼리문을 전송해 받아온 정보를 result 객체에 저장
		ResultSet result = psmt.executeQuery();
		
		if (result.next() == true)
		{%>
			<nav class="navbar  navbar-default">
				<div class="navbar-header">
					<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲 : 아이디 찾기</a>
				</div>
			</nav>
			<div class="container">
				<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<div class="jumbotron" style="padding-top:20px;">
							<form method="post" action="LoginAction.jsp">
								<h3 style="text-align:center;">아이디 찾기 결과</h3><hr>
								<div class="form-gruop">
									<div style="text-align:center;">
										<h5>요청하신 아이디는</h5>
										<p><%=result.getString("id")%></p>
										<h5>입니다.</h5>
									</div>
								</div>
								<input type="button" class="btn btn-primary form-control" value="닫기"></input>
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
</body>
</html>