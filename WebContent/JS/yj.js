// 윤주

$(document).ready(function() {

	$("#product_main_nav").slideUp(0);

	$("#category_li").mouseenter(function() {
		$("#product_main_nav").slideDown(300);

	});
	$("#product_main_nav").mouseleave(function() {
		$("#product_main_nav").slideUp(300);

	});

	// $('button[id^="main_qlist_answer_2_"]').hide();
	$('input[id^="main_qlist_input_"]').hide()

	$('button[id^="main_qlist_answer_1_"]').click(function() {
		var id = $(this).attr('id').split("_")[4];

		$('#main_qlist_input_' + id).show()
		$('#main_qlist_answer_1_' + id).hide();
		$('#main_qlist_answer_2_' + id).show();

	});
	$('button[id^="main_qlist_answer_2_"]').click(function() {
		var id = $(this).attr('id').split("_")[4];

		$('#main_qlist_input_' + id).hide()
		$('#main_qlist_answer_2_' + id).hide();
		$('#main_qlist_answer_1_' + id).show();

	});

	$('div[id^="category_"]').click(function() {
		var code = $(this).attr('id').split("_")[1];
		for (var i = 1; i <=10; i++) {
			$('.category_code_' + i).hide()
		}
		$('.category_code_' + code).show(1000)
	});
	/*
	 * $('button[id^="main_qlist_answer_1_"]').click(function(){ var id =
	 * $(this).attr('id').split("_")[4];
	 * 
	 * var text = $(this).text().trim(); if(text=="등록 완료"){
	 * $('#main_qlist_input_'+id).hide() $(this).text("답변 등록") }else{
	 * $('#main_qlist_input_'+id).show() $(this).text("등록 완료") }
	 * 
	 * });
	 */

	/*
	 * var qcontent = $('input[id^="main_qlist_input_"]').val()
	 * if(qcontent==""){ var id = $(this).attr('id').split("_")[4]; //답변예쩡
	 * $('#A_status_'+id).css("background-color","#ccc") }else{ var id =
	 * $(this).attr('id').split("_")[4]; //답변완료
	 * $('#A_status_'+id).css("background-color","#FFB4B4") }
	 */

	var modal = document.getElementById('QModal')
	var btn = document.getElementById('detail_question_2')

	var span = document.getElementsByClassName('Qclose')[0]
	// TODO
	// 버튼 클릭하면 팝업 보이게 하기
	// 팝업의 x 버튼 누르면 닫히게 하기
	btn.onclick = function() {
		modal.style.display = "block"
	}
	span.onclick = function() {
		modal.style.display = 'none'
	}
	// 팝업창 바깥을 클릭해도 팝업이 닫히게 하기 (modal)<--->(반대 : modeless)
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = 'none'
		}

	}

	// store_main : category

});
