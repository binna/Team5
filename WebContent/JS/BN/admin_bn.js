$(document).ready(function(){
	$("#btn_page_choice").click(function(){
		var selectValue = $("#page_choice option:selected").val();
		
		location.href = 'communityAdmin.community?page=1&pagerow=' + selectValue;
	});
	
});