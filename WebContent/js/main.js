function mypage_click()
{
	popupWindow = window.open("/19831049_finalproject/jsp/member/mypage/pwdchk/mypage_pwdchk.jsp", "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,450);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,450);
		})
}