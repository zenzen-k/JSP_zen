<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

02_result.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
%>

<%-- 이름 : <%=name %><br>
비번 : <%=pw %><br> --%>

<%-- <jsp:include page="02_sub.jsp"/> --%>

<!-- 원래 값을 넘길때는 이렇게 작성해야한다. 그런데 아래 코드를 안써도 잘됐음. 안써도 ㄱㅊ -->
<%-- <jsp:include page="02_sub.jsp">
	<jsp:param value="<%=name %>" name="name" />
	<jsp:param value="<%=pw %>" name="pw" />
</jsp:include> --%>

<jsp:include page="02_sub.jsp">
	<jsp:param value="30" name="age" />
	<jsp:param value='<%=name + " 회원님"%>' name="name"/>
</jsp:include>