function check(form){
	var pass1=infoform.MEMBER_PW.value;
	var pass2=infoform.MEMBER_PW2.value;
	var email1=infoform.MEMBER_EMAIL1.value;				
	var email2=infoform.MEMBER_EMAIL2.value;
	var tel=infoform.MEMBER_PHONE.value;
	var addr=infoform.MEMBER_ADDR1.value;
	var addr_about=infoform.MEMBER_ADDR2.value;
	var phone=infoform.MEMBER_MOBILE.value;
	
	var forms = document.getElementById("infoform");

	if ((forms.MEMBER_NAME.value=="")||(forms.MEMBER_NAME.value.length<=1)){
		alert("이름을 입력하세요.");
		forms.MEMBER_NAME.focus();
        return false;
	}
	if(pass1.length == 0){
		alert("비밀번호를 입력하세요.");
		infoform.MEMBER_PW.focus();
		return false;
	} 
	if(pass1 != pass2){
		alert("비밀번호가 일치하지 않습니다.");
		infoform.MEMBER_PW.value="";
		infoform.MEMBER_PW2.value="";
		infoform.MEMBER_PW.focus();
		return false;
	} 				 
	if(email1.length == 0 || email2.length == 0){
		alert("이메일 주소를 입력하세요.");
		infoform.MEMBER_EMAIL1.focus();
		return false;
	}
	if(tel.length == 0){
		alert("집 전화를 입력하세요.");
		infoform.MEMBER_PHONE.focus();
		return false;
	} 
	if((forms.MEMBER_ZIPCODE1.value=="")||(forms.MEMBER_ZIPCODE1.value.length<3)){
		alert("우편번호 앞의 3자리를 입력해 주세요.");
      	forms.MEMBER_ZIPCODE1.focus();
         	return false;
 		}
 	if((forms.MEMBER_ZIPCODE2.value=="")||(forms.MEMBER_ZIPCODE2.value.length<3)){
		alert("우편번호 뒤의 3자리 입력해 주세요.");
      	forms.MEMBER_ZIPCODE2.focus();
        return false;
	}   
	if(addr.length == 0){
		alert("집 주소를 입력하세요.");
		infoform.MEMBER_ADDR1.focus();
		return false;
	} 
	if(addr_about.length == 0){
		alert("상세 주소를 입력하세요.");
		infoform.MEMBER_ADDR2.focus();
		return false;
	} 
	if(phone.length == 0){
		alert("전화번호를 입력하세요.");
		infoform.MEMBER_MOBILE.focus();
		return false;
	}
	
	return true;
}

function openzipcode(joinform){			
	var url="./Zipcode.me";	
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=yes,resizable=no,width=410,height=400");
}

function gNumCheck(){
	if(event.keyCode >=48 && event.keyCode <=57) {
		return true;
	}else{
		event.returnValue=false;	
	}
}

function out(){
	var Answer = confirm("회원탈퇴를 하시겠습니까?");
 		if (Answer == true){ 
 		location.href = "./MemberOut.me";
 	}
 }
 
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("MEMBER_ADDR1").value = roadAddr;
        }
    }).open();
} 