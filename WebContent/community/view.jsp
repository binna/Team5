<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %>

<%
	//Controller로부터 결과 데이터 받음
	WriteDTO[] arr = (WriteDTO[])request.getAttribute("view");
	CommentDTO[] arr2 = (CommentDTO[])request.getAttribute("CommentList");
%> 

<%
	int no = arr[0].getNo();
	String title = arr[0].getTitle();
	String content = arr[0].getContent();
	String regDate = arr[0].getRegDate();
	int clickCnt = arr[0].getClickCnt();
	String keyword = arr[0].getKeyword();
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 네모 네모 -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">

<!-- jQuery -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 내 스크립트 적용 -->
<script type="text/javascript" src="../JS/BN/write_view_bn.js"></script>

<!-- CSS 적용 -->
<link rel="stylesheet" href="../CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="../CSS/yj.css" type="text/css">
<link rel="stylesheet" href="../CSS/BN/main_write_view_bn.css" type="text/css">



<title>너네 집</title>

</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<body>
	<!-- 헤더 부분 -->
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
			<div calss="col-md-3">
				<button id="main_top2_app"></button>
				<a href="#">앱 다운로드</a>
			</div>

		</div>
		<hr>
	</header>


<!-- 작업해야할 메인 화면 -->
<main class="qna-detail">

<!-- 질문 내용 전체적인 화면 -->
<article class="qna-detail__container container">
  <section class="qna-detail__container__content">

  
    <!-- 질문과 답변, 질문 제목 노출 화면 -->
    <header class="qna-detail__content__header-container">
      <!-- 질문가 답변 헤더 -->
      <div class="qna-detail__content__header-top">
        <!-- 나중에 리스트 만들고 링크 설정하기 -->
        <a class="qna-detail__content__header-subtitle" href="#">질문과 답변</a>
      </div>

      <!-- 질문 제목 title -->
      <h1 class="qna-detail__content__header-title"><%= title %></h1>
      
      <!-- 수정 삭제 버튼 -->
      <div class="qna-detail__content__action-group">
      <a class="button button--color-gray-14-inverted button--size-30 button--shape-4 qna-detail__content__action-item" href="update.community?no=<%= no %>">수정</a>

      <button onclick="chkDelete(<%= no %>)" class="button button--color-gray-14-inverted button--size-30 button--shape-4 qna-detail__content__action-item" type="button">삭제</button>
      </div>
      </header>
	
      <!-- 모바일 버전 사용자 아이디 노출 -->
      <div class="qna-detail-author__profile-link__summary">
        <div class="qna-detail-author__profile-link__summary-section">
          <span class="qna-detail-author__profile-link__summary-nickname">모바일용 아이디 노출</span>
        </div>
        <div class="qna-detail-author__profile-link__summary-introduction"></div>
      </div>
	
      <!-- 질문 내용 content -->
      <section class="qna-detail__content__body">
      	<!-- 사용자가 작성한 문의내용이 들어와야 할 곳 -->
        <p><%= content %></p>
      </section>
      
      
      <!-- 키워드, 등록일, 조회, 댓글이 보여지는 총 화면단 -->
      <footer class="qna-detail__footer">

        <!-- 키워드 개수만큼 버튼 만들기 위해! 우선 데이터 먼저 받기 -->
        <input id="btn_keyword_value" name="keyword" value="<%= keyword %>" hidden="">
        <!-- 키워드 keyword -->
        <ul id="keyword_list_group" class="qna-detail__footer__keyword-list">
          <!-- keyword 내용 들어가는 곳, JS로 유동적으로 만듦 -->
		</ul>
		
		<!-- 사용자 정보와 공유 버튼 -->
		<aside class="qna-detail-actions qna-detail__footer__action-group">
			<div class="drop-down qna-detail-actions__wrapper">
				<button class="view_btn button--color-gray-14-inverted button--size-30 qna-detail-actions__action" type="button">
					<span class="qna-detail-actions__action__label">공유</span>
				</button>
			</div>
		</aside>
		

		<!-- 등록일, 조회 노출 -->
		<div class="qna-detail__footer__metadata">
		  <!-- 등록일 regDate 들어가는 곳 -->
		  <time><%= regDate %></time>
		  <!-- 조회수 chlickCnt 들어가는 곳 -->
		  <span>조회 <span class="qna-detail__footer__metadata-view-count-value"><%= clickCnt %></span></span>
		  <!-- 신고버튼 -->
		  <button class="qna-detail__footer__metadata-report-link" type="button">신고</button>
		</div>
      
      </footer>


      <!-- 댓글  작성하는 총 화면 노출단-->
      <section class="qna-detail__comment-section">
	      <section class="comment-feed">
	      	<!-- 댓글이 몇개인지 파악하여 노출 -->
		    <h1 class="comment-feed__header">댓글&nbsp;<span class="comment-feed__header__count"><%= arr2.length %></span></h1>
		      
		    <!-- 작성한 댓글 db에 보내기 위한 form -->
		    <form class="comment-feed__form" action="commentWriteOk.community?no=<%= no %>" accept-charset="UTF-8" method="post">
		      <div class="comment-feed__form__input">
		        <!-- 댓글 택스트 작성 영역 -->
		        <div class="comment-feed__form__content">
		          <!-- 댓글 hint, 댓글이 없을때만 노출하기 -->
		          <div class="comment-content-input">
		            <input class="comment-content-iDDt comment-feed__form__content__text" placeholder="댓글을 남겨 보세요." name="commentContent">
		          </div>
		        </div>
		        <!-- 댓글 등록 버튼, 등록하는 순간 DB에 저장되어야 함 -->
		        <div class="comment-feed__form__actions">
		          <button class="comment-feed__form__submit" aria-label="등록" type="submit">등록</button>
		        </div>
							
		      </div>
		      </form>
		      
		      <!-- 댓글 리스트 보는 곳 -->
		      <ul class="comment-feed__list">
		        <%
			        if(arr2 != null) {
			    		for(int i = 0; i < arr2.length; i++) {
		        %>
		        <!-- 실제 댓글 , 댓글 하나당 아래의 li 전체가 추가되어야 함-->
		        <li class="comment-feed__list__item">
		          <article class="comment-feed__item">
		            <!-- 댓글 남긴 사람과 댓글 내용 -->
		            <p class="comment-feed__item__content">
		              <span class="comment-feed__item__content__author__name">아이디</span>
		              <span class="comment-feed__item__content__content"><%= arr2[i].getCcomment() %></span>
		            </p>
		        
		            <!-- 댓글 등록 시간 노출 -->
		            <footer class="comment-feed__item__footer">
		              <time class="comment-feed__item__footer__time"><%= arr2[i].getCregDate() %></time>
		            </footer>
		          </article>
		        </li>
		        <%
			    		} // end for
			        } // end if
		        %>
		      </ul>
		      
	      </section>
	      
	  <!-- end 댓글  작성하는 총 화면 노출단 -->
      </section>


      <!-- 질문하러 가기, 모바일 버전에서 보여지기 위해서 필요...!! -->
      <aside class="qna-detail-aside qna-detail__aside">
        <div class="qna-detail-aside__section">
          <h2 class="qna-detail-aside__section__header">인테리어 궁금한 것물어보세요!</h2>
          <a href="write.community">
            <button class="view_btn button--size-60 button--color-blue qna-detail-aside__section__new-question-button" type="button">질문하러 가기</button>
          </a>
        </div>
      </aside>

</section>

<!-- 작성자, 공유, 질문하러 가기의 총 화면단 -->
<nav class="qna-detail__container__sidebar">
  <div data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="81" class="sticky-container" style="position: sticky; top: 81px;">
    <div class="sticky-child" style="position: relative">
      <div class="qna-detail__container__sidebar__content">
        <address class="qna-detail-author qna-detail__container__sidebar__author">
						
          <!-- 작성자 아이디 -->
          <div class="qna-detail-author__profile-link__summary-section qna-detail-author__profile-link__summary-nickname">사용자 이름</div>
          
        </address>
					
		<!-- 공유하기 버튼 -->
		<aside class="qna-detail-actions question__sidebar__actions">
          <div class="drop-down qna-detail-actions__wrapper">
	        <button class="view_btn button--color-gray-14-inverted button--size-30 qna-detail-actions__action" type="button">
              <span class="qna-detail-actions__action__label">공유</span>
            </button>
          </div>
		</aside>

 		<!-- 인테리어 궁금한 것 물어보세요 문구, 질문하러 가기 버튼 -->
 		<aside class="qna-detail-aside qna-detail__container__sidebar__aside">
 		  <div class="qna-detail-aside__section">
 		    <!-- 인테리어 궁금한 것 물어보세요 문구 -->
		    <h2 class="qna-detail-aside__section__header">인테리어 궁금한 것 물어보세요!</h2>
 		    <!-- 질문하러 가기 버튼 -->
 		    <a href="write.community">
 		      <button class="view_btn button--color-blue button--size-60 qna-detail-aside__section__new-question-button" type="button">질문하러 가기</button>
 		  	</a> 
 		  </div>
		</aside>
        		
		<!-- 끝end qna-detail__container__sidebar__content -->								
        </div>
      <!-- 끝end sticky-child -->
      </div>
    <!-- 끝end sticky-container -->
    </div>
    
  </nav>
</article>

<!-- end 작업해야할 메인 -->
</main>


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