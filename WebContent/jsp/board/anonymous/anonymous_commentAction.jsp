<%@page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
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
    String post_num = request.getParameter("post_num");
    String content = request.getParameter("content");
    
		// 댓글 번호를 결정하기 위한 임시 정수형 변수 선언
		int writer = 0;
	
		// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (현재 등록된 댓글의 갯수를 파악)
		String insertQuery = "SELECT MAX(writer) from 19831049_finalproject.comment_anonymous WHERE post_num=?";
	
		// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
		
		psmt.setString (1, post_num);
	
		// 조회된 결과물들을 저장하기 위한 ResultSet 객체 선언
		ResultSet result = psmt.executeQuery();
	
		// 받아온 정보가 있을때
		while(result.next())
		{
      // 앞서 임시 선언한 num 변수에, 가져온 MAX(num) 칼럼값 + 1을 하여 저장
	    writer = result.getInt("MAX(writer)") + 1;
		}
		
		// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (사용자가 댓글에서 작성한 정보를 전송)
		insertQuery = "INSERT INTO 19831049_finalproject.comment_anonymous(post_num, writer, content) VALUES (?, ?, ?)";
		
		// SQL 쿼리문을, 새로운 내용을 토대로 재실행
		psmt = connection.prepareStatement(insertQuery);
	
		// VALUES ? 값에 하나씩 삽입하여 전송
		psmt.setString(1, post_num);
		psmt.setInt(2, writer);
		psmt.setString(3, content);
	
		// INSERT 하여 반영된 레코드의 건수결과를 반환
		psmt.executeUpdate();
	
		// 모두 완료되면 alert로 알림
		%>
		<script type="text/javascript">
			alert("작성이 완료되었습니다.")
		</script>
		<%
		response.sendRedirect("anonymous_read.jsp?num=" + post_num);
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>