const autoHyphen = (target) =>
{
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

function idchk()
{
	var id = document.getElementById("id");
	var id_chk = /^[a-z]+[a-z0-9]{5,19}$/;
	if (id.value == "")
	{
		alert("아이디 입력 후 다시 시도해 주세요.");
		id.focus();
	}
	else if (!id_chk.test(id.value))
	{
		alert("아이디에는 영문자, 숫자 조합 5자리 이상 10자리 이하만 입력 가능합니다. 다시 시도해 주세요.");
		id.focus();
	}
	else if (id.value.length <= 4)
	{
		alert("아이디는 5자리 이상, 10자리 이하로 입력 바랍니다.");
		id.focus();
	}
	else
	{
		popupWindow = window.open("/19831049_finalproject/jsp/member/join_chk/id.jsp?id=" + id.value, "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,400);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,400);
		})
	}
}

function idchk_result()
{
	opener.document.join.id.value == document.idchk.id.value;
	opener.document.join.isIdChkOk.value = "yes";
	opener.document.join.id.readOnly = true;
	opener.document.join.id.style.color = "blue";
	opener.document.join.id.style.onfocus = "this.blur()";
	window.close();
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
		popupWindow = window.open("/19831049_finalproject/jsp/member/join_chk/tel.jsp?tel=" + tel.value, "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,400);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,400);
		})	
	}
}

function tel_numchk()
{
	document.tel_numchk.submit();
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
		popupWindow = window.open("/19831049_finalproject/jsp/member/join_chk/email.jsp?email=" + email.value, "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,400);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,400);
		})	
	}
}

function joinAction()
{
	var isIdChkOK = document.getElementById("isIdChkOk");
	var isTelChkOK = document.getElementById("isTelChkOk");
	var isEmailChkOK = document.getElementById("isEmailChkOk");

	if (isIdChkOk.value == "yes" && isTelChkOk.value == "yes" && isEmailChkOk.value == "yes")
	{
		alert("회원가입이 완료되었습니다.");
		document.join.submit();
	}
	else
	{
		alert("아이디 중복확인, 휴대폰 본인인증, 이메일 본인인증 중 하나 이상이 정상적으로 완료되지 않았습니다. 완료 후 다시 시도 바랍니다.");
	}
}