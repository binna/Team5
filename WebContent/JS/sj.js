$(document).ready(function(){
	 $("#join_bt").click(function() {
			if ($("#id").val() == "") {
				alert("id입력하세요");
				return false;
			}
			if ($("#name").val() == "") {
				alert("이름입력");
				return false;
			}	
			if ($("#password").val() == "") {
				alert("password");
				return false;
			}
			if ($("#password_check").val() == "") {
				alert("pwd_check입력하세요");
				return false;
			}
			if ($("#email").val() == "") {
				alert("email입력하세요");
				return false;
			}
			if ($("#phone").val() == "") {
				alert("phone입력하세요");
				return false;
			}
			if ($("#password").val() != $("#password_check").val()) {
				alert("비밀번호 확인해보세요");
				return false;
			}
			if($("#id_valid").val()==0){
				alert("ID 중복체크를 하세요")
				return false;
			}
			if($("#password_valid").val()==0){
				alert("비밀번호 양식을 맞추세요")
				return false;
			}
			$("#join_form").submit();
			
		});
	 
	 	var pw_p= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		$("#password").keyup(function(){
			$("#password_valid_div").remove();
			if(!$("#password").val().match(pw_p)){
				$("#password_valid_span").append("<div style='color:red' id='password_valid_div'>"+
				"사용 불가능(특수문자,영어,숫자 각 1개 이상 포함 8자 이상)</div>");
				
			}
			else{
				$("#password_valid_span").append("<div style='color:green' id='password_valid_div'>"+
						"사용가능 패스워드</div>");
				$("#password_valid").val("1");
			}
		});
		
		$("#password_check").keyup(function(){
			$("#password_check_div").remove();
			if($("#password").val()== $("#password_check").val()){
				$("#password_check_span").append("<div style='color:green' id= 'password_check_div' >일치!</div>");
			}
			else{	
				$("#password_check_span").append("<div style='color:red' id='password_check_div'>불일치!</div>");
			}
				
		});
		
		 //email유효성 검사
        $("#email").on("input",function(){
             var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
             var result = regex.exec($("#email").val());
            
            if(result != null){
               $(".email.regex").html("");  
            }else{
                $(".email.regex").html("올바른 이메일이 아닙니다");
            }
        })

             //전화번호 유효성검사
            $("#phone").on("input",function(){
                 var regex = /^01\d\d{3,4}\d{4}$/;
                 var result = regex.exec($("#phone").val());
                
                if(result != null){
                   $(".phone.regex").html("");  
                }else{
                    $(".phone.regex").html("올바른 번호가 아닙니다");
                }
                
            })
            $("#zip_search").click(function(){
			window.open("zipCheck.jsp","","width=500 height=500");
            })
 			});


		
		/*var pw_p= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;*/

$( function() {
    $( "#datepicker1" ).datepicker();
  } );

$(function() {
	  $( "#datepicker" ).datepicker({
	    dateFormat: 'yy.mm.dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년',
	    showButtonPanel: true,
	    closeText:'취소',
	    	onClose: function () {
	            if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	                $(this).val('');
	            }
	        }
	  });
	});

//function idcheck(){
//	 var id = document.form.id.value;
//	 if(id.length<1 || id==null){
//	  alert("중복체크할 아이디를 입력하십시오");
//	  return false;
//	 }
//	 var url = "idCheck.jsp?id=" + id;
//	 window.open(url, "get", "height = 180, width = 300");
//	}











