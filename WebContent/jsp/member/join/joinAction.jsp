<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	SimpleDateFormat sDate = new SimpleDateFormat("yyMMddhhmmss");
	String num = (sDate.format(new Date()));
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 회원가입</title>
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
				
				String insertQuery = "INSERT INTO 19831049_finalproject.member VALUES (?, ?, ?, ?, ?, ?)";
				
				PreparedStatement psmt = connection.prepareStatement(insertQuery);
				
				psmt.setString (1, num);
				psmt.setString (2, name);
				psmt.setString (3, id);
				psmt.setString (4, pwd);
				psmt.setString (5, tel);
				psmt.setString (6, email);
				
				psmt.executeUpdate();
				%>
				<script type="text/javascript">
					alert("회원가입이 완료되었습니다.");
				</script>
				<%
				response.sendRedirect("/19831049_finalproject/jsp/member/Login.jsp");
			}
			catch (Exception ex)
			{
				out.print(ex.getMessage());
			}
		%>
	</body>
</html>