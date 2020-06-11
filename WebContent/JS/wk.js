$(document).ready(function() {
	$('#figure').on('change', function() {
		var selectOption = document.getElementById("figure");
		selectOption = selectOption.options[selectOption.selectedIndex].value;
		var res = $('#s_price').text().split("원")[0].trim();
		var p = parseInt(res) * selectOption;
		a = makeComma(p);
		$('#total').text("주문금액:    " + a + "원")

		$("#cashBtn").click(function() {
			$('#id01').show();
			$('#pc_price').text("결제 금액: " + p + "원");
			$('#result_price').val(p);
			$('#resutlt_pid').val();
			$('#result_cnt').val(selectOption);
		}); // 바로구매 클릭시
	});

	
	
	$('#sort').on('change', function() {
		var select = document.getElementById("sort");
		selectt = select.options[select.selectedIndex].value;

		if (selectt == '1') {
			$('.status_code_' + '1').show();
			$('.status_code_' + '0').hide();
		} else if (selectt == '0') {

			$('.status_code_' + '0').show();
			$('.status_code_' + '1').hide();
		} else{
			$('.status_code_' + '0').show();
			$('.status_code_' + '1').show();
		}

	});

	
	
	
	$("#close, #cancelbtn").click(function() {
		$('#id01').hide();

	}); // 닫기 , 캔슬 , 구매버튼(바꿔야함) 클릭시!

	
	
	$("#reg").submit(function() {
		var enCheck = RegExp(/[^0-9]$/);
		var test = $('pcaddressnum').val();
		var test = $('pccardnum').val();

		if ($("#pcaddressnum").val() == "") {
			alert("우편번호  입력해주세요.");
			return false;
		} else if ($("#pcaddress").val() == "") {
			alert("주소를 입력해주세요.");
			return false;
		} else if ($("#pcaddress2").val() == "") {
			alert("상세주소를 입력해주세요.");
			return false;
		} else if ($("#pccardnum").val() == "") {
			alert("카드번호 입력해주세요.");
			return false;
		} else if ($.isNumeric(test)) {
			alert("카드번호는 숫자만 입력해주세요.");
			return false;
		} else if ($("#pccardnum").val() == "") {
			alert("-없이 숫자만 입력해주세요.");
			return false;
		} else {

			return true;
		}

	});

	var buy = $('input[value=1]').length;
	$('#status_figure_buy').text(buy);

	var cancel = $('input[value=0]').length;
	if (canecel = null) {
		$('#status_figure_cancel').text("0");

	} else {
		$('#status_figure_cancel').text(cancel);

	}

	// 배송 메모 수정
	$('div[id^="u_modify_input_"]').hide();

	$('button[id^="u_modify_2_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_' + id).show();
	});

	$('button[id^="u_modify_1_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_' + id).hide();
	});
	$('button[id^="u_modify_3_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_' + id).hide();
	});
	// 배송 메모 수정 끝
}); // Main document end




function makeComma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

};



// 관리자삭제모
function chkDelete(pid) {
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if (r) {
		location.href = 'mOrderDeleteOk.woo?pid=' + pid;
	};
};
