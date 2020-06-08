

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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



<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<!-- <link rel="stylesheet" href="CSS/logo_menu.css" type="text/css"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">

<script type="text/javascript" src="JS/yj.js"></script>




<title>너네집</title>
</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- 팝업설정 js경로  -->
<script type="text/javascript" src="JS/popup.js"></script>
<body>
	<%
		System.out.print(session.getAttribute("id"));

		if (session.getAttribute("id") != null) {
	%>
	<h2>로그인 상태입니다</h2>
	<form action="./member/logout.jsp">
		<input type="submit" value="로그아웃"><br>
	</form>
	<%
		} else {
	%>
	<h2>로그인 상태가 아닙니다</h2>
	<form action="loginOk.jsp">
		id: <input type="text" name="userid"><br> pw: <input
			type="password" name="pw"><br> <input type="submit"
			value="로그인"><br>
	</form>
	<%
		}
	%>
	<form action="MemberModifyAction_1.me">
		<input type="submit" value="회원수정"><br>
	</form>
<body onLoad="javascript:open_win();">
	<!-- 팝업창 설정 -->

	<header style="padding: 0px;" class="col-md-12" id="main_header">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-md-2">
				<h1 id="main_title">너네 집</h1>
			</div>
			<div id="main_top1_2" class="col-md-3">
				<nav>
					<ul>
						<li><a href="#" id="main_a_comunity">커뮤니티</a></li>
						<li><a href="storeMain.y" id="main_a_store">스토어</a></li>
						<li><a href="consMain.jsp" id="main_a_cons">인테리어시공</a></li>
					</ul>
				</nav>
			</div>
			<div id="main_top1_3" class="col-md-7">
				<div id="search">
					<i class="fas fa-search"></i>
				</div>
				
				<button id="write"
					onclick="location.href='community/communityMain.jsp'">글쓰기</button>
				
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
				<button onclick="location.href= 'MemberLogin.me'">
					<i class="far fa-user"></i>
				</button>


			</div>
		</div>
		<hr>
		<div id="main_top2" class="row">
			<div class="col-md-9" id="main_top2-1">
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
			<div class="col-md-9" id="main_top2-2">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">홈</a></li>
						<li><a href="#">사진</a></li>
						<li><a href="#">집들이</a></li>
						<li><a href="#">노하우</a></li>
						<li><a href="#">전문가집들이</a></li>
						<li><a href="#">셀프가이드</a></li>
						<li><a href="#">질문과답변</a></li>
						<li><a href="#">이벤트</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-md-9" id="main_top2-3">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">시공홈</a></li>
						<li><a href="#">견적계산</a></li>
						<li><a href="#">전문가찾기</a></li>
						<li><a href="#">시공스토어</a></li>
						<li><a href="#">방산시장</a></li>

					</ul>
				</nav>
			</div>
			<div calss="col-md-3">
				<button id="main_top2_app"></button>
				<a href="#">앱 다운로드</a>
			</div>

		</div>
		<hr>
	</header>


	<!--내용부분입니다.  -->
	<div id="main_content">
		<div id="content_banner"></div>
		<div id="content_nav">
			<nav style="padding: 0px;">
				<ul>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--158709154758244185.png/512/none">
						신혼가구</li>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--157060163925021105.png/512/none">
						쇼핑하기</li>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--157060166588410696.png/512/none">
						평수별 집구경</li>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--157060167898474932.png/512/none">
						공간별사진</li>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--157060169059665624.png/512/none">
						시공간편상당</li>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--157060169059665624.png/512/none">
						시공스토어</li>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--157560539045245526.png/512/none">
						가이드북</li>
					<li><img
						src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-shortcut-home_feed_shortcut_sets--157060175107066373.png/512/none">
						질문과답변</li>


				</ul>
			</nav>
		</div>
		<br> <br> <br> <br> <br> <br>
		<div id="content_community">
			<h1>오늘의 스토리</h1>
			<br> <br> <br>
		</div>
		<div id="content_store">
			<h1>오늘의 딜</h1>
			<br> <br> <br>
		</div>
		<div id="content_interior">
			<h1>인테리어 시공</h1>
			<br> <br> <br>

		</div>


	</div>



	<!-- 바닥입니다. -->
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