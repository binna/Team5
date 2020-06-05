<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입</title>
    <script type="text/javascript">
    
    function validate() {
        //event.preventDefault();
        var objID = document.getElementById("MEMBER_ID");
        var objPwd1 = document.getElementById("MEMBER_PW");
        var objPwd2 = document.getElementById("MEMBER_PW2");
        var objEmail = document.getElementById("MEMBER_EMAIL1");
/*         var objEmail2= document.getElementById("MEMBER_EMAIL2"); */
        var objName = document.getElementById("MEMBER_NAME");
        var objNum1 = document.getElementById("MEMBER_JUMIN1");
        var objNum2 = document.getElementById("MEMBER_JUMIN2");
        var postcode = document.getElementById("postcode"); // 우편번호
        var adress = document.getElementById("MEMBER_ADDR2"); //상세주소
        /* var adress = document.getElementById("MEMBER_ADDR2"); //전화번호 */
        var mobile = document.getElementById("MEMBER_MOBILE"); //핸드폰번호
        
 
        var arrNum1 = new Array();
        var arrNum2 = new Array();
 
        var tempSum=0;//주민번호 합을 넣는 공간
 
        //아이디와 패스워드 값 데이터 정규화 공식
        var regul1 = /^[a-zA-Z0-9]{4,12}$/;
        //이메일 값 데이터 유효성 체크
        //[]안에 있는 값만 쓰겠다
 
        //이메일 정규화 공식
        var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
        //이름 정규화 공식
        var regul3 = /^[가-힝a-zA-Z]{2,}$/;
        //var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
 
        //핸드폰 번호 정규식
        var regul4 = /^\d{3}-\d{3,4}-\d{4}$/;
        
        //일반 전화번호 정규식
		var regul5 = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		//휴대폰번호 체크 정규식
		var regul6 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
        
        
        //아이디 입력 하지 않았을 경우
        if ((objID.value) == ""){
            alert("아이디를 입력하지 않았습니다.");
            objID.focus();
            return false;
        }
        
        
        //아이디 유효성 검사
        //내가 입력한 데이터를 검사하는 check()
        //만약 내가 아이디에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
        if (!check(regul1,objID,"아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
            return false;//반환 할 곳 없이 if문 탈출
        }
        //비밀번호 입력 하지 않았을 경우
        if ((objPwd1.value) == ""){
            alert("비밀번호를 입력해 주세요");
            objPwd1.focus();
            return false;
        }
        if ((objPwd2.value=="")){
            alert("비밀번호를 확인해 주세요");
            objPwd2.focus();
            return false;
        }
 
        //비밀번호 유효성 검사
        //만약 내가 비밀번호에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
        if (!check(regul1,objPwd1,"비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
            return false;
        }
        
        //비밀번호와 비밀번호 확인이 일치 하지 않을 경우
        if ((objPwd1.value)!=(objPwd2.value)) {
            alert("비밀번호가 일치 하지 않습니다.");
            objPwd1.focus();
            objPwd2.focus();
            return false;
        }
        //이메일 입력 안했을 경우
        if ((objEmail.value)=="") {
            alert("이메일을 입력해 주세요");
            objEmail.focus();
            return false;
        }
        //이메일이 잘못된 경우
        if (!check(regul2,objEmail,"이메일을 잘못 입력 했습니다.")) {
            return false;
        }
        //-------0604----------------
        if ((postcode.value) == ""){
            alert("우편번호 입력해주세요");
            postcode.focus();
            return false;
        } 
         if ((adress.value) == ""){
            alert("상세주소를 입력해주세요");
            adress.focus();
            return false;
        }
         if ((mobile.value) == ""){
            alert("휴대폰 번호를 입력해주세요");
            mobile.focus();
            return false;
        }
        if (!check(regul4,mobile,"휴대폰 번호를 잘못 입력 했습니다.")) {
             return false;
         }
        
        //이름 입력 안 한 경우
        if ((objName.value)=="") {
            alert("이름 2자 입력해 주세요");
            objName.focus();
            return false;
        }
        //이름에 특수 문자가 들어간 경우
        if (!check(regul3,objName,"이름이 잘못 되었습니다.")) {
            return false;
        }
 
        //주민번호 앞자리를 각 배열에 넣어 검색 및 비교하기위한 단계
        //앞자리 값 만큼 돌림
        for (var i = 0; i <objNum1.value.length; i++) {
            //배열 칸마다 앞자리 값 하나씩 넣어줌
            arrNum1[i]=objNum1.value.charAt(i);
        }
 
        //주민번호 뒷자리를 각 배열에 넣어 검색 및 비교하기위한 단계
        //뒷자리 값 만큼 돌림
        for (var i = 0; i <objNum2.value.length; i++) {
            //배열 칸마다 뒷자리 값 하나씩 넣어줌
            arrNum2[i]=objNum2.value.charAt(i);
        }
        //주민번호 앞자리를 tempSum에 집어 넣기
        //앞자리 만큼 돌림
        for (var i = 0; i <objNum1.value.length; i++) {
            //tempSum에 앞자리를 연이어 넣어줌
            tempSum += arrNum1[i]*(2+i);
        }
        //주민번호 뒷자리를 tempSum에 집어 넣기
        //뒷자리 -1을 해주는 이유 : 뒷자리 마지막 자리는 더할 필요 없어서
        //뒷자리의 -1만큼 돌림
        for (var i = 0; i <objNum2.value.length-1; i++) {
            //뒷자리 2번째 자리 부터 
            if (i>=2) {
                //tempSum에 2~6번째까지 넣어줌
                tempSum += arrNum2[i]*i;
            }else{//뒷자리 0~1번째 자리
                //tempSum에 0~1번째까지 넣어줌
                tempSum += arrNum2[i]*(8+i);
            }
        }
        //주민번호 유효성 체크
        //주민번호 구하는 식
        if (((11-(tempSum%11))%10)!=arrNum2[6]) {
            alert("올바른 주민 번호가 아닙니다.");
            objNum1.value="";
            objNum2.value="";
            objNum1.focus();
            return false;
        }
        //주민번호를 입력하면 생년월일이 자동으로 입력된다.
        //substring은 시작문자와 끝문자를 검색하는 역할
        if (arrNum2[0]==1 || arrNum2[0]==2) {//1900년생 일때
            var y = parseInt(objNum1.value.substring(0,2));
            var m = parseInt(objNum1.value.substring(2,4));
            var d = parseInt(objNum1.value.substring(4,6));
            //년도,월,일을 각각 구함
            f.my_year.value = 1900+y;//년도
            f.month.value = m;//월
            f.day.value = d;//일
        }else if(arrNum2[0]==3||arrNum2[0]==4){//2000년생 일때
            var y = parseInt(objNum1.value.substring(0,2));
            var m = parseInt(objNum1.value.substring(2,4));
            var d = parseInt(objNum1.value.substring(4,6));
            
            f.my_year.value = 2000+y;//년도
            f.month.value = m;//월
            f.day.value = d;//일
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    function check(re,what,message){//정규화데이터,아이템 id,메세지
        if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
        //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
            return true;
        }
        alert(message);
        what.value = "";
        what.focus();
    }
 //------------------------------------------
 function openConfirmId(joinform){			
	var id=joinform.MEMBER_ID.value;
	var url="./MemberIDCheckAction.me?MEMBER_ID="+joinform.MEMBER_ID.value;
	
	if(id.length == 0 || id.length <4){
		alert("아이디는 4~12자의 영문 대소문자와 숫자로만 가능합니다.");
		joinform.MEMBER_ID.focus();
		return false;
	}
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=400,height=200");
}

function openZipcode(joinform){			
	var url="./Zipcode.me"
	open(url, "confirm", "toolbar=no,location=no,"
						+"status=no,menubar=no,"
						+"scrollbars=yes,resizable=no,"
						+"width=410,height=400");
}	
    </script>
    <style type="text/css">
</div>
    </style>
</head>
<body>
<h1 align="center">회원 가입</h1>


<FORM name="joinform" method="post" action="./MemberJoinAction.me" onsubmit="return validate()">


<table style="border:1px solid black; margin-left:auto; margin-right:auto;">
    <tr align="center">
        <td colspan="2" align="center" bgcolor="skyblue">
            <div style="font-weight: bold; font-size: 18px">회원 기본 정보
            </div></td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center">
            <div style="font-weight: bold;">아이디:
            </div></td>
        <td>
        <input type="text" id= "MEMBER_ID" name="MEMBER_ID" size="30" maxlength=12/>
        <input type="button" name="confirm_id" value="중복확인" 
				onclick="openConfirmId(this.form)" />
            4~12자의 영문 대소문자와 숫자로만 입력</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center">
        <div style="font-weight: bold;">비밀번호:</div></td>
        <td><input type="password" id="MEMBER_PW" name="MEMBER_PW" size="15"/>
           4~12자의 영문 대소문자와 숫자로만 입력</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호 확인:</div></td>
        <td><input type="password" id="MEMBER_PW2" name="MEMBER_PW2" size="15" maxlength="12"></td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center">
        <div style="font-weight: bold;">메일주소:</div></td>
        <td><input type="text" id="MEMBER_EMAIL1" name="MEMBER_EMAIL1" size="50"/>
			예)id@domain.com</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center">
        <div style="font-weight: bold;">메일 수신 여부:</div></td>
        <td>
        	<input type="radio" name="MEMBER_EMAIL_GET" value="YES" checked/>
			<font size="2">수신</font>
			&nbsp;&nbsp;<input type="radio" name="MEMBER_EMAIL_GET" value="NO"/>
			<font size="2">수신 안함</font>
		</td>
    </tr>
    <tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">집전화
           </div>
            </td> 
        <td> <input type="text" name="MEMBER_PHONE" size="30"/></td>
	</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">우편번호
           </div>
            </td> 
			<td>
			<input type="text" id ="postcode" name="MEMBER_ZIPCODE1" size="6" 
				onkeypress="gNumCheck()" maxlength="3"/>- 
			<input type="text" name="MEMBER_ZIPCODE2" size="6" 
				onkeypress="gNumCheck()" maxlength="3" />&nbsp;&nbsp;
			<input type="button" name="zipcode" value="우편번호 검색" 
				onclick="openZipcode(this.form)" />
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">집주소
           </div>
            </td> 
			<td>
				<input type="text" name="MEMBER_ADDR1" size="50" />
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">상세주소
           </div>
            </td> 
			<td>
				<input type="text" id="MEMBER_ADDR2"name="MEMBER_ADDR2" size="50" />
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">휴대폰
           </div>
            </td> 
			<td>
				<input type="text" id="MEMBER_MOBILE"name="MEMBER_MOBILE" size="24" />
				예)010-1234-5678</td>
			</tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">이름:</div></td>
        <td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" size="10" maxlength="10"></td>
    </tr>

    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">주민등록번호:</div></td>
        <td><input type="text" id ="MEMBER_JUMIN1" name="MEMBER_JUMIN1" size="12" 
				 maxlength="6"/>-	
            
            <input type="password" id ="MEMBER_JUMIN2" name="MEMBER_JUMIN2" size="12" 
				 maxlength="7"/>
            예)123456-1234567</td>
    </tr>
 </table>
    <p align="center">
    <input type="submit" name="submit" value="회원 가입" >
    <input type="reset" value="다시 입력">
    <input type="button" name="cancle"value="취소" onclick="location.href='./main.jsp'">
    </FORM>

</body>
</html>
