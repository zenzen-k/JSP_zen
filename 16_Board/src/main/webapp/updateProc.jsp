<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp(form5(입력) + 1(nun) + 1(pageNum)) => updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	
	String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
	BoardDao bdao = BoardDao.getInstance();
	
	int cnt = bdao.updateArticle(bb);
	
	String msg = "";
	String url = "";
	
	if(cnt == 1){
		response.sendRedirect("select.jsp?pageNum=" + pageNum);
	}else if(cnt == -2){
		// 비밀번호 틀렸을 때도 다시 작성내용 그대로 있으면 좋겠다~
		%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다");
			//location.href="updateForm.jsp?num=" + bb.getNum()" + "&pageNum=" + pageNum;
			history.go(-1); //바로 이전 페이지로 돌아가라.
		</script>
		<%
	}else{
		response.sendRedirect("updateForm.jsp?num=" + bb.getNum() + "&pageNum=" + pageNum);
	}
%>