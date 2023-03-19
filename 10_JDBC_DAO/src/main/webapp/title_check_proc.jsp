<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// title_check_proc.jsp<br>
	// 작성자가 작성한 title이 넘어온다
	// 위에서 주석과 공백들이 data에 다 들어간당 ㅠㅠ 스크립트릿 바깥에 쓰면 다 넘어감 안으로 넣어쥬기

	String usertitle = request.getParameter("usertitle");
	System.out.println("usertitle : " + usertitle);
%>
<jsp:useBean id="bdao" class="DTO.BookDao"/>
<%
	boolean isCheck = bdao.searchTitle(usertitle);
	System.out.println(isCheck);
	
	String str = "";
	// isCheck : true => 책이 있음
	if(isCheck){
		str = "NO"; // 사용하면안된다는 의미로 노 넣어봄!
		out.print(str);
	}else{
		str = "YES";
		out.print(str);
	}
	// 평소에는 out 객체가 웹브라우저에 출력하는 용도로 사용했던 내장객체였다.
	// 하지만 여기서는 아님! ajax 요청한곳으로 넘어감!
%>