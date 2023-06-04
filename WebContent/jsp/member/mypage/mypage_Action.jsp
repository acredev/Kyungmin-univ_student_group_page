<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	try
	{
		//JDBC 드라이버 연결
		Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
		String db_username = "root";
		String db_pwd = "root";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
		
		String insertQuery = "UPDATE kyungmin_store.member set name=?, pwd=?, tel=?, email=? WHERE id=?";
		
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
		
		psmt.setString (1, name);
		psmt.setString (2, pwd);
		psmt.setString (3, tel);
		psmt.setString (4, email);
		
		psmt.executeUpdate();
		%>
		<script type="text/javascript">
			alert("회원정보 변경이 완료되었습니다.");
			window.close();
		</script>
		<%
	}
	catch (Exception ex)
	{
		out.print(ex.getMessage());
	}
%>