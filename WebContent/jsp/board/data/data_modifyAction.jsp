<%@page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
try
{
    // JDBC ����̹� ����
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
    String db_username = "root";
    String db_pwd = "root";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
		
		// ��¥
	  Timestamp today_date = new Timestamp(System.currentTimeMillis());
		
		String uploadDir = this.getClass().getResource("").getPath();
		uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "19831049_finalproject/WebContent/data/upload/board/data_board";
		
		//�� 100M ���� ����
		int maxSize = 1024 * 1024 * 1024;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		String fileName = multipartRequest.getOriginalFileName("data_file");
		String fileRealName = multipartRequest.getFilesystemName("data_file");
		String num = multipartRequest.getParameter("num");
		String writer = multipartRequest.getParameter("writer");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (����ڰ� post_new.jsp ������ �ۼ��� ������ ����)
		String insertQuery = "UPDATE 19831049_finalproject.board_data set title=?, content=?, date=?, data_name=?, data_realName=?, data_route=? WHERE num=" + num;
		
	// SQL ��������, ���ο� ������ ���� �����
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	// VALUES ? ���� �ϳ��� �����Ͽ� ����
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setTimestamp(3, today_date);
	psmt.setString(4, fileName);
	psmt.setString(5, fileRealName);
	psmt.setString(6, "/19831049_finalproject/data/upload/board/data_board/" + fileRealName);
	
	// INSERT �Ͽ� �ݿ��� ���ڵ��� �Ǽ������ ��ȯ
	psmt.executeUpdate();
	
	// ��� �Ϸ�Ǹ�, post_list.jsp(�� ���) ������ �ǵ��� �´�.
	response.sendRedirect("data_board.jsp");
}
catch (Exception ex)
{
    out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
}
%>