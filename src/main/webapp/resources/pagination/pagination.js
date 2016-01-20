var url = location.href;
var containParam = url.indexOf("?") != -1;
var containPageIndex = url.indexOf("pageIndex=") != -1;


$(document).ready(function() {
	$("#Pagination").pagination(pageCount, {
		callback: pageSelectCallback,
		current_page: page
	});
});

function getHref(pageIndex) {
	var href;
	if(!containParam) {   //不包含?
		href = url + "?pageIndex=" + pageIndex;
	} else {  
		if(!containPageIndex) { //不包含pageIndex参数
			href = url + "&pageIndex=" + pageIndex;
		} 
		else {
			href = url.replace(/pageIndex=\d+/, "pageIndex=" + pageIndex);
		}
	}
	
	return href;
}

function pageSelectCallback(page) {
	window.location.href = getHref(page+1);
}

function go() {
	var pageNo = $("#pageNo").val();
	pageNo = parseInt(pageNo);
	if(!isNaN(pageNo)) {
		pageNo = pageNo < 1? 1 : pageNo;
		pageNo = pageNo > pageCount? pageCount : pageNo;
		
		window.location.href = getHref(pageNo);
	}
}