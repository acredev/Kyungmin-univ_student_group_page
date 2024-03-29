<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String user_id = null;
		if (session.getAttribute("id") != null)
		{
			user_id = (String)session.getAttribute("id");
		}
%>

<%
try
{
	//JDBC 드라이버 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
	String db_username = "root";
	String db_pwd = "root";
	Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);

	request.setCharacterEncoding("UTF-8");

	// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (member 테이블에 기록된 id 정보값 확인)
	String insertQuery = "DELETE FROM 19831049_finalproject.member WHERE Id=?";

	// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
	PreparedStatement psmt = connection.prepareStatement(insertQuery);

	psmt.setString (1, user_id);
	
	psmt.executeUpdate();
	
	session.invalidate();
	
	%>
	<script>
		alert("회원 탈퇴가 완료되었습니다.");
		close();
		window.opener.close();
		window.opener.opener.document.location.replace("/19831049_finalproject/index.jsp");
	</script>
	<%
}
catch (Exception ex)
{
	out.print(ex.getMessage());
}
%>