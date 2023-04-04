<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>

<%@ include file="../display/mall_top.jsp"%>
<!-- 외부의 css파일을 가져올 때 link 태그 -->
<link rel="stylesheet" type="text/css" href="./style.css">
<style>
	body{
		text-align: center;
	}
	table{
		margin: auto;
		/* width: 700px; */
	}
</style>


<%
	int pageSize = 5; // 한 페이지에 5개 글이 보이도록 설정
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	// 내가 선택한 페이지 번호
	String pageNum = request.getParameter("pageNum");
	System.out.println("pageNum : " + pageNum);
	
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1; // 1페이지라면 (1-1) * 5 +1 = 1
	int endRow = currentPage * pageSize; // 1페이지라면 1 * 5 = 5
	
	// pageNum=1 일때 startRow=1 , endRow=5
	// pageNum=2 일때 startRow=6 , endRow=10
	// memo 보기 getArticles
	

	BoardDao bdao = BoardDao.getInstance();
	ArrayList<BoardBean> lists = null;
	int count = bdao.getArticleCount(); // 전체레코드수
	
	if(count > 0){
		lists = bdao.getArticles(startRow, endRow);
	}
	
	int number = count-(currentPage-1) * pageSize;
	// 1페이지 : 19(1-1)*5 ; -> 19
	// 1페이지 : 19(2-1)*5 ; -> 18
	
%>


<b>글목록(전체 글:<%=count%>)</b>
<table width="100%">
	<tr>
		<td align="right" bgcolor="<%=value_c%>">
			<a href="writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<%if(count == 0){%>
	<table width="100%">
		<tr>
			<td align="center" bgcolor="<%=value_c%>">
				게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</table>

<%}else{%>
	<table width="100%">
		<tr height="30" bgcolor="<%=title_c%>">
			<th>번 호</th>
			<th>제 목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조 회</th>
			<th>IP</th>
		</tr>
		<%for(BoardBean bb : lists){ %>
		<tr height="30" align="center" bgcolor="<%=value_c%>">
			<td><%=number--%></td> 
			<td align="left">
				<%
					int wid = 20;
					if(bb.getRe_level() > 0){ // 0보다 크다는 것은 원글이 아님. 즉 답글
						wid = 20 * bb.getRe_level(); // 1:20, 2:40, 3:60
				%>
						<img src="images/level.gif" width="<%=wid%>" height="10">
						<img src="images/re.gif">
				<%
					}
				%>
				
				<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a>
				<%
				if(bb.getReadcount()>=10){
					%>
					<img src="images/hot.gif" width="15">
					<%
				}
				%>
			</td>
			<td><%=bb.getWriter() %></td>
			<td><%=sdf.format(bb.getReg_date())%></td>
			<td><%=bb.getReadcount() %></td>
			<td><%=bb.getIp() %></td>
		</tr>
	<%}//for %>
	</table>
<%}%>

<%
	// 레코드가 하나라도 있으면 페이지설정함
	if(count>0){
		// 전체 필요한 페이지수 pageCount
		int pageCount = count/pageSize + (count%pageSize==0? 0 : 1);
		// 한번에 보일 페이지개수
		int pageBlock = 3;
		
		int startPage = ((currentPage-1) / pageBlock * pageBlock ) +1;
		int endPage = startPage + pageBlock - 1;
		// 1 => startPage= 1, endPage= 3
		// 3 => startPage= 1 -> ((3-1)/3*3)+1 , endPage= 3
		// 8 => 7, 9
		
		/* 만약 37개 레코드면 8페이지가 필요함
		 하지만 마지막에는 [7][8][9] 가되어버림. 이러면 안되므로
		if(pageCount<endPage){
			endPage = pageCount;
		}
		마지막페이지가 전체 페이지보다 크지 않게 해야한다.
		*/
		
		if(pageCount < endPage){
			endPage = pageCount;
		}
		
		if(startPage > 3){
		%>
		<!-- 현재 페이지의 시작페이지에서 3을 뻄! 7,8,9 는 4페이지로 , 4,5,6 은 1페이지로 -->
			<a href="select.jsp?pageNum=<%=startPage-3%>">[이전]</a>	
		<%
		}
		
		for(int i=startPage; i<=endPage; i++){
		%>
			<a href="select.jsp?pageNum=<%=i%>">[<%=i%>]</a>	
		<%	
		}
		
		if(endPage < pageCount){ /* 끝 페이지보다 필요한 페이지 개수가 더 많을때~ */
		%>
			<a href="select.jsp?pageNum=<%=endPage+1%>">[다음]</a> <!-- 또는 startPage+3 -->	
		<%
		}
	} // if
%>
<%@ include file="../display/mall_bottom.jsp"%>
