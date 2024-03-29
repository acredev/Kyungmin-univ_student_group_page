<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
try
{
    // JDBC 드라이버 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
    String db_username = "root";
    String db_pwd = "root";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
	
		// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (게시글 넘버를 전송해 해당 게시글 정보를 삭제)
		String insertQuery = "DELETE FROM 19831049_finalproject.board_data WHERE num=" + num;
	
		// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
		psmt.executeUpdate();
	
	// 모두 완료되면, alert 알림
	%>
	<script>
		alert("게시글 삭제가 완료되었습니다.");
		close();
		window.opener.document.location.reload();
	</script>
	<%
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>