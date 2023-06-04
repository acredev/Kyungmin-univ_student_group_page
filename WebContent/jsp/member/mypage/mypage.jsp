<%@page import="java.sql.*"%>
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
		<link rel="stylesheet" href="/19831049_finalproject/css/mypage.css">
		<link rel="icon" href="/19831049_finalproject/img/favicon.png" type="image/x-icon" sizes="16x16">
		<title>경민대학교 대나무숲 : 마이 페이지</title>
	</head>
	<body>		
		<nav class="navbar  navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="main.jsp">경민대학교 대나무숲</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/19831049_finalproject/jsp/main.jsp">메인</a></li>
					<li><a href="bbs.jsp">익명 게시판</a></li>
					<li><a href="bbs.jsp">Tip 게시판</a></li>
					<li><a href="bbs.jsp">자료실</a></li>
					<li><a href="/19831049_finalproject/jsp/cs/cs.jsp">문의하기</a></li>
					<li><a href="/19831049_finalproject/jsp/etc/about.jsp">프로젝트에 대하여...</a></li>
				</ul>
				<%
				if(user_id == null)
				{%>
					<script type="text/javascript">
						alert("로그인 후 이용해 주세요.");
						location.href="/19831049_finalproject/jsp/member/login/Login.jsp"
					</script>
				<%
				}
				else
				{%>
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="">마이페이지</a></li>
						<li><a href="/19831049_finalproject/jsp/member/login/LogoutAction.jsp">로그아웃</a></li>
					</ul>
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
						
						// MySQL로 전송하기 위한 문자열 insertQuery 변수 선언
						String insertQuery = "SELECT * FROM 19831049_finalproject.member WHERE id=?";
						
						// SQL 쿼리문을 실행 (MySQL로 전송)하기 위한 객체 선언
						PreparedStatement psmt = connection.prepareStatement(insertQuery);
						
						// 앞서 선언했던 insertQuery 변수의 ? 값에 하나씩 삽입하여 전송
						psmt.setString (1, user_id);
						
						ResultSet result = psmt.executeQuery();
						
						if (result.next() == true)
						{
							String num = result.getString("num");
							String name = result.getString("name");
							String id = result.getString("id");
							String tel = result.getString("tel");
							String email = result.getString("email");%>
							
							<div class="container">
								<div class="col-lg-4"></div>
								<div class="col-lg-4">
									<div class="jumbotron" style="padding-top:20px;">
										<form name="mypage" method="post" action="mypage_Action.jsp">
											<h3 style="text-align:center;">마이페이지</h3>
											<div style="text-align:left;">
												<a>■ 회원번호</a>
												<input type="text" class="form-control" name="num" id="num" value="<%=num %>" readonly>
											</div>
											<div style="text-align:left;">
												<a>■ 이름</a>
												<input type="text" class="form-control" name="name" id="name" value="<%=name %>">
											</div>
											<div style="text-align:left;">
												<a>■ 아이디</a>
												<input type="text" class="form-control" name="id" id="id" value="<%=id %>" readonly>
											</div>
											<div style="text-align:left;">
												<a>■ 비밀번호</a>
												<input type="password" class="form-control" name="pwd" id="pwd" onchange="mypage_pwd_change()" placeholder="변경할 비밀번호를 입력해 주세요.">
											</div>
											<div style="text-align:left;">
												<a>■ 휴대폰 번호</a>
												<input type="text" class="form-control" name="tel" id="tel" value="<%=tel %>" readonly>
												<input type="submit" class="btn btn-primary form-control" value="휴대폰 번호 변경"></input>
											</div>
											<div style="text-align:left;">
												<a>■ 이메일</a>
												<input type="text" class="form-control" name="email" id="email" value="<%=email %>" readonly>
												<input type="button" class="btn btn-primary form-control" name="emailchk" id="emailchk" onclick="mypage_email_change_click()" value="이메일 주소 변경"></input>
												<br>
											</div>
											<div style="text-align:left;">
												<h5>※ 회원번호는 회원가입시 자동 생성됩니다. 변경이 불가능합니다.</h5>
												<h5>※ 아이디는 변경이 불가능합니다.</h5>
												<h5>※ 개명 등의 사유가 필요할 경우, 이름 변경이 가능합니다.</h5>
												<h5>※ 보안적인 이유로 비밀번호는 표시되지 않습니다. 기존 비밀번호를 입력해 주시거나, 새 비밀번호를 입력 후 저장 바랍니다.</h5>
												<h5>※ 휴대폰 번호와 이메일 주소는 본인인증 후 변경이 가능합니다.</h5>
											</div>
											<div>
												<input type="text" id="isNameChange" name="isNameChange" value="no">
												<input type="text" id="isPwdChange" name="isPwdChange" value="no">
												<input type="text" id="isTelChange" name="isTelChange" value="no">
												<input type="text" id="isEmailChange" name="isEmailChange" value="no">
												<input type="button" class="btn btn-primary form-control" onclick="mypage_save()" value="변경정보 저장"></input>
											</div>
										</form>
									</div>
									<div class="col-lg-4"></div>
								</div>
							</div>
							<%
						}
						else
						{
							out.print("error");
						}
					}
					catch (Exception ex)
					{
						
					}
				}%>
			
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/19831049_finalproject/js/bootstrap.js"></script>
	<script src="/19831049_finalproject/js/mypage.js"></script>
</body>
</html>