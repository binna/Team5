// 윤주

$(document).ready(function(){
	
	$("#product_main_nav").slideUp(0);
	
	$("#category_li").mouseenter(function(){
		$("#product_main_nav").slideDown(300);

	});
	$("#product_main_nav").mouseleave(function(){
		$("#product_main_nav").slideUp(300);

	});
	
	
	
	//$('button[id^="main_qlist_answer_2_"]').hide(); 
	$('input[id^="main_qlist_input_"]').hide()
	
	$('button[id^="main_qlist_answer_1_"]').click(function(){
		var id = $(this).attr('id').split("_")[4];

			$('#main_qlist_input_'+id).show()
			$('#main_qlist_answer_1_'+id).hide();
			$('#main_qlist_answer_2_'+id).show();
			
		
	});
	$('button[id^="main_qlist_answer_2_"]').click(function(){
		var id = $(this).attr('id').split("_")[4];
		
		$('#main_qlist_input_'+id).hide()
		$('#main_qlist_answer_2_'+id).hide();
		$('#main_qlist_answer_1_'+id).show();
		
		
	});
	/*$('button[id^="main_qlist_answer_1_"]').click(function(){
		var id = $(this).attr('id').split("_")[4];
		
		var text = $(this).text().trim();
		if(text=="등록 완료"){
			$('#main_qlist_input_'+id).hide()
			$(this).text("답변 등록")
		}else{
			$('#main_qlist_input_'+id).show()
			$(this).text("등록 완료")
		}
		
	});*/
	
	/*var qcontent = $('input[id^="main_qlist_input_"]').val()
	if(qcontent==""){
		var id = $(this).attr('id').split("_")[4];
		//답변예쩡
		$('#A_status_'+id).css("background-color","#ccc")
	}else{
		var id = $(this).attr('id').split("_")[4];
		//답변완료
		$('#A_status_'+id).css("background-color","#FFB4B4")
	}*/
	
});
