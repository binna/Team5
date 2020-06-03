<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	// Controller로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0) { %>
		<script>
			alert('등록 실패');
			//history.back();	// 브라우저가 직전에 직전 페이지(입력중 페이지로)
		</script>
<% } else { %>
		<script>
			alert('등록 성공');
			// TODO, 나중에 페이지 만들면 뷰 화면으로 노출 시킬 예정
			//history.back();	// 브라우저가 직전에 직전 페이지(입력중 페이지로)
		</script>
<% } %>