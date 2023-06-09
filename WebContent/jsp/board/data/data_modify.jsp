<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 자료실 게시판</title>
	</head>
	<body>
		<%
		String user_id = null;
		if (session.getAttribute("id") != null)
		{
			user_id = (String)session.getAttribute("id");
		}
		
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		%>
		
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="/19831049_finalproject/jsp/main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
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
				
			String insertQuery = "SELECT * FROM 19831049_finalproject.board_data WHERE num=" + num;
				
			PreparedStatement psmt = connection.prepareStatement(insertQuery);
			
			ResultSet result = psmt.executeQuery();
			
			while(result.next())
			{%>
				<div class="container">
				<div class="row">
				<form method="post" action="data_modifyAction.jsp" enctype="multipart/form-data">
					<table class="table table-striped" style="text-align:center;border:1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color:#eeeeee; text-align:center;">게시글 수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" name="writer" maxlength="10" value="<%=user_id %>" readonly></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control" placeholder="제목" name="title" maxlength="30" value="<%=result.getString("title") %>"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px;"><%=result.getString("content")%></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="num" value="<%=num %>">
					<p>* 최대 1GB 까지의 파일만 첨부 가능합니다.</p>
					<p style="color: red;">* 첨부파일은 수정할 수 없습니다. 필요할 경우, 게시글을 삭제 후 재등록 해 주세요.</p>
					<input type="submit" class="btn btn-primary pull-right" value="수정">
				</form>
				</div>
			</div>
			<%
			}
		}
		catch (Exception ex)
		{
			out.print(ex.getMessage());
		}
		%>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/main.js"></script>
</body>
</html>