$(document).ready(function() {
	
	$('.updateComplete').hide(); // 초기수정 완료 버튼
	$('.cancel').hide(); // 초기 취소 버튼
	$('.update').click(function() {
		console.log("update 들어옴")
		$(this).parents('.consData').children('.consInfo').hide();
		// 상담정보 숨기기
		$(this).parents('.consData').children('.consUpdate:not(".csno01")').css({
			'display' : 'block'
		}); // end .consUpdate CSS
		// 상담수정 입력창 보이기
		$(this).hide();
		// 수정버튼 숨기기
		$(this).parents('.consData').children('.delete').hide();
		// 삭제버튼 숨기기
		$(this).parents('.consData').children('.updateComplete').show();
		// 완료버튼 보이기
		$(this).parents('.consData').children('.cancel').show();
		// 취소버튼 보이기

	} // end function

	) // end update click

	$('.cancel').click(function() {
		//console.log("update 들어옴")
		$(this).parents('.consData').children('div:not(.cname)').show();
		// 상담정보 보이기
		$(this).parents('.consData').children('.consUpdate').hide();
		// 상담수정 입력창 보이기
		$(this).parents('.consData').children('.updateComplete').hide();
		// 완료버튼 숨기기
		$(this).parents('.consData').children('.update').show();
		// 수정버튼 보이기
		$(this).parents('.consData').children('.delete').show();
		// 삭제버튼 보이기
		$(this).hide();
		} // end function
	) // end update click
	
	$('.delete').click(function() {
		location.href ="consDeleteOk.cons";
		
	})
	
}) // end JS

















