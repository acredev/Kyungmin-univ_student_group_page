<%@page import="java.sql.*"%>
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
		String num = request.getParameter("num");
	
		// MySQL�� �����ϱ� ���� �������� insertQuery ���ڿ� ���� (���� ��ϵ� �Խñ��� ������ �ľ�)
		String insertQuery = "DELETE FROM 19831049_finalproject.board_data WHERE num=" + num;
	
		// SQL �������� ���� (MySQL�� ����)�ϱ� ���� ��ü ����
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
		psmt.executeUpdate();
	
	// ��� �Ϸ�Ǹ�, post_list.jsp(�� ���) ������ �ǵ��� �´�.
	%>
	<script>
		alert("�ۼ��� �Ϸ�Ǿ����ϴ�.")
	</script>
	<%
	response.sendRedirect("data_board.jsp");
}
catch (Exception ex)
{
    out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
}
%>