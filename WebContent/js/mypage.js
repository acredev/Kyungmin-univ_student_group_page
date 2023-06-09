function mypage_name_change()
{
	var isNameChange = document.getElementById("isNameChange");
	
	isNameChange.value = "yes";
}

function mypage_pwd_change()
{
	var isPwdChange = document.getElementById("isPwdChange");
	
	isPwdChange.value = "yes";
}

function mypage_tel_change_click()
{
	popupWindow = window.open("/19831049_finalproject/jsp/member/mypage/telchk/tel.jsp", "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,400);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,400);
		})
}

function telchk()
{
	var tel = document.getElementById("tel");
	var tel_chk = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if (tel.value == "")
	{
		alert("휴대폰 번호가 입력되지 않았습니다. 휴대폰 번호 입력 후 다시 시도 바랍니다.");
		tel.focus();
	}
	else if (!tel_chk.test(tel.value))
	{
		alert("휴대폰 번호 형식에 맞지 않습니다. 휴대폰 번호를 올바르게 입력 후 다시 시도해 주세요.");
		tel.focus();
	}
	else
	{
		document.tel.submit();	
	}
}

function mypage_email_change_click()
{
	popupWindow = window.open("/19831049_finalproject/jsp/member/mypage/emailchk/email.jsp", "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,400);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,400);
		})
}

function emailchk()
{
	var email = document.getElementById("email");
	var email_chk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if (email.value == "")
	{
		alert("이메일 주소가 입력되지 않았습니다. 휴대폰 번호 입력 후 다시 시도 바랍니다.");
		email.focus();
	}
	else if (!email_chk.test(email.value))
	{
		alert("이메일 형식에 맞지 않습니다. 이메일을 올바르게 입력 후 다시 시도해 주세요.");
		email.focus();
	}
	else
	{
		document.email.submit();
	}
}

function mypage_save()
{
	var name = document.getElementById("name");
	var pwd = document.getElementById("pwd");
	var isNameChange = document.getElementById("isNameChange");
	var isPwdChange = document.getElementById("isPwdChange");
	var isTelChange = document.getElementById("isTelChange");
	var isEmailChange = document.getElementById("isEmailChange");
	
	if (isNameChange.value == "no" && isPwdChange.value == "no" && isTelChange.value == "no" && isEmailChange.value == "no")
	{
		alert("변경사항이 없습니다.");
	}
	else if (name.value == "" && pwd.value == "")
	{
		alert("이름과 비밀번호는 공백일 수 없습니다. 입력 후 다시 시도해 주세요.");
	}
	else if (name.value != "" && pwd.value != "")
	{
		if (isNameChange.value == "yes" || isPwdChange.value == "yes" || isTelChange.value == "yes" || isEmailChange.value == "yes")
		{
			document.mypage.submit();
		}
		else
		{
			alert("알 수 없는 오류가 발생했습니다.");
		}
	}
	else
	{
		alert("알 수 없는 오류가 발생했습니다.");
	}
}

function member_remove_click()
{
	var id = document.getElementById("id");
	
	popupWindow = window.open("/19831049_finalproject/jsp/member/mypage/remove/member_remove_chk.jsp", "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,850);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,850);
		})
}

function member_remove_post_delete_click()
{
	var id = document.getElementById("id");
	
	location.href="/19831049_finalproject/jsp/member/mypage/remove/member_remove_post_deleteAction.jsp?id=" + id.value;
}