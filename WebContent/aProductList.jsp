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
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">프로필</a></li>
						<li id="menu_myshopping"><a href="#">스토어 관리</a></li>
						<li><a href="#">나의 리뷰</a></li>
						<li><a href="#">설정</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
		<div id="main_top3" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">문의</a></li>
						<li id="Q_li"><a href="#">상품</a></li>
						<li><a href="#">주문배송내역</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<hr>
	</header>


	<!--내용부분입니다.  -->
	<div id="main_content">
		<div id="main_content_aProduct">
			<h1 id="main_content_qlist_h">상품 관리</h1>
			<br>
			<c:choose>
				<c:when test="${empty list || fn:length(list) ==0}">
					<h1>상품 준비중입니다</h1>
				</c:when>
				<c:otherwise>
					<br>
					<br>
					<div class="row" id="main_content_aProduct_btn">
						<button class="col-md-3">상품업데이트</button>
						<button class="col-md-3">상품삭제</button>
						<button class="col-md-3">상품수정</button>
						<button class="col-md-3">이미지등록</button>
					</div>
					<div>
						<div id="pfiles">
							<br>

							<form name="frm" action="pfileUploadOk.y" method="post"
								 enctype="Multipart/form-data">
								
							<h4>이미지 등록할 상품을 선택해주세요</h4>
							<br> <select name="pid">
								<c:forEach var="dto" items='${list }'>
									<option value="${dto.pid }">[${dto.pbrand }]
										${dto.pname }</option>
								</c:forEach>
							</select> <br> <br>
								<br>
								<br>

								<%-- 첨부파일 --%>
								<div
									style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border: 1px solid black;">
									<h4>첨부파일</h4>
									<button type="button" id="btnAdd">추가</button>
									<div id='files'></div>
								</div>
								<script
									src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
								<script>
									var i = 0;
									$("#btnAdd")
											.click(
													function() {
														$("#files")
																.append(
																		"<div><input type='file' name='upfile" + i + "'/><button type='button' onclick='$(this).parent().remove()'>삭제</button></div>");
														i++;
													});
								</script>

								<input type="submit" value="등록" />
							</form>
						</div>
						<!-- <script>
	var i = 0;
	
		$("#btnAdd").click(function(){
		   $("#files").append("<div><input type='file' name='upfile"+i+"'/><button type='button' onclick='$(this).parent().remove()'> - </button></div>");
			i++;
		});
	</script> -->


					</div>

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