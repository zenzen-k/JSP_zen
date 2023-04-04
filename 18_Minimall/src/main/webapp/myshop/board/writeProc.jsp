<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	BoardDao bdao = BoardDao.getInstance();
%>
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/> <!-- 5개가 넘어와서 5개의 setter메서드 호출 -->
<%
	// currentTimeMillis -> 긴 숫자형태로 리턴
	// Timestamp -> 숫자를 날짜로 바꿔준다
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	// 요청한 사람의 ip 주소
	bb.setIp(request.getRemoteAddr());
	
	int cnt = bdao.insertArticle(bb);

	String msg = "작성 실패";
	String url = "writeForm.jsp";
	
	if(cnt == 1){
		msg = "작성 성공";
		url = "select.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>