<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.io.PrintWriter"%>
<%@ page  import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 자료실 게시판</title>
		<style type="text/css">
			a,a:hover{
				color:#000000;
				text-decoration:none;
			}
		</style>
	</head>
	<body>
		<%
		String user_id = null;
		if (session.getAttribute("id") != null)
		{
			user_id = (String)session.getAttribute("id");
		}
		%>
	<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/19831049_finalproject/jsp/main.jsp">메인</a></li>
					<li><a href="/19831049_finalproject/jsp/board/anonymous/anonymous_board.jsp">익명 게시판</a></li>
					<li><a href="/19831049_finalproject/jsp/board/tip/tip_board.jsp">Tip 게시판</a></li>
					<li class="active"><a href="/19831049_finalproject/jsp/board/data/data_board.jsp">자료실</a></li>
					<li><a href="/19831049_finalproject/jsp/cs/cs.jsp">문의하기</a></li>
					<li><a href="/19831049_finalproject/jsp/etc/about.jsp">프로젝트에 대하여...</a></li>
				</ul>
				<%
				if(user_id == null)
				{%>
					<script type="text/javascript">
						alert("게시판 접근권한이 없습니다. 회원이시면 로그인 후 접근 바라며, 비회원일 경우 회원가입 후 이용해 주세요.");
						location.href="/19831049_finalproject/jsp/main.jsp";
					</script>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/19831049_finalproject/jsp/member/login/Login.jsp">로그인</a></li>
						<li><a href="/19831049_finalproject/jsp/member/join/join.jsp">회원가입</a></li>
					</ul>
				<%
				}
				else
				{%>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="" onclick="mypage_click()">마이페이지</a></li>
						<li><a href="/19831049_finalproject/jsp/member/login/LogoutAction.jsp">로그아웃</a></li>
					</ul>
				<%		
				}%>
			</div>
		</nav>
		<%
		try
		{
			//JDBC 드라이버 연결
			Class.forName("com.mysql.jdbc.Driver");
			String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
			String db_username = "root";
			String db_pwd = "root";
			Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
			
			request.setCharacterEncoding("UTF-8");
			
			String num = request.getParameter("num");
				
			String insertQuery = "SELECT * FROM 19831049_finalproject.board_data WHERE num=" + num;
				
			PreparedStatement psmt = connection.prepareStatement(insertQuery);
			
			ResultSet result = psmt.executeQuery();
			%>
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align:center;border:1px solid #dddddd">
					<%
					while(result.next())
					{%>
						<thead>
							<tr>
								<th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="2"><%=result.getString("title") %></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%=result.getString("writer") %></td>
							</tr>
							<tr>
								<td>작성 일자</td>
								<td colspan="2"><%=result.getTimestamp("date") %></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="height: 200px; text-align: left;"><%=result.getString("content") %></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td colspan="2">
									<%
									if (result.getString("data_route").equals("/19831049_finalproject/data/upload/board/data_board/null"))
									{%>
										첨부파일이 없습니다.
									<%
									}
									else
									{%>
										<a style="color: blue; text-decoration: underline;" href="<%=result.getString("data_route") %>"><%=result.getString("data_realName") %>
											<img src="/19831049_finalproject/img/download.png" style="height:18px;">
										</a>
									<%
									}%>
								</td>
							</tr>
						</tbody>
					</table>
					<%} %>
				<a href="/19831049_finalproject/jsp/board/data/data_board.jsp" class="btn btn-primary">목록</a>
				</div>
			</div>
			<%
			}
			catch(Exception ex)
			{
				out.print(ex.getMessage());
			}
			%>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/main.js"></script>
</body>
</html>