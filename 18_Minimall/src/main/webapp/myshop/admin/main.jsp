<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">

<!-- loginProc.jsp(admin 관리자 로그인) -> /myshop/admin/main.jsp<br> -->


<%-- <%@ include file="top.jsp" %> --%>

<jsp:include page="top.jsp"/>
	<td colspan="6" align="center">
		<img src="<%=request.getContextPath()%>/img/album-k.jpg" width="500" height="400">
	</td>

<%-- <%@ include file="bottom.jsp" %> --%>
<jsp:include page="bottom.jsp"/> <!-- 실행한 결과를 가져옴. 둘다 가능하다. -->