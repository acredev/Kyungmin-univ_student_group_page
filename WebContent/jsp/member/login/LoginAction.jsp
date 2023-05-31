<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
try
{
	//JDBC 드라이버 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db_address = "jdbc:mysql://127.0.0.1:3306/kyungmin_store";
	String db_username = "root";
	String db_pwd = "root";
	Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
	
	// 문자열의 인코딩 방식 설정
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터를 통해 받아온 값을 변수에 저장
	String user_id = request.getParameter("id");
	String user_pwd = request.getParameter("pwd");
	
	// MySQL로 전송하기 위한 문자열 insertQuery 변수 선언
	String insertQuery = "SELECT name, id, pwd FROM 19831049_finalproject.member WHERE id=?";
	
	// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	// 앞서 선언했던 insertQuery 변수의 ? 값에 하나씩 삽입하여 전송
	psmt.setString (1, user_id);
	
	ResultSet result = psmt.executeQuery();
	
	if (result.next() == true)
	{
		String db_user_name = result.getString("name");
		String db_user_id = result.getString("id");
		String db_user_pwd = result.getString("pwd");
		
		if (user_id.equals(db_user_id) && user_pwd.equals(db_user_pwd))
		{
			session.setAttribute("id", user_id);%>
			<form name="LoginAction" action="/19831049_finalproject/jsp/main.jsp" method="post">
				<script type="text/javascript">
					alert("<%=db_user_name%>님, 환영합니다.");
					location.href="/19831049_finalproject/jsp/main.jsp";
				</script>
			</form>
		<%
		}
		else
		{%>
			<script type="text/javascript">
				alert("로그인 정보가 일치하지 않습니다. 아이디와 비밀번호를 확인 후 다시 시도해 주세요.");
				location.href="Login.jsp";
			</script>
		<%
		}
	}
	else
	{%>
		<script type="text/javascript">
			alert("로그인 정보가 일치하지 않습니다. 아이디와 비밀번호를 확인 후 다시 시도해 주세요.");
			location.href="Login.jsp";
		</script>
<%
	}
}
catch (Exception ex)
{
	out.print(ex.getMessage());
}
%>