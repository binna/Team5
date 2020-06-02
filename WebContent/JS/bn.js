/* write.jsp */
$(document).ready(function () {

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
		if(cheLength > 5){
			alert('키워드는 최대 5개까지 선택 가능합니다.'); 
		}
		
		// 5개 이상 체크박스되면 자동 해지하는거 나중에 구현하기
		// TODO
		
		// 배열 이용 체크박스 값 가져오기
		var arrParam = new Array();
		
		$("#btnCommit").click(function(){
			
			$("input[class='form-che']:checked").each(function(){
				arrParam.push($(this).val());
				

				
			});
			
			alert(arrParam);
			
			
		});
		
		
	});

	
});

	