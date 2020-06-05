<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<!-- MaxCDN 사용 -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- Google 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Google 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap"
	rel="stylesheet">
<!-- font-family: 'Do Hyeon', sans-serif;
font-family: 'Jua', sans-serif; -->


<script type="text/javascript" src="JS/wk.js"></script>
<script type="text/javascript" src="JS/yj.js"></script>
<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<link rel="stylesheet" href="CSS/wk.css" type="text/css">
<!-- <link rel="stylesheet" href="CSS/logo_menu.css" type="text/css"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">

<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>



<title>너네집</title>
</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<body>
	<header style="padding: 0px;" class="col-md-12" id="main_header">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-md-2">
				<h1 id="main_title">너네 집</h1>
			</div>
			<div id="main_top1_2" class="col-md-3">
				<nav>
					<ul>
						<li><a href="#">커뮤니티</a></li>
						<li><a href="#">스토어</a></li>
						<li><a href="#">인테리어시공</a></li>
					</ul>
				</nav>
			</div>
			<div id="main_top1_3" class="col-md-7">
				<div id="search">
					<i class="fas fa-search"></i>
				</div>
				<button id="write">글쓰기</button>
				<!-- <button>
					<i class="fas fa-search"></i>
				</button> -->
				<button>
					<i class="far fa-bookmark"></i>
				</button>
				<button>
					<i class="far fa-bell"></i>
				</button>
				<button>
					<i class="fas fa-shopping-cart"></i>
				</button>
				<button>
					<i class="far fa-user"></i>
				</button>
			</div>
		</div>
		<hr>
		<div id="main_top2" class="row">
			<div class="col-md-9">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">스토어홈</a></li>
						<li><a href="#">카테고리</a></li>
						<li><a href="#">신혼가구</a></li>
						<li><a href="#">베스트</a></li>
						<li><a href="#">특가</a></li>
						<li><a href="#">여름패브릭</a></li>
						<li><a href="#">여름가전</a></li>
						<li><a href="#">기획전</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-md-3">
				<button id="main_top2_app"></button>
				<a href="#">앱 다운로드</a>
			</div>

		</div>
		<hr>
	</header>



	<!------------------------------------------- 내용입니다 . ------------------------------------------------------------------- -->

	<div class="s_info row">
		<br>

		<div class="s_image col-md-6">
			<h3>가구 > ${view[0].pname }</h3>
			<br> <img class="p_image" id="p_image" src="${view[0].pimage}" />
		</div>
		<br>

		<div class="s_content col-md-6">
			<br> <br>


			<div class="s_brand" id="s_brand">
				${view[0].pbrand }<br>
			</div>

			<div class="s_name">
				${view[0].pname }<br>
			</div>

			<div class="p_content">
				<div class="s_price" id="s_price">${view[0].pprice}원</div>
			</div>


			<div class="p_fix">
				<form class="p_option" name="myform1" action="">
					<div id="p_position">
						<!-- 						<div >
							<span>수량 :</span> <input class="figure" type="number" name="number" min="1" max="50" step="1" /><br>
						</div> -->
						<span>수량 : </span> <select id="figure" class="figure"
							name="figure">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="" selected>선택</option>
						</select>


						<div class="total" id="total"></div>

					</div>
				</form>

				<div class="buy">
					<button id="cashBtn">바로구매</button>
				</div>

			</div>
		</div>
		<br> <br>
	</div>



	<!-------------------------------문의입니다. ******복사할부분----------------------------------------------->
	<div id="detail_question">
		<div class="row">
		<h1 id = "detail_question_1" class="col-md-10">문의<a> ${fn:length(Qlist) }</a> </h1>
		<div class="col-md-2" id = "detail_questiondiv_2"><h1 id = "detail_question_2">문의하기</h1></div>
		</div>

		<div id="detail_question_list">
		<c:choose>
				<c:when test="${empty Qlist || fn:length(Qlist) ==0}">
					<div id="main_qlist">
						<h1>아직 문의한 내역이 없습니다.</h1>
					</div>
				</c:when>
				<c:otherwise>
					
					
					<c:forEach var="dto" items='${Qlist }'>
					<br><br>
					<div id ="detail_question_list_container" >
					<h2 id="detail_question_list_2"><a>${dto.pqid }</a> | 구매 | 
					<c:if test="${dto.pqanswer!=' ' }">
					<a id = "ql_status" style="color: #fff; background-color: rgb(53, 197, 240);">
					답변완료
					</a>
					</c:if>
					<c:if test="${dto.pqanswer==' ' }">
					<a id = "ql_status" style="color: rgb(53, 197, 240); background-color: #fff; border: 1px solid  rgb(53, 197, 240) ">
					답변대기
					</a>
					</c:if>
					</h2>
					<br>
					<h2 id="detail_question_list_1">[ ${dto.pbrand } ] ${dto.pname } </h2>
					<br>
					<h2 id="detail_question_list_3">${dto.pquid } | <a>${dto.pqregdate }</a></h2>
					<br>
					<br>
					<br>
					<br>
					<h2 id="detail_question_list_4">Q. <a> ${dto.pqcontent }</a></h2>
					<br>
					<h2 id="detail_question_list_5">A. <a> ${dto.pqanswer }</a></h2>
					
						
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>


	</div>
	
	<!-- --문의 등록 -->
	<div id="QModal" >

	  <!-- Modal content -->
	  <div class="QModal_content">
	    <span class="Qclose">&times;</span>
	    <br>
	    <br>
	    <br>
	  
	  
	  
	    <h1 id="QModal_title">상품 문의하기</h1>
	    <br>
	    <br>
	    <br>
	    <h2 class ="QModal_h2">문의내용</h2>
	    <form id ="QModal_form" action="QuestionUpdateOk.y" method="post">
		    <input id="QModal_input" type="text" name="pqcontent" placeholder="문의내용을 입력하세요 ">
		    <input type="hidden" name = "pquid" value="bhd4445"><!-- TODO uid 들어가ㅣ -->
		    <input type="hidden" name = "pqanswer" value=" ">
		    <input type="hidden" name = "pqpid" value="${param.pid }"> 
	    
	  	<br>
	  	<br>
	  	<br>
	  	<h3 id="QModal_detail">문의내용에 대한 답변은 ‘마이페이지 > 나의 쇼핑 > 나의 문의내역’ 또는 ‘상품 상세페이지’에서 확인 가능합니다.</h3>
	  	<button id ="QModal_btn" type="submit">완료</button>
	  	</form>
	  </div>
	
	</div>



	<!-------------------------------배송안내입니다. ******복사할 부분----------------------------------------------->
	<div class="clear"></div>
	<br>
	<div id="detail_delivery">
		<h1>배송</h1>
		<table>
			<tr>
				<td>배송</td>
				<td>일반택배</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td>무료배송</td>
			</tr>
			<tr>
				<td>도서산간 추가배송비</td>
				<td>5,000원</td>
			</tr>
			<tr>
				<td>배송불가 지역</td>
				<td>배송불가 지역이 없습니다.</td>
			</tr>
		</table>
		<br> <br> <br> <br>
		<h1>교환/환불</h1>
		<table>
			<tr>
				<td>반품배송비</td>
				<td>3,000원 (최초 배송비가 무료인 경우 6,000원 부과)</td>
			</tr>
			<tr>
				<td>교환배송비</td>
				<td>6,000원</td>
			</tr>
			<tr>
				<td>보내실 곳</td>
				<td>(42982) 서울 강남구 테헤란로 146</td>
			</tr>
		</table>
		<br> <br> <br> <br> <br> <br>
		<h1>반품/교환 사유에 따른 요청 가능 기간</h1>
		<h3>반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해
			주시기 바랍니다.</h3>
		<h3>1. 구매자 단순 변심은 상품 수령 후 7일 이내 (구매자 반품배송비 부담)</h3>
		<h3>2. 표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터
			30일 이내. 둘 중 하나 경과 시 반품/교환 불가 (판매자 반품배송비 부담)</h3>

		<br> <br> <br> <br> <br> <br>
		<h1>반품/교환 불가능 사유</h1>
		<h3>아래와 같은 경우 반품/교환이 불가능합니다.</h3>
		<br>
		<h3>1. 반품요청기간이 지난 경우</h3>
		<h3>2. 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장
			등을 훼손한 경우는 제외)</h3>
		<h3>3. 포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우 (예: 식품, 화장품)</h3>
		<h3>4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는
			태그가 떨어진 명품관 상품인 경우)</h3>
		<h3>5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 (예: 식품, 화장품)</h3>
		<h3>6. 고객주문 확인 후 상품제작에 들어가는 주문제작상품</h3>
		<h3>7. 복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)</h3>

	</div>

	<!-- ------------------------------------------------------------------ -->



	<!------------- modal입니다 -------------------------------------------------------- -->

	<!-- The Modal -->
	<div id="id01" class="modal">

		<form class="modal-content animate"
			action="https://www.w3schools.com/action_page.php" method="post">
			<div class="imgcontainer">
				<!-- 닫기버튼  -->
				<span class="close" id="close">&times;</span>
				<!-- 이미지  -->
				<img src="${view[0].pimage}" class="avatar" alt="Avatar">
			</div>

			<div class="container">
				<!-- 로그인 form -->

				<label for="uname"><b>Username</b></label> <input type="text"
					placeholder="Enter Username" name="uname" required> <label
					for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="psw" required>

				<button type="submit">Login</button>
				<label> <input type="checkbox" name="remember" checked>Remember
					me
				</label>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button" class="cancelbtn" id="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>

	</div>

















	<!---------------------- 바닥입니다. ------------------------------------------------------------------------------------------------------>
	<footer id="main_footer">
		<div id="main_footer_content">
			<div id="main_footer_icon">
				<i class="fab fa-apple"></i> <i class="fab fa-google-play"></i> <i
					class="fab fa-facebook-f"></i> <i class="fab fa-instagram"></i>
			</div>
			<h1 id="main_footer_h0">고객센터></h1>
			<h1 id="main_footer_h1">1670-0876</h1>
			<h1 id="main_footer_h2">평일 10:00~17:00 (점심시간 12:00~13:00 /
				주말&공휴일 제외)</h1>

			<h1 id="main_footer_h3">브랜드 스토리 회사소개 채용정보 이용약관 개인정보처리방침 고객센터 고객의
				소리 전문가 등록사업자 구매회원제휴/광고 문의입점신청 문의</h1>

			<h1 id="main_footer_h4">상호명(주)버킷플레이스이메일(고객문의)
				help@bucketplace.net (제휴문의)
				contact@bucketplace.net대표이사이승재사업자등록번호119-86-91245통신판매업신고번호제2018-서울서초-0580호주소서울특별시
				서초구 서초대로 398 플래티넘타워 19층</h1>

			<h1 id="main_footer_h5">NICEPAY 안전거래 서비스고객님의 안전거래를 위해 현금 결제 시,
				저희 사이트에서 가입한 구매안전 서비스를 이용할 수 있습니다. 가입 확인</h1>

			<h1 id="main_footer_h6">Copyright © 2014 - 2020 by Bucketplace,
				Inc. All rights reserved</h1>
		</div>
	</footer>

</body>

</html>