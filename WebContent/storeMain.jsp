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


<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<!-- <link rel="stylesheet" href="CSS/logo_menu.css" type="text/css"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">



<script type="text/javascript" src="JS/yj.js"></script>




<title>너네 집 : 스토어 홈</title>

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
				<form action="uQuestionList.y" method="post" id = "uQuestionList_form" name="uQuestionList_form">
					<input type="hidden" name="pquid"
						value=<%=session.getAttribute("id")%>>
					<button type="submit">
						<i class="far fa-user"></i>
					</button>
				</form>
			</div>
		</div>
		<hr>
		<div id="main_top2" class="row">
			<div class="col-md-9">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">스토어홈</a></li>
						<li id="category_li"><a href="#">카테고리</a></li>
						<li><a href="#">중고장터</a></li>
						<li><a href="#">베스트</a></li>
						<li><a href="#">특가</a></li>
						<li><a href="#">여름패브릭</a></li>
						<li><a href="#">여름가전</a></li>
						<li><a href="#">기획전</a></li>
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
	<div id="product_main_nav" class="row">
		<div class="product_main_nav col-md-1" id="category_1" id="category_1">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//1557904115802_0VKPJ.jpg?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>가구</h3>
		</div>

		<div class="product_main_nav col-md-1" id="category_2">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//157490693067184634.png?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>침구</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_3">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//157490693687318741.png?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>패브릭</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_4">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//156506730153520142.png?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>조명</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_5">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//1557904172550_YrPh.jpg?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>홈데코</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_6">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//1557904180123_LYQ.jpg?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>가전</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_7">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//156870501110279761.png?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>수납/정리</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_8">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//156880465200709393.png?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>생활용품</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_9">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//1557904215840_JtXLLU6E4.jpg?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>주방</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_10">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//1557904218943_dG8q.jpg?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>DIY셀프시공</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_11">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//1557904246197_agKC.jpg?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>시공/서비스</h3>
		</div>
		<div class="product_main_nav col-md-1" id="category_12">
			<div class="product_main_nav_img"
				style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories//1557904223978_Omb.jpg?gif=1&w=144&h=144&c=c&webp=1')"></div>
			<h3>반려동물</h3>
		</div>


	</div>


	<!--내용부분입니다.  -->
	<div id="product_main_content" class="row">
		<!-- <h1 class="row col-md-3"></h1>
	<h1 class="row col-md-9">카테고리 > ALL</h1> -->
		<div id="product_main_content1" class="row col-md-3">
			<nav id="product_category">
				<ul>
					<li>홈데코</li>
					<li>가구</li>
					<li>패브릭</li>
					<li>가전</li>
					<li>수납/정리</li>
					<li>생활용품</li>
					<li>주방</li>
					<li>DIY셀프시공</li>
				</ul>
			</nav>

		</div>
		<div id="product_main_content2" class="row col-md-9">
			<c:choose>
				<c:when test="${empty list || fn:length(list) ==0}">
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items='${list }'>
						<div class="product_td col-md-3 category_code_${dto.pcode }">
							<%-- <a href="productView.woo?pid=${dto.pid }"> --%>
							<a href="productView.y?pid=${dto.pid }">
								<div class="product_img" style='background-image: url("${dto.pimage }")'></div> <!--<img class="thumbnail-img" src="${dto.pimage }" />  -->
								<br>
								<h3 class="pbrand">[${dto.pbrand }]</h3> <br>
								<h3 class="pname">${dto.pname }</h3> <br>
								<h3 class="pprice">${dto.pprice }원</h3>
							</a>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
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