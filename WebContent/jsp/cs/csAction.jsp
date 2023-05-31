<%@page import="cs.CsEmail"%>
<%@page import="chk.EmailChk"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CsEmail csEmail = new CsEmail();
	
	boolean result = csEmail.csMailSend(email, title, content);
	
	String user_id = request.getParameter("id");
	//세션에 MEMBERID 객체를 저장 (user_id 정보를 가져옴)
	session.setAttribute("MEMBERID", user_id);
	//MEMBERID 객체의 값을 memberId 문자열 변수에 저장
	String memberId = (String)session.getAttribute("MEMBERID");
	//만약, memberId 값이 null 이면 false(비로그인 상태)
	//memberId 값이 무언가 있다면 true(로그인 상태)
	boolean login = memberId == null ? false : true;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="/19831049_finalproject/css/bootstrap.css">
		<link rel="stylesheet" href="/19831049_finalproject/css/join.css">
		<title>경민대학교 대나무숲 : 이메일 본인인증</title>
	</head>
	<body>
		<script type="text/javascript">
			window.onload = function emailchk_result()
			{
				if (<%=result%> == true)
				{
					alert("문의접수가 완료되었습니다. 관리자가 확인 후, 빠른 시일 내 작성해주신 주소로 회신답변을 보내드리겠습니다.");
				}
				else
				{
					if(<%=result%> == false)
					{
						alert("이메일 발송이 실패했습니다.");
					}
					else
					{
						alert("이메일 발송이 실패했습니다.");
					}
				}
			}
		</script>
	</body>
</html>