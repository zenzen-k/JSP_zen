<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- logout.jsp -->

<!-- 모든 세션설정 해제하기 -->

<%
	session.invalidate(); // 모든 세션 무효화
%>
<script type="text/javascript">
	location.href="main.jsp";
</script>