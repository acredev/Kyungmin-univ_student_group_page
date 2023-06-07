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
		
		// 날짜
	  Timestamp today_date = new Timestamp(System.currentTimeMillis());
		
		String uploadDir = this.getClass().getResource("").getPath();
		uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "19831049_finalproject/WebContent/data/upload/board/data_board";
		
		//총 100M 까지 저장
		int maxSize = 1024 * 1024 * 1024;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		String fileName = multipartRequest.getOriginalFileName("data_file");
		String fileRealName = multipartRequest.getFilesystemName("data_file");
		String num = multipartRequest.getParameter("num");
		String writer = multipartRequest.getParameter("writer");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (사용자가 post_new.jsp 폼에서 작성한 정보를 전송)
		String insertQuery = "UPDATE 19831049_finalproject.board_data set title=?, content=?, date=?, data_name=?, data_realName=?, data_route=? WHERE num=" + num;
		
	// SQL 쿼리문을, 새로운 내용을 토대로 재실행
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	// VALUES ? 값에 하나씩 삽입하여 전송
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setTimestamp(3, today_date);
	psmt.setString(4, fileName);
	psmt.setString(5, fileRealName);
	psmt.setString(6, "/19831049_finalproject/data/upload/board/data_board/" + fileRealName);
	
	// INSERT 하여 반영된 레코드의 건수결과를 반환
	psmt.executeUpdate();
	
	// 모두 완료되면, post_list.jsp(글 목록) 폼으로 되돌아 온다.
	response.sendRedirect("data_board.jsp");
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>