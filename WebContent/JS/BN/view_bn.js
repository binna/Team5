$(document).ready(function () {
	/* view.jsp */
	// 키워드 값 받아오기
	var $btn_keyword_value = $('#btn_keyword_value').val();
	var $keywordHtml = "";
	
	var $keyword_length = $btn_keyword_value.split(',');
	
	// 마지막에 -1하는 이유는 키워드보다 콤마 하나가 더 많음!
	// 그래서 마지막 하나는 빈 내용이 들어 있음
	for(i = 0; i < $keyword_length.length - 1; i++) {
		$keywordHtml += "<li class='qna-detail__footer__keyword-list-item'>"
			+ $keyword_length[i] + "</li>";
	}
	$("#keyword_list_group").append($keywordHtml);

	
	// 라디오 값 추출하기
	$('.close_popup').click(function(){
		// 신고 유형
		var reportType = $("input:radio[name=report_type]:checked").val();
		// 신고 게시글
		var no = $("#reportQno").val();
		// 신고 아이디
		var reportId = $("#reportID").val();
		
		// 신고페이지로 이동
		location.href="reportWriteOk.community?type=" + reportType + "&no=" + no + "&reportId=" + reportId;
	});
	
}); // end ready()

function chkDelete(no) {
	// 삭제 여부, 다시 확인하고 진행하기
	var message = confirm('삭제하시겠습니까?')
	
	if(message) {
		location.href = "deleteOk.community?no=" + no;
	}
}

//console.log()