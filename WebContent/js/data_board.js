function delete_click()
{
	document.getElementById("num");
	document.getElementById("title");
	popupWindow = window.open("/19831049_finalproject/jsp/board/data/data_delete.jsp?num=" + num.innerHTML, "_blank","resizeable","toolbar=no");
		popupWindow.resizeTo(500,400);
		popupWindow.onresize=(_=>{
			popupWindow.resizeTo(500,400);
		})
}