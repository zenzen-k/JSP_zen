<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
replyForm(form내용 5가지 + 3가지 부모정보) => replyProc.jsp<br>

<% 
	request.setCharacterEncoding("UTF-8");

	BoardDao bdao = BoardDao.getInstance();
	String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/> <!-- 5개가 넘어와서 5개의 setter메서드 호출 -->
<%
	// currentTimeMillis -> 긴 숫자형태로 리턴
	// Timestamp -> 숫자를 날짜로 바꿔준다
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	// 요청한 사람의 ip 주소
	bb.setIp(request.getRemoteAddr());
	
	int cnt = bdao.replyArticle(bb); 

	String msg = "작성 실패";
	String url = "replyForm.jsp?ref="+ bb.getRef() + "&re_step=" + bb.getRe_step() + "&re_level=" + bb.getRe_level() 
				+ "&pageNum=" + pageNum;
	
	if(cnt == 1){
		msg = "작성 성공";
		url = "select.jsp?pageNum=" + pageNum;
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>