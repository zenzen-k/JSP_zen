<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

deleteForm.jsp(글번호 num, 입력한 passwd, 돌아갈페이지번호) => deleteProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.deleteArticle(num, passwd);
	
	if(cnt == 1){
		int pageSize = 5;
		int count = bdao.getArticleCount();
		int pageCount = count/pageSize + (count%pageSize==0? 0 : 1);
		
		if(pageCount<pageNum){
			response.sendRedirect("select.jsp?pageNum="+(pageNum-1));
		}else{
			response.sendRedirect("select.jsp?pageNum="+pageNum);
		}
	}
	else{
	%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
			// location.href="deleteForm.jsp?num=< %=num%>" 이렇게 해도 ㄱㅊ
		</script>	
	<%
	}
%>