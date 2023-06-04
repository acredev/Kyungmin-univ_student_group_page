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
    
		// �Խñ� ��ȣ�� �����ϱ� ���� �ӽ� ������ ���� ����
		int num = 0;
	
		// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (���� ��ϵ� �Խñ��� ������ �ľ�)
		String insertQuery = "SELECT MAX(num) from 19831049_finalproject.board_tip";
	
		// SQL �������� ���� (MySQL�� ����)�ϱ� ���� ��ü ����
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
		// ��ȸ�� ��������� �����ϱ� ���� ResultSet ��ü ����
		ResultSet result = psmt.executeQuery();
	
		// �޾ƿ� ������ ������
		while(result.next())
		{
      // �ռ� �ӽ� ������ num ������, ������ MAX(num) Į���� + 1�� �Ͽ� ����
	    num = result.getInt("MAX(num)") + 1;
		}
		
		// ��¥
	  Timestamp today_date = new Timestamp(System.currentTimeMillis());
		
		String uploadDir = this.getClass().getResource("").getPath();
		uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "19831049_finalproject/WebContent/img/upload/board/tip_board";
		
		//�� 100M ���� ����
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		String fileName = multipartRequest.getOriginalFileName("tip_img");
		String fileRealName = multipartRequest.getFilesystemName("tip_img");
		String writer = multipartRequest.getParameter("writer");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (����ڰ� post_new.jsp ������ �ۼ��� ������ ����)
		insertQuery = "INSERT INTO 19831049_finalproject.board_tip(num, title, writer, content, date, img_name, img_realName, img_route) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
	// SQL ��������, ���ο� ������ ���� �����
	psmt = connection.prepareStatement(insertQuery);
	
	// VALUES ? ���� �ϳ��� �����Ͽ� ����
	psmt.setInt(1, num);
	psmt.setString(2, title);
	psmt.setString(3, writer);
	psmt.setString(4, content);
	psmt.setTimestamp(5, today_date);
	psmt.setString(6, fileName);
	psmt.setString(7, fileRealName);
	psmt.setString(8, "/19831049_finalproject/img/upload/board/tip_board/" + fileRealName);
	
	// INSERT �Ͽ� �ݿ��� ���ڵ��� �Ǽ������ ��ȯ
	psmt.executeUpdate();
	
	// ��� �Ϸ�Ǹ�, post_list.jsp(�� ���) ������ �ǵ��� �´�.
	%>
	<script type="text/javascript">
		alert("�ۼ��� �Ϸ�Ǿ����ϴ�.")
	</script>
	<%
	response.sendRedirect("tip_board.jsp");
}
catch (Exception ex)
{
    out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
}
%>