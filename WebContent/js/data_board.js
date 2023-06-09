function delete_click()
{
	var num = document.getElementById("num");
	popupWindow = window.open("/19831049_finalproject/jsp/board/data/data_delete_chk.jsp?num=" + num.value, "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,500);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,500);
		})
}