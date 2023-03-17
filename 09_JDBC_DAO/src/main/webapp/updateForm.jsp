<%@page import="myPkg.MartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>

<jsp:useBean id="mdao" class="myPkg.MartDao"/>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	
	String[] product = {"식품","의류","도서","가구"};
	String[] time = {"9시~11시","11시~1시","1시~5시","5시~9시"};
	String[] approve = {"카드","핸드폰"};
	
	// 넘어온 num에 대한 레코드값
	MartBean mb = mdao.getMartByNum(num);
	//String[] prod = mb.getProduct().split(" ");
%>

<h2>이마트 상품 구매 내역</h2>
<!-- form 안에 작성한 내용만 넘어간다. -->
<FORM name="myform" METHOD="post" ACTION="updateProc.jsp">

	<input type="hidden" name="num" value="<%=num%>">

	<span>아이디 :</span> <INPUT TYPE="text" NAME="id" value="<%=mb.getId()%>"><br>
	<span>비번 :</span> <INPUT TYPE="text" NAME="pw" value="<%=mb.getPw()%>"><br>
	<p>

	
	<span>구매상품:</span>
	<!-- <input type="checkbox" name="product" value="식품">식품
	<input type="checkbox" name="product" value="의류">의류
	<input type="checkbox" name="product" value="도서">도서
	<input type="checkbox" name="product" value="가구">가구 -->
	<%-- <%
	for (int i = 0; i < product.length; i++) {
	%>
	<input type="checkbox" name="product" value="<%=product[i]%>" 
	<%
		for(int j=0; j<prod.length; j++){
			if(product[i].equals(prod[j])){%>checked<%}
		}
	%>><%=product[i]%>
	<%
	}
	%> --%>
	<%
	for (int i = 0; i < product.length; i++) {
	%>
	<!-- 위에서처럼 split을 해도 되지만 ~가 포함되어 있는지 확인하는 contains를 사용해도 된다. -->
	<input type="checkbox" name="product" value="<%=product[i]%>" 
	<%if(mb.getProduct().contains(product[i])){%>checked<%}%>><%=product[i]%>
	<%
	}
	%>
	
	<p>
	<span>배송시간 :</span>
	<SELECT NAME="time">
		<OPTION VALUE="선택">선택</OPTION>
		<!-- <OPTION VALUE="9시~11시">9시~11시</OPTION>
		<OPTION VALUE="11시~1시">11시~1시</OPTION>
		<OPTION VALUE="1시~5시">1시~5시</OPTION>
		<OPTION VALUE="5시~9시">5시~9시</OPTION> -->
		<%
		for (String t : time) {
		%>
		<OPTION VALUE="<%=t%>" <%if(t.equals(mb.getTime())){%>selected<%}%>><%=t%></OPTION>
		<%
		}
		%>
	</SELECT>
	<p>

	<span>결제방법:</span>
	<!-- 카드 <INPUT TYPE="radio" NAME="approve" VALUE="카드">
	핸드폰 <INPUT TYPE="radio" NAME="approve" VALUE="핸드폰"> -->
	<%
	for (int i = 0; i < approve.length; i++) {
	%>
	<%=approve[i]%>
	<INPUT TYPE="radio" NAME="approve" VALUE="<%=approve[i]%>" <%if(approve[i].equals(mb.getApprove())){%>checked<%}%>>
	<%
	}
	%>
	
	<p>
	<span>결제 동의합니다. </span>
	<INPUT TYPE="checkbox" NAME="agree" id="agree" <%if(mb.getAgree().equals("동의함")){%>checked<%}%>>
	<p>

	<INPUT TYPE="submit" value="보내기" onClick="return check()">
		<!-- 나중에할것 -->
</FORM>