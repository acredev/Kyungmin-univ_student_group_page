function csSend()
{
	var email = document.getElementById("email");
	var title = document.getElementById("title");
	var content = document.getElementById("content");
	var email_chk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if (email.value == "" || title.value == "" || content.value == "")
	{
		alert("입력되지 않은 항목이 있습니다. 모든 항목을 올바르게 입력 후 다시 시도해 주세요.");
	}
	else if (!email_chk.test(email.value))
	{
		alert("문의내용을 회신받을 이메일 주소가 올바르지 않습니다. 이메일을 올바르게 입력 후 다시 시도해 주세요");
		email.focus();
	}
	else
	{
		document.cs.submit();
	}
}