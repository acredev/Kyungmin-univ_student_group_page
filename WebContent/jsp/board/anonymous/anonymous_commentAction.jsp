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
    String post_num = request.getParameter("post_num");
    String content = request.getParameter("content");
    
		// ��� ��ȣ�� �����ϱ� ���� �ӽ� ������ ���� ����
		int writer = 0;
	
		// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (���� ��ϵ� ����� ������ �ľ�)
		String insertQuery = "SELECT MAX(writer) from 19831049_finalproject.comment_anonymous WHERE post_num=?";
	
		// SQL �������� ���� (MySQL�� ����)�ϱ� ���� ��ü ����
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
		
		psmt.setString (1, post_num);
	
		// ��ȸ�� ��������� �����ϱ� ���� ResultSet ��ü ����
		ResultSet result = psmt.executeQuery();
	
		// �޾ƿ� ������ ������
		while(result.next())
		{
      // �ռ� �ӽ� ������ num ������, ������ MAX(num) Į���� + 1�� �Ͽ� ����
	    writer = result.getInt("MAX(writer)") + 1;
		}
		
		// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (����ڰ� ��ۿ��� �ۼ��� ������ ����)
		insertQuery = "INSERT INTO 19831049_finalproject.comment_anonymous(post_num, writer, content) VALUES (?, ?, ?)";
		
		// SQL ��������, ���ο� ������ ���� �����
		psmt = connection.prepareStatement(insertQuery);
	
		// VALUES ? ���� �ϳ��� �����Ͽ� ����
		psmt.setString(1, post_num);
		psmt.setInt(2, writer);
		psmt.setString(3, content);
	
		// INSERT �Ͽ� �ݿ��� ���ڵ��� �Ǽ������ ��ȯ
		psmt.executeUpdate();
	
		// ��� �Ϸ�Ǹ� alert�� �˸�
		%>
		<script type="text/javascript">
			alert("�ۼ��� �Ϸ�Ǿ����ϴ�.")
		</script>
		<%
		response.sendRedirect("anonymous_read.jsp?num=" + post_num);
}
catch (Exception ex)
{
    out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
}
%>