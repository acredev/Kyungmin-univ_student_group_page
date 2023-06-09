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
    
		// 게시글 번호를 결정하기 위한 임시 정수형 변수 선언
		int num = 0;
	
		// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (현재 등록된 게시글의 갯수를 파악)
		String insertQuery = "SELECT MAX(num) from 19831049_finalproject.board_data";
	
		// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
		// 조회된 결과물들을 저장하기 위한 ResultSet 객체 선언
		ResultSet result = psmt.executeQuery();
	
		// 받아온 정보가 있을때
		while(result.next())
		{
      // 앞서 임시 선언한 num 변수에, 가져온 MAX(num) 칼럼값 + 1을 하여 저장
	    num = result.getInt("MAX(num)") + 1;
		}
		
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
		String writer = multipartRequest.getParameter("writer");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		// MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언 (사용자가 신규 게시글 작성한 정보를 전송)
		insertQuery = "INSERT INTO 19831049_finalproject.board_data(num, title, writer, content, date, data_name, data_realName, data_route) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
	// SQL 쿼리문을, 새로운 내용을 토대로 재실행
	psmt = connection.prepareStatement(insertQuery);
	
	// VALUES ? 값에 하나씩 삽입하여 전송
	psmt.setInt(1, num);
	psmt.setString(2, title);
	psmt.setString(3, writer);
	psmt.setString(4, content);
	psmt.setTimestamp(5, today_date);
	psmt.setString(6, fileName);
	psmt.setString(7, fileRealName);
	psmt.setString(8, "/19831049_finalproject/data/upload/board/data_board/" + fileRealName);
	
	// INSERT 하여 반영된 레코드의 건수결과를 반환
	psmt.executeUpdate();
	
	// 모두 완료되면, 되돌아옴
	%>
	<script type="text/javascript">
		alert("작성이 완료되었습니다.")
	</script>
	<%
	response.sendRedirect("data_board.jsp");
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>