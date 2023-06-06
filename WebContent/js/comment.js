function comment_click()
{
	var comment = document.getElementById("content");
	
	if (comment.value == "")
	{
		alert("댓글 입력 후 등록 버튼을 눌러주세요.");
	}
	else
	{
		document.comment.submit();
	}
}