
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
		});
	});
		
		$("#close, #cancelbtn").click(function(){
			$('#id01').hide();
	});
});

