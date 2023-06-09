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
		
		String num = request.getParameter("num");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 게시글 삭제</title>
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
			
		String insertQuery = "SELECT * FROM 19831049_finalproject.board_data WHERE num=" + num;
			
		PreparedStatement psmt = connection.prepareStatement(insertQuery);
		
		ResultSet result = psmt.executeQuery();
		%>
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top:20px;">
					<form name="data_delete_chk" method="post" action="data_deleteAction.jsp">
						<h2 style="text-align:center;">게시글 삭제</h2>
						<h5 style="text-align:center;">아래의 게시글이 삭제됩니다.<br></h5>
						<h5 style="text-align:center; color:red;">※ 삭제후에는 복구할 수 없습니다.</h5>
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
									if (result.next() == true)
									{%>
										<tr>
											<td>
												<a><%=num %></a>
												<input type="hidden" id="num" name="num" value="<%=num %>">
											</td>
											<td>
												<a><%=result.getString("title") %></a>
											</td>
										</tr>
										<%}%>
									</tbody>
								</table>
							</p>
							<p>
							<input type="submit" class="btn btn-primary form-control" value="게시글 삭제">
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
	</body>
</html>