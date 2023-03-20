<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bdao" class="DTO.BookDao"/>
<jsp:useBean id="bb" class="DTO.BookBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
String[] bookstore = request.getParameterValues("bookstore");
String bs = "";
for(int i=0; i<bookstore.length; i++){
	bs += bookstore[i] + " ";
}
bb.setBookstore(bs);

int cnt = bdao.updateBook(bb);

//결과
String msg = "수정실패";
String url = "updateForm.jsp?no=" + bb.getNo();

if(cnt>0){
	msg = "수정성공";
	url = "select.jsp";
	/* 또는 alert 안할거면 response로 바로이동! */
}
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>