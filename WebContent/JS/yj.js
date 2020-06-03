// 윤주

$(document).ready(function(){
	
	$("#product_main_nav").slideUp(0);
	
	$("#category_li").mouseenter(function(){
		$("#product_main_nav").slideDown(300);

	});
	$("#product_main_nav").mouseleave(function(){
		$("#product_main_nav").slideUp(300);

	});
	
	
	
	$("#main_qlist_answer_2").hide(); 
	$("#main_qlist_answer_1").click(function(){
		$("#main_qlist_answer_1").hide(); 
		$("#main_qlist_answer_2").show(); 
	});
	$("#main_qlist_answer_2").click(function(){
		$("#main_qlist_answer_2").hide(); 
		$("#main_qlist_answer_1").show(); 
	});
	
});
