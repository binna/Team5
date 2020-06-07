$(document).ready(function() {
	$('#figure').on('change', function() {
		var selectOption = document.getElementById("figure");
		selectOption = selectOption.options[selectOption.selectedIndex].value;
		var tprice = document.getElementById("s_price");
		var res = $('#s_price').text().split("원")[0].trim();
		var p = parseInt(res) * selectOption

		$('#total').text("주문금액:    " + p + " 원")

		$("#cashBtn").click(function() {
			$('#id01').show();
			$('#pc_price').text("결제 금액: " + p + " 원");
			$('#result_price').val(p);
			$('#resutlt_pid').val();
			$('#result_cnt').val(selectOption);
		}); // 바로구매 클릭시
	});
	

	$("#close, #cancelbtn,#okay").click(function() {
		$('#id01').hide();

	}); // 닫기 , 캔슬 , 구매버튼(바꿔야함) 클릭시!

	
	$("#okay").click(function() {
		$('#id01').hide();
		
	});
	
	var buy= $('input[value=1]').length;
	$('#status_figure_buy').text(buy);
	
	var cancel= $('input[value=0]').length;
	if(canecel = null){		
		$('#status_figure_cancel').text("0");
	}else{
		$('#status_figure_cancel').text(cancel);
	}
	
	$('button[id^="u_cancel_1_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		alert("취소하시겠습니까?")
		$('#u_pcstatus_'+id).val(0);
	});

	
	

	
//  배송 메모 수정
	$('div[id^="u_modify_input_"]').hide();

	$('button[id^="u_modify_2_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_'+id).show();
	});
	
	$('button[id^="u_modify_1_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_'+id).hide();
	});
//  배송 메모 수정 끝
	
	
	
	
	
	
	
	
	
	
	
}); // Main document end

























// 관리자삭제모
function chkDelete(pid) {
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if (r) {
		location.href = 'mOrderDelete.woo?pid=' + pid;
	};
};
