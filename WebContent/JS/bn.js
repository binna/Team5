/* write.jsp */
$(document).ready(function () {
	
	// 제목 에러메시지 띄우기
	$("#question_title").keyup(function(){
		// 7자 미만 에러 메시지
		if($(this).val().length < 7) {
			$('#error1').css('display', 'block');
			$('.form-control').css('border', '2px solid red');
		}
		// 7자 이상, 본래의 모습으로
		if($(this).val().length >= 7) {
			$('#error1').css('display', 'none');
			$('.form-control').css('border', '1px solid #ced4da');
		}
	});
	
	// 키워드 1개 이상 선택하도록 에러 메시지 노출
	$('#error2').css('display', 'block');
	
	// Hint에서 문의사항 텍스트로 변경하기
	$('.question-form__body__content__placeholder').click(function() {
		$('.question-form__body__content__placeholder').css('display', 'none');
		$('.question-form__body__content__placeholder__cs').css('display', 'none');
		$('.question-form__body__content__input').css('display', 'block');
	});
	
	// 텍스트 박스에 글씨를 작성했는가 확인하기, 구현 못함

	
	
	// 모델 버튼 활성화
	$(".form-che").click(function(){
		
		var cheLength = $("input[class='form-che']:checked").length;
		// 0개 이상일때 활성화
		if(cheLength > 0) {
			$('#btnCommit').prop('disabled', false);
		} 
		
		// 0개 일때 비활성화
		if(cheLength == 0){
			$('#btnCommit').prop('disabled', true);
		}
		
		// 5개 이상은 경고 팝업
		// 5개 이상 체크박스되면 자동 해지
		if(cheLength > 5){
			alert('키워드는 최대 5개까지 선택 가능합니다.');
			$(this).prop('checked', false);
		}
		
	}); // end 모델버튼 활성화
	
	
	// 선택 완료 버튼
	$("#btnCommit").click(function(){
		// 기존에 혹시 남아 있는 체크리스트 <li> 태그를 삭제
		$(".template").remove();
		
		var arrParam = new Array();
		var cheLength = $("input[class='form-che']:checked").length;
		var keywordHtml = "";

		// checked 값 arrParam에 저장
		var isCheck = false;
		$("input[class='form-che']:checked").each(function(){
			keywordHtml += "<li class='template question-form__keywords__keyword keyword-item'>"
				+ "<button class='btn_keywords' data-toggle='modal' data-target='#modal-tag-select' type='button'>" 
				+ $(this).val() + "</button></li>"
          		;
			
			isCheck = true;
			
		});
		if(isCheck) {
			$('.template').css('display', 'inline');
		}
		$(".question-form__keywords__list").append(keywordHtml);
		// 1개 이상일때 키워드를 입력해주세요 띄우기
		if(cheLength > 0) {
			$(".question-form__keywords__keyword__name").css('display', 'inline');
			$(".question-form__keywords__keyword__name--hint").css('display', 'none');
		}
		
		// 5개 이상일때는 둘다 없애기
		if(cheLength >= 5) {
			$(".question-form__keywords__keyword--new").css('display', 'none');
			$(".question-form__keywords__keyword__name").css('display', 'none');
			$(".question-form__keywords__keyword__name--hint").css('display', 'none');
		}
		
        // btnCommit 버튼 클릭시 조건 맞으면 모달 창 종료
		if(cheLength > 0 && cheLength <= 5){
			$(".question-form__keywords__keyword__name")
			$(".btn-dismiss").trigger("click");
		}
		
		// 선택되어 있는 만큼 키워드의 수 변경
		$('.question-form__keywords__counter__current').text(cheLength);
		
		// 키워드 1개 이상 선택하면 에러메시지 노출 취소
		if(cheLength != 0) {
			$('#error2').css('display', 'none');
		}
		
	}); // end 배열 이용 체크박스
	
}); // end ready()

