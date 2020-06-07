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

	</div>
	<!------------- modal입니다 -------------------------------------------------------- -->

	<!-- The Modal -->
	<div id="id01" class="modal">
		<form class="modal-content animate" action="purchaseOk.woo" method="post">
				<span class="close" id="close">&times;</span>
				<br>
			<div class="imgcontainer row">
				<div class="col-md-4">
					<img src="${view[0].pimage}" class="avatar" id="avatar"
						alt="Avatar">
				</div>
				<div class="col-md-7">
					<div class="s_brand" id="s_brand">
						${view[0].pbrand }<br>
					</div>

					<div class="s_name" id="s_name">
						${view[0].pname }<br>
					</div>

					<div class="p_content_price">
						<div class="pc_price" id="pc_price"></div>
					</div>
				</div>

			</div>

			<div class="container">
				<!-- 로그인 form 스크립트넣어주기-->

				<input type="hidden" name="pclpid" id="resutlt_pid" value="${view[0].pid}">
				<input type="hidden" name="ptotalprice" id="result_price" >
				<input type="hidden" name="pclpnt" id="result_cnt" >
				
				<label for="uname"><b>Username</b></label> 
				<input id="pcuid" type="text" placeholder="Enter Username" name="pcuid" required> 
				
				<label for="addressnum"><b>addressNum</b></label>
				 <input id="pcaddressnum" type="text"placeholder="우편번호 입력" name="pcaddressnum" required>
				 
				<label for="address"><b>Address</b></label>
				 <input id="pcaddress" type="text"placeholder="주소" name="pcaddress" required>
				 
				<label for="tel"><b>요청 사항</b></label>
				 <input id="pccontent" type="text"placeholder="배송메모" name="pccontent" required>
				 
				<label for="psw"><b>CardNum</b></label>
				 <input id="pccardnum"  type="text"placeholder="카드번호입력" name="pccardnum" required>

				<input class="okay" id="okay" type="submit" value="구매 하기" >
				<label> <input type="checkbox" name="remember" checked>Remember
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