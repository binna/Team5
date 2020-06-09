<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %> 

<%	
	int cnt = (Integer)request.getAttribute("delete");
	int qno = (Integer)request.getAttribute("qno");
	System.out.println("jsp");
	System.out.println(cnt);
	System.out.println(qno);
%>

<% if(cnt == 0) { %>
		<script>
			alert('삭제 실패');
			history.back();
		</script>
<% } else { %>
		<script>
			alert('삭제 성공');
			location.href = "view.community?no=<%= qno %>";
		</script>
<% } %>