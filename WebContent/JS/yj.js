// 윤주

$(document).ready(function(){
	
	$("#product_main_nav").slideUp(0);
	
	$("#category_li").mouseenter(function(){
		$("#product_main_nav").slideDown(300);

	});
	$("#product_main_nav").mouseleave(function(){
		$("#product_main_nav").slideUp(300);

	});
});
