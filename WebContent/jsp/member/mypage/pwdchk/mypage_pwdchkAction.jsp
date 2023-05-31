<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String user_id = null;
		if (session.getAttribute("id") != null)
		{
			user_id = (String)session.getAttribute("id");
		}
		
		request.setCharacterEncoding("UTF-8");
		String pwd = request.getParameter("pwd");
		
		try
		{
			//JDBC 드라이버 연결
			Class.forName("com.mysql.jdbc.Driver");
			String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
			String db_username = "root";
			String db_pwd = "root";
			Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
			
			// MySQL로 전송하기 위한 문자열 insertQuery 변수 선언
			String insertQuery = "SELECT pwd FROM 19831049_finalproject.member WHERE id=?";
			
			// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
			PreparedStatement psmt = connection.prepareStatement(insertQuery);
			
			// 앞서 선언했던 insertQuery 변수의 ? 값에 하나씩 삽입하여 전송
			psmt.setString (1, user_id);
			
			ResultSet result = psmt.executeQuery();
			
			if (result.next() == true)
			{
				String db_user_pwd = result.getString("pwd");
				
				if (pwd.equals(db_user_pwd))
				{%>
					<script type="text/javascript">
						window.close();
						popupWindow = window.open("/19831049_finalproject/jsp/member/mypage/mypage.jsp", "_blank","resizeable","toolbar=no");
						popupWindow.resizeTo(500,800);
					</script>
				<%
				}
				else
				{%>
					<script type="text/javascript">
						alert("비밀번호가 일치하지 않습니다.");
						location.href="mypage_pwdchk.jsp";
					</script>
				<%
				}
			}
			else
			{%>
				<script type="text/javascript">
					alert("비밀번호가 일치하지 않습니다.");	
					window.close();
				</script>
			<%
			}
		}
		catch (Exception ex)
		{
			
		}
%>