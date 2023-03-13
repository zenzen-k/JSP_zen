<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

template.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("contentPage"); // products
	//System.out.println(contentPage);
%>

<h3>템플릿 페이지</h3><br>

<form method="post" action="control.jsp">
<table border='1' width="500" height="300">
  <tr>
    <th colspan="2">
    	<jsp:include page="top.jsp"/>
    </th>
  </tr>
  
  <tr>
    <td>
    	<jsp:include page="<%=contentPage + \"Left.jsp\"%>"/>
    </td>
    <td>
    	<b><%=contentPage%> 정보 페이지입니다.</b><br>
    	<jsp:include page='<%=contentPage + ".jsp"%>'/>
    </td>
  </tr>
  
  <tr>
    <th colspan="2">
    	<jsp:include page="bottom.jsp"/>
    </th>
  </tr>
</table>
</form>