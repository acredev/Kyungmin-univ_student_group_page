function find_id_click()
{
		popupWindow = window.open("/19831049_finalproject/jsp/member/find/id/find_id.jsp", "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,450);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,450);
		})
}

function find_id_first_click()
{
	var email = document.getElementById("email");
	var name = document.getElementById("name");
	var email_chk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if (email.value == "" || name.value == "")
	{
		alert("모든 항목이 입력되지 않았습니다. 모든 항목을 입력 후 다시 시도 바랍니다.");
	}
	else if (!email_chk.test(email.value))
	{
		alert("이메일 형식에 맞지 않습니다. 이메일을 올바르게 입력 후 다시 시도해 주세요.");
		email.focus();
	}
	else
	{
		document.find_id.submit();
	}
}

function find_pwd_click()
{
		popupWindow = window.open("/19831049_finalproject/jsp/member/find/pwd/find_pwd.jsp", "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,450);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,450);
		})
}

function find_pwd_first_click()
{
	var id = document.getElementById("id");
	
	if (id.value == "")
	{
		alert("아이디가 입력되지 않았습니다. 입력 후 다시 시도 바랍니다.");
		id.focus();
	}
	else
	{
		document.find_pwd.submit();
	}
}

function find_pwd_result_close()
{
	window.close();
}