<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- font-family: 'Do Hyeon', sans-serif;
font-family: 'Jua', sans-serif; -->


<script type="text/javascript" src="JS/wk.js"></script>
<link rel="stylesheet" href="CSS/wk.css" type="text/css">
<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<!-- <link rel="stylesheet" href="CSS/logo_menu.css" type="text/css"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">






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
						<li><a href="storeMain.y">스토어</a></li>
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
						<li><a href="#">나의 쇼핑</a></li>
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
						<li><a href="#">주문배송내역 조회</a></li>
						<li><a href="#">상품 스크랩북</a></li>
						<li id="Q_li"><a href="#">상품문의내역</a></li>
						<li><a href="#">포인트</a></li>
						<li><a href="#">고객센터</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
	</header>


	<!--내용부분입니다.  -->
	<div class="o_container">
		<div class="o_statusMenu row">
			<a class="order_status_list col-md-2">
				<div class="status_list">취소요청</div>
				<div class="status_figure_cancel" id="status_figure_cancel"></div>
			</a> <a class="order_status_list col-md-2">
				<div class="status_list">결제완료</div>
				<div class="status_figure_buy" id="status_figure_buy"></div>
			</a> <a class="order_status_list col-md-2">
				<div class="status_list">배송준비</div>
				<div class="status_figure">0</div>
			</a> <a class="order_status_list col-md-2">
				<div class="status_list">배송중</div>
				<div class="status_figure">0</div>
			</a> <a class="order_status_list col-md-2">
				<div class="status_list">배송완료</div>
				<div class="status_figure">0</div>
			</a> <a class="order_status_list col-md-2">
				<div class="status_list">구매확정</div>
				<div class="status_figure">0</div>
			</a>
		</div>

		<c:choose>
			<c:when test="${empty list || fn:length(list) ==0}">
				<div id="no_order">"구매하신 물품이 없습니다"</div>
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items='${list }'>
					<div class="date" id="date">구매일: ${dto.pcregdate }</div>
					<!-- 구매 시간  -->
					<div class="o_list row">
						<div class="o_image col-md-3">
							<img class="m_image" id="m_image" src="${dto.pimage}" />
							<!-- 이미지  -->
						</div>

						<div class="o_content col-md-7">
							<div class="ing" id="o_ing_1_${dto.pid}">
								<c:if test="${dto.pcstatus == 0 }">
									<a id="ing" style="color: rgb(255, 0, 0)"> 취소 요청 </a>
								</c:if>

								<c:if test="${dto.pcstatus == 1 }">
									<a id="ing" style="color: #35c5f0;"> 결제 완료</a>
								</c:if>
							</div>

							<div id="o_info">
								구매자:${dto.pcuid}<br>
							</div>

							<div id="o_info">
								상품명: ${dto.pname }<br>
							</div>

							<div id="o_info">
								브랜드: ${dto.pbrand }<br>
							</div>

							<div id="o_info">
								우편번호: ${dto.pcaddressnum }<br>
							</div>
							<div id="o_info">
								주소: ${dto.pcaddress }<br>
							</div>

							<div id="o_info">
								상세주소: ${dto.pcaddress2 }<br>
							</div>

							<div id="o_info">
								수량 :${dto.pclpcnt }<br>
							</div>
							<div id="o_info">
								합계: ${dto.ptotalprice }<br>
							</div>

							<div class="u_content" id="u_content">
								배송 메모: ${dto.pccontent }<br>
							</div>

							<!-- 배송메모 -->
							<div class="o_modify" id="u_modify_input_${dto.pid}">
								<label><b>배송 메모 수정</b></label>


								<form class="modify " action="updateOk.woo" method="post">
									<input type="hidden" name="pid" value="${dto.pid}"> <input
										id="memo_${dto.pid}" type="text"
										placeholder="${dto.pccontent }" name="pccontent">

									<div class="u_modify_1">
										<button id="u_modify_1_${dto.pid}" type="submit">수정</button>
									</div>


								</form>
							</div>
						</div>




						<div class="o_button col-md-2">
							<div class="u_modify_2">
								<button id="u_modify_2_${dto.pid}">수정하기</button>
							</div>
							<div class="u_cancel">
								<form action="cancelOk.woo" method="post">
									<button id="u_cancel_1_${dto.pid}" type="submit">취소 요청</button>
									<input type="hidden" name="pid" value="${dto.pid}"> <input
										id="u_pcstatus_${dto.pid}" type="hidden" name="pcstatus"
										value="${dto.pcstatus}">
								</form>
							</div>
						</div>


					</div>
				</c:forEach>

			</c:otherwise>
		</c:choose>
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