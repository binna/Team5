$(document)
		.ready(
				function() {
					
					console.log("들어는 오니?")
					
						console.log("들어옴");
					$('form').on('submit', function(){
						frm = document.forms["frm"];
						
						var csname = frm["csname"].value.trim();
						
						var cstel = frm["cstel"].value.trim()
						if (csname == "") {
							alert("신청이름은 반드시 작성해야 합니다");
							frm["csname"].focus();
							return false;
						} else if (cstel=="") {
							alert("전화번호는 반드시 작성해야 합니다");
							frm["cstel"].focus();
							return false;
						} else {
							return true;
						}
					}) // end function()
					
					
					// console.log(frm["csuid"].value.trim());
					// $('.submit')
					// .click(
					// function() {
					//
					// frm = document.forms["frm"];
					//
					// var csuid = frm["csuid"].value.trim();
					//
					// var cstel = frm["cstel01"].value.trim()
					// + frm["cstel02"].value.trim()
					// + frm["cstel03"].value.trim();
					// var cstel01 = frm["cstel01"].value.trim()
					// var cstel02 = frm["cstel02"].value.trim()
					// var cstel03 = frm["cstel03"].value.trim()
					//
					// if (csuid == "") {
					// alert("신청이름은 반드시 작성해야 합니다");
					// frm["csuid"].focus();
					// return;
					// } else if (cstel01 == "" || cstel02 == ""
					// || cstel03 == "") {
					// alert("전화번호는 반드시 작성해야 합니다");
					// frm["cstel01"].focus();
					// return;
					// } else {
					// $(".searchForm").attr("action",
					// "consWriteOk.cons");
					// }
					// })

					// var re = /^[0-9]*$/;
					//
					// var consArea = document.getElementById("consArea");
					// var userNameInput =
					// document.getElementsByClassName("userNameInput");
					// var ctel =
					// document.getElementsByClassName("ctel01").value
					// + document.getElementsByClassName("ctel02").value +
					// document.getElementsByClassName("ctel03").value;
					//	
					// console.log(consArea);
					// console.log(userNameInput);
					// console.log(userNameInput);

					// $('.submit').click(function(){
					// console.log("들어오나요?");
					// if(checkNum(re, ctel, "숫자만 입력해 주세요")){
					// $(".submit").attr("action", "consWriteOk.cons");
					// };
					//		
					// function check(re, what, message) {
					// if (re.test(what.value)) {
					// return true;
					// }
					// alert(message);
					// what.value = "";
					// what.focus();
					// return false;
					// }
					//		
					// function checkNum(re, what, message) {
					// if (re.test(what.value)) {
					// return true;
					// }
					// alert(message);
					// document.getElementsByClassName("ctel01").value = "";
					// document.getElementsByClassName("ctel02").value = "";
					// document.getElementsByClassName("ctel03").value = "";
					// frm["cstel01"].focus();
					// return false;
					// }
					// })
				}) // end JS
