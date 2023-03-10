<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
01_main.jsp <br>
<jsp:include page="01_sub.jsp">
	<jsp:param value="kim" name="name" /> 
</jsp:include>
<!-- name='kim' -->

<jsp:include page="01_sub.jsp"/>