<%@page import="DTO.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%-- <jsp:useBean id="dao" class="DTO.MovieDao"/> --%>
<jsp:useBean id="mb" class="DTO.MovieBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	MovieDao dao = MovieDao.getInstance();

	System.out.println("insert Proc dao : " + dao);
	
	String str = "";
	if(mb.getGenre() == null){
		str = "선택사항없음";
	}else{
		String[] genre = request.getParameterValues("genre");
		for(int i=0; i<genre.length; i++){
			str += genre[i] + ",";
		}
	}
	mb.setGenre(str);
	
	System.out.println(mb.getPartner());
	
	if(mb.getMemo() == null){
		mb.setMemo("없음");
	}
	int cnt = dao.insertMovie(mb);

	if(cnt==1)
		response.sendRedirect("select.jsp");
	else
		response.sendRedirect("insertForm.jsp");
%>
