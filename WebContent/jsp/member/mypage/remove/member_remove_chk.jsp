<%@page import="java.sql.*" %>
<%@page import="chk.TelChk"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
		String user_id = null;
		if (session.getAttribute("id") != null)
		{
			user_id = (String)session.getAttribute("id");
		}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 회원탈퇴</title>
		<style type="text/css">
			a,a:hover{
				color:#000000;
				text-decoration:none;
			}
		</style>
	</head>
	<body>
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand">경민대학교 대나무숲</a>
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
			
		String insertQuery = "SELECT * FROM 19831049_finalproject.board_data WHERE writer = ?";
			
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
		
		psmt.setString(1, user_id);
		
		ResultSet result = psmt.executeQuery();
		%>
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top:20px;">
					<form name="data_delete_chk" method="post" action="member_removeAction.jsp">
						<h2 style="text-align:center;">회원탈퇴</h2>
						<h5 style="text-align:center;">정말 탈퇴하시겠습니까?<br>작성한 게시글은 삭제되지 않습니다.<br></h5>
						<h5 style="text-align:center; color:red;">※ 탈퇴후에는 복구할 수 없습니다.<br><hr></h5>
						<h5 style="text-align:center;"><작성 게시글 (자료실 게시판)></h5>
						<div class="form-gruop">
							<p>
								<table class="table table-striped" style="text-align:center;border:1px solid #dddddd">
									<thead>
										<tr>
											<th style="background-color:#eeeeee; text-align:center;">번호</th>
											<th style="background-color:#eeeeee; text-align:center;">제목</th>
										</tr>
									</thead>
									<tbody>
									<%
									while (result.next())
									{%>
										<tr>
											<td>
												<%
												if (result.getString("writer").equals(user_id))
												{%>
													<a><%=result.getString("num") %></a>
												<%
												}
												else
												{%>
													<a>DB오류</a>
												<%
												}%>
											</td>
											<td>
												<%
													if (result.getString("writer").equals(user_id))
													{%>
														<a><%=result.getString("title") %></a>
													<%
													}
													else
													{%>
														<a>DB오류</a>
													<%
													}%>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							<p>
								<input type="hidden" name="id" id="id" value="<%=user_id %>">
								<input type="button" class="btn btn-primary form-control" onclick="member_remove_post_delete_click()" value="게시글 일괄삭제">
							</p>
							<p>
								<input type="submit" class="btn btn-primary form-control" style="background-color: red" value="회원탈퇴">
							</p>
						</div>
					</form>
				</div>
			<%
			}
			catch (Exception ex)
			{
				out.print(ex.getMessage());
			}%>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/data_board.js"></script>
	<script src="/19831049_finalproject/js/mypage.js"></script>
	</body>
</html>